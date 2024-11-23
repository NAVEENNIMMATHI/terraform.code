locals {
  frontend_port_name             = "${lower(var.application_acronym)}frontendport"
  frontend_ip_configuration_name = "${lower(var.application_acronym)}frontendip"
  application_gateway_cert_name  = "tenant1-${lower(var.application_acronym)}${local.environment_type}-kpmgcloudops-com-pfx" #"tenant1-cmpdev-kpmgcloudops-com-pfx" 
  backend_app_gateway_cert_name  = "${lower(var.application_acronym)}_backend_authentication_ase_cer"
  environment_type               = var.application_gateway.environment_acronym
  environment_suffix             = var.application_gateway.environment_acronym == "" ? "" : "-${var.application_gateway.environment_acronym}"
  rest_prefix                    = "${lower(var.application_acronym)}rest${lower(local.environment_type)}"
}

resource "azurerm_application_gateway" "cmp_agw" {
  name                = lower("agw-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}")
  resource_group_name = module.cmp_rg_shared.resource_group_name
  location            = module.cmp_rg_shared.resource_group_location
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
    name = var.application_gateway.sku.name
    tier = var.application_gateway.sku.tier
    #capacity = var.application_gateway.sku.capacity
  }
  waf_configuration {
    enabled          = "true"
    firewall_mode    = "Detection"
    rule_set_version = "3.0"
  }

  autoscale_configuration {
    min_capacity = 1
    max_capacity = 10
  }

  dynamic "backend_address_pool" {
    for_each = var.cmp_clients
    content {
      name = "${backend_address_pool.value.name}-backendpool"
    }
  }

  gateway_ip_configuration {
    name      = "applicationGatewayIpConfig"
    subnet_id = module.cmp_agw_subnet.subnet_id
  }
  frontend_port {
    name = local.frontend_port_name
    port = 443
  }
  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.cmp_agw_public_ip.id
  }
  #Common Configuration End


  dynamic "backend_http_settings" {
    for_each = var.cmp_clients
    content {
      name                  = "${lower(var.application_acronym)}${lower(local.environment_suffix)}-${lower(backend_http_settings.value.name)}-https-settings"
      cookie_based_affinity = "Enabled"
      affinity_cookie_name  = "ApplicationGatewayAffinity"
      port                  = 80
      protocol              = "Http"
      request_timeout       = 30
      probe_name            = "${backend_http_settings.value.name}-${lower(var.application_acronym)}${lower(local.environment_suffix)}-probe"
    }
  }

  dynamic "http_listener" {
    for_each = var.cmp_clients
    content {
      name                           = lower("${var.application_acronym}${local.environment_type}-${lower(http_listener.value.name)}-https-listener")
      host_name                      = var.environment_acronym == "pd" ? lower("${http_listener.value.name}.${var.application_acronym}.kpmgcloudops.com") : lower("${http_listener.value.name}.${var.application_acronym}${local.environment_type}.kpmgcloudops.com")
      frontend_ip_configuration_name = local.frontend_ip_configuration_name
      frontend_port_name             = local.frontend_port_name
      protocol                       = "Https"
      require_sni                    = "true"
      ssl_certificate_name           = "${lower(http_listener.value.name)}-${lower(var.application_acronym)}${local.environment_type}-kpmgcloudops-com-pfx"
    }
  }

  dynamic "request_routing_rule" {
    for_each = var.cmp_clients
    content {
      name                       = "${lower(var.application_acronym)}${lower(local.environment_type)}-${lower(request_routing_rule.value.name)}-routing-rule"
      rule_type                  = "Basic"
      http_listener_name         = "${lower(var.application_acronym)}${lower(local.environment_type)}-${lower(request_routing_rule.value.name)}-https-listener"
      backend_address_pool_name  = "${request_routing_rule.value.name}-backendpool"
      backend_http_settings_name = "${lower(var.application_acronym)}${lower(local.environment_suffix)}-${lower(request_routing_rule.value.name)}-https-settings"
    }
  }

  dynamic "probe" {
    for_each = var.cmp_clients
    content {
      host                = var.environment_acronym == "pd" ? "${probe.value.name}.${lower(var.application_acronym)}.kpmgcloudops.com" : "${probe.value.name}.${lower(var.application_acronym)}${lower(local.environment_type)}.kpmgcloudops.com"
      name                = "${probe.value.name}-${lower(var.application_acronym)}${lower(local.environment_suffix)}-probe"
      protocol            = "Http"
      path                = "/"
      interval            = "30"
      timeout             = "30"
      unhealthy_threshold = "3"

      match {
        status_code = [
        "200-399"]
      }
    }

  }


  dynamic "ssl_certificate" {
    for_each = var.cmp_clients
    content {
    #name     = local.application_gateway_cert_name
    name     = "${lower(ssl_certificate.value.name)}-${lower(var.application_acronym)}${local.environment_type}-kpmgcloudops-com-pfx"
    #data     = filebase64("${var.frontend_pfx_cert_name}.pfx") "tenant1.cmpdev.kpmgcloudops.com"
    data     = filebase64("${ssl_certificate.value.name}.${var.application_acronym}${local.environment_type}.kpmgcloudops.com.pfx")
    password = ""
    #key_vault_secret_id = data.azurerm_key_vault_secret.ssl_certificate.id
    }
  }

  tags = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "application_gateway_diag" {
  name                       = "agw-use-${var.application_acronym}-${var.environment_acronym}-diag"
  target_resource_id         = azurerm_application_gateway.cmp_agw.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.spoke_law.id

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