resource "azurerm_public_ip" "aks_agw" {
  count               = 1

  name                = "pip-${var.location_acronym}-${var.application_acronym}-aks-agw-${var.environment_acronym}"
  resource_group_name = azurerm_resource_group.aks[0].name # indexing since resource group is created with count
  location            = azurerm_resource_group.aks[0].location
  allocation_method   = "Static"
  sku                 = "Standard"
  ip_version          = "IPv4"
  domain_name_label   = "agw-${var.location_acronym}-${var.application_acronym}-aks-${var.environment_acronym}"

  tags                = var.tags_Artifactory
}

resource "azurerm_application_gateway" "aks" {
  count               = 1
  name                = "agw-use-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name = azurerm_resource_group.aks[0].name # indexing since resource group is created with count
  location            = azurerm_resource_group.aks[0].location

  ssl_policy {
    policy_type          = "Custom"
    min_protocol_version = "TLSv1_2"
    cipher_suites = [
        "TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384",
        "TLS_RSA_WITH_AES_256_GCM_SHA384",
        "TLS_RSA_WITH_AES_128_GCM_SHA256",
        "TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384",
        "TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256"
    ]
  }

  sku {
    name     = var.core_aks_agw_sku_name
    tier     = var.core_aks_agw_sku_tier
  }

  # Autoscaling: Yes (0,10)
  autoscale_configuration {
    min_capacity = 0
    max_capacity = 10
  }

  firewall_policy_id = azurerm_web_application_firewall_policy.core_aks_agw_policy[0].id

  gateway_ip_configuration {
    name      = "applicationGatewayIpConfig"
    subnet_id = azurerm_subnet.aks_agw.id
  }

  frontend_port {
    name = "appGatewayFrontendPort"
    port = 443
  }

  frontend_ip_configuration {
    name                 = "appGatewayFrontendIP"
    public_ip_address_id = azurerm_public_ip.aks_agw[0].id
  }

  rewrite_rule_set {
    name = "Append-Security-Headers"
    rewrite_rule {
      name = "Rewrite-Headers"
      rule_sequence = 100

      response_header_configuration {
        header_name = "X-Frame-Options"
        header_value = "SAMEORIGIN"
      }
    }
  }

  tags = var.tags_Artifactory

  ##########################
  # SITE-SPECIFIC SETTINGS #
  ##########################

  # Artifactory

  ssl_certificate {
    name     = var.artifactory_fqdn
    data     = filebase64("${var.artifactory_cert_name}.pfx")
    password = ""
  }

  backend_address_pool {
    name = "artifactoryBackendPool"
    ip_addresses = var.artifactory_backend_address_pool_ips
  }

  backend_http_settings {
    name                           = "artifactoryHttpsSettings"
    host_name                      = var.artifactory_fqdn
    cookie_based_affinity          = "Enabled"
    port                           = 443
    protocol                       = "Https"
    request_timeout                = 120
    probe_name                     = "artifactoryProbe"
  }

  http_listener {
    name                           = "artifactoryHttpsListener"
    host_name                      = var.artifactory_fqdn
    frontend_ip_configuration_name = "appGatewayFrontendIP"
    frontend_port_name             = "appGatewayFrontendPort"
    protocol                       = "Https"
    ssl_certificate_name           = var.artifactory_fqdn
  }

  request_routing_rule {
    name                       = "artifactoryRoutingRule"
    rule_type                  = "Basic"
    http_listener_name         = "artifactoryHttpsListener"
    backend_address_pool_name  = "artifactoryBackendPool"
    backend_http_settings_name = "artifactoryHttpsSettings"
    rewrite_rule_set_name      = "Append-Security-Headers"
  }

  probe {
    name                = "artifactoryProbe"
    host                = var.artifactory_fqdn
    protocol            = "Https"
    path                = "/"
    interval            = "30"
    timeout             = "30"
    unhealthy_threshold = "3"
    match {
      status_code = ["200-399"]
    }
  }
}


resource "azurerm_monitor_diagnostic_setting" "aks_agw_diag" {
  count                       = 1
  name                        = "agw-use-${var.application_acronym}-${var.environment_acronym}-diag"
  target_resource_id          = azurerm_application_gateway.aks[0].id
  log_analytics_workspace_id  = data.azurerm_log_analytics_workspace.hub.id

  log {
    category = "ApplicationGatewayAccessLog"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  log {
    category = "ApplicationGatewayPerformanceLog"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  log {
    category = "ApplicationGatewayFirewallLog"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = false
    }
  }
}