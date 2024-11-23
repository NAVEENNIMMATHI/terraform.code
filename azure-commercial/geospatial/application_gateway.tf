locals {
  frontend_port_name                    = "${lower(var.application_acronym)}${var.separator}frontendport"
  frontend_ip_configuration_name        = "${lower(var.application_acronym)}${var.separator}frontendip"
  environment_type                      = var.application_gateway.environment_acronym
  environment_suffix                    = var.application_gateway.environment_acronym == "" ? "" : "-${var.application_gateway.environment_acronym}"
}

resource "azurerm_public_ip" "appgateway_public_ip" {
  name                    = lower("pip-agw-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}")
  location                = module.geospatial_rg.resource_group_location
  resource_group_name     = module.geospatial_rg.resource_group_name
  domain_name_label       = "agw-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  sku                     = "Standard"
  allocation_method       = "Static"
  tags                    = var.tags
}

resource "azurerm_application_gateway" "arcgis_agw" {
  name                = lower("agw-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}")
  resource_group_name = module.geospatial_rg.resource_group_name
  location            = module.geospatial_rg.resource_group_location
  ssl_policy {
    policy_type          = "Custom"
    min_protocol_version = "TLSv1_2"
    cipher_suites = [
      "TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384",
      "TLS_RSA_WITH_AES_256_GCM_SHA384",
      "TLS_RSA_WITH_AES_128_GCM_SHA256",
      "TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384",
    "TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256"]
  }

  #Common Configuration Start
  sku {
    name     = var.application_gateway.sku.name
    tier     = var.application_gateway.sku.tier
  }

  autoscale_configuration {
    min_capacity = 1
    max_capacity = 10
  }

  firewall_policy_id = azurerm_web_application_firewall_policy.arcgis_custom_waf_policy.id

  gateway_ip_configuration {
    name      = "applicationGatewayIpConfig"
    subnet_id = module.geospatial_agw_subnet.subnet_id
  }
  frontend_port {
    name = local.frontend_port_name
    port = 443
  }
  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.appgateway_public_ip.id
  }

  #Common Configuration End

  backend_address_pool {
    name         = "aksapp-backendpool"
    ip_addresses = var.backend_address_pool_ips
}

  backend_http_settings {
    name                  = "${lower(var.application_acronym)}-aks${lower(local.environment_suffix)}-https-settings"
    host_name             = var.aks_cert_name
    cookie_based_affinity = "Enabled"
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 60
    probe_name            = "${lower(var.application_acronym)}-aks${lower(local.environment_suffix)}-probe"

  }

  http_listener {
    name                           = "aks-https-listener"
    host_name                      = var.aks_cert_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = var.aks_cert_name
  }

  request_routing_rule {
    name                       = "${lower(var.application_acronym)}-aks${lower(local.environment_type)}-routing-rule"
    rule_type                  = "Basic"
    http_listener_name         = "aks-https-listener"
    backend_address_pool_name  = "aksapp-backendpool"
    backend_http_settings_name = "${lower(var.application_acronym)}-aks${lower(local.environment_suffix)}-https-settings"
    priority                   = 10
  }

  probe {
    host                       = var.aks_cert_name
    name                       = "${lower(var.application_acronym)}-aks${lower(local.environment_suffix)}-probe"
    protocol                   = "Https"
    path                       = "/arcgis/manager"
    interval                   = "30"
    timeout                    = "30"
    unhealthy_threshold        = "3"
    match {
      status_code = [
      "200-399"]
    }
  }
  ssl_certificate {
    name     = var.aks_cert_name
    data     = filebase64("${var.aks_cert_name}")
    password = ""
  }
  
  tags    = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "arcgis_waf_logs" {
  name                       = "agw-${var.location_acronym}-${var.application_acronym}-diag-${var.environment_acronym}"
  target_resource_id         = azurerm_application_gateway.arcgis_agw.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.spoke_law.id

 log {
    category = "ApplicationGatewayFirewallLog"
    enabled  = true

    retention_policy {
      enabled = true
      days = 30
    }
  }
  log {
    category = "ApplicationGatewayAccessLog"
    enabled  = true

    retention_policy {
      enabled = true
      days = 30
    }
  }
  log {
    category = "ApplicationGatewayPerformanceLog"
    enabled  = true

    retention_policy {
      enabled = true
      days = 30
    }
  }

  metric {
          category = "AllMetrics"
          enabled  = false

      retention_policy {
           days    = 0
           enabled = false
      }
    }
}