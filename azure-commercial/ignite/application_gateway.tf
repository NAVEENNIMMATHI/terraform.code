
locals {
  frontend_port_name                     = "${var.application_acronym}frontendport"
  frontend_ip_configuration_name         = "${var.application_acronym}frontendip"
}

module "gateway_public_ip" {
  source                    = "../../modules12/public_ip_domain_label"
  public_ip_name            = "pip-appgateway-${var.application_acronym}-${var.engagement_name}${var.separator}${var.environment}"
  resource_group_name       = module.ignite_rg.resource_group_name
  resource_group_location   = module.ignite_rg.resource_group_location
  sku                       = "Standard"   #"Basic" # waf_v2 must have standard
  allocation_method         = "Static" #"Dynamic"  # Standard must use static
  domain_name_label         = "agw-use-${var.application_acronym}-${var.engagement_name}${var.separator}${var.environment}"

  tags                      = var.tags
}

resource "azurerm_application_gateway" "application_gateway" {
  name                = "agw-use-${var.application_acronym}-${var.engagement_name}${var.separator}${var.environment}"
  resource_group_name = module.ignite_rg.resource_group_name
  location            = module.ignite_rg.resource_group_location

  ssl_policy {
    policy_type          = "Custom"
    min_protocol_version = "TLSv1_2"
    cipher_suites = ["TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384", "TLS_RSA_WITH_AES_256_GCM_SHA384", "TLS_RSA_WITH_AES_128_GCM_SHA256", "TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384", "TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256"]
  }

  sku {
    name     = var.application_gateway_sku_name
    tier     = var.application_gateway_sku_tier
  }

  # Autoscaling: Yes (0,10)
  autoscale_configuration {
    min_capacity = 0
    max_capacity = 10
  }

  firewall_policy_id = azurerm_web_application_firewall_policy.ignite_custom_waf_policy.id

  gateway_ip_configuration {
    name      = "applicationGatewayIpConfig"
    subnet_id = module.ignite_agw_subnet.subnet_id
  }

  frontend_port {
    name = local.frontend_port_name
    port = 443
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = module.gateway_public_ip.public_ip_id
  }

  rewrite_rule_set {
    name = "Append-Security-Headers"
    rewrite_rule {
      name = "Rewrite-Headers"
      rule_sequence = 100
      response_header_configuration {
        header_name = "X-XSS-Protection"
        header_value = "1; mode=block"
      }
      response_header_configuration {
        header_name = "X-Frame-Options"
        header_value = "SAMEORIGIN"
      }
      response_header_configuration {
        header_name = "Access-Control-Allow-Origin"
        header_value = "https://\u007Bvar_host\u007D"
      }
      response_header_configuration {
        header_name = "Content-Security-Policy"
        header_value = "default-src 'self'; img-src 'self' data: https://validator.swagger.io; style-src 'self' 'unsafe-inline'; script-src 'self' 'unsafe-inline' 'unsafe-eval'; font-src 'self' data: about:; block-all-mixed-content;"
      }
    }
  }
  rewrite_rule_set {
    name = "Ignite-Ui-Security-Headers"
    rewrite_rule{
      name = "Rewrite-Headers"
      rule_sequence = 100
      response_header_configuration {
        header_name = "Cache-Control"
        header_value = "no-store"
      }
      response_header_configuration {
        header_name = "X-XSS-Protection"
        header_value = "1; mode=block"
      }
      response_header_configuration {
        header_name = "X-Content-Type-Options"
        header_value = "nosniff"
      }
      response_header_configuration {
        header_name = "Pragma"
        header_value = "no-cache"
      }
      response_header_configuration {
        header_name = "Server"
        header_value = "Gateway"
      }
      response_header_configuration {
        header_name = "Sec-Fetch-Site"
        header_value = "same-origin"
      }
      response_header_configuration {
        header_name = "Access-Control-Allow-Origin"
        header_value = "https://igniteui${var.engagement_name}${var.environment_acronym}.kpmgcloudops.com"
      }
      response_header_configuration {
        header_name = "Access-Control-Allow-Credentials"
        header_value = "true"
      }
    }
  }

  tags = var.tags


  ######################################################################
  # SITE-SPECIFIC SETTINGS
  ######################################################################
  

  # Site #1: Ignite JUP

  ssl_certificate {
    name     = var.ignite_jup_fqdn
    data     = filebase64("${var.jup_pfx_cert_name}.pfx")
    password = ""
  }

  backend_address_pool {
    name = "${var.ignite_jup_fqdn}-backend-pool"
    ip_addresses = var.backend_address_pool_ips
  }

  backend_http_settings {
    name                           = "${var.ignite_jup_fqdn}-https-settings"
    host_name                      = var.ignite_jup_fqdn
    cookie_based_affinity          = "Enabled"
    port                           = 443
    protocol                       = "Https"
    request_timeout                = 30
    probe_name                     = "${var.ignite_jup_fqdn}-probe"
  }

  http_listener {
    name                           = "${var.ignite_jup_fqdn}-https-listener"
    host_name                      = var.ignite_jup_fqdn
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    ssl_certificate_name           = var.ignite_jup_fqdn
    require_sni                    = false
  }

  request_routing_rule {
    name                       = "${var.ignite_jup_fqdn}-routing-rule"
    rule_type                  = "Basic"
    http_listener_name         = "${var.ignite_jup_fqdn}-https-listener"
    backend_address_pool_name  = "${var.ignite_jup_fqdn}-backend-pool"
    backend_http_settings_name = "${var.ignite_jup_fqdn}-https-settings"
    rewrite_rule_set_name      = "Append-Security-Headers"
  }

  probe {
    name                = "${var.ignite_jup_fqdn}-probe"
    host                = var.ignite_jup_fqdn
    protocol            = "Https"
  #  path                = "/jupserver2/"
    path                = "/"
    interval            = "30"
    timeout             = "30"
    unhealthy_threshold = "3"
    match {
      status_code = ["200-399","503"]
    }
  }
 
  # Site #2: Ignite API

  ssl_certificate {
    name     = var.ignite_api_fqdn
    data     = filebase64("${var.api_pfx_cert_name}.pfx")
    password = ""
  }

  backend_address_pool {
    name = "${var.ignite_api_fqdn}-backend-pool"
    ip_addresses = var.backend_address_pool_ips
  }

  backend_http_settings {
    name                           = "${var.ignite_api_fqdn}-https-settings"
    host_name                      = var.ignite_api_fqdn
    cookie_based_affinity          = "Disabled"
    port                           = 443
    protocol                       = "Https"
    request_timeout                = 1800
    probe_name                     = "${var.ignite_api_fqdn}-probe"
  }

  http_listener {
    name                           = "${var.ignite_api_fqdn}-https-listener"
    host_name                      = var.ignite_api_fqdn
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    ssl_certificate_name           = var.ignite_api_fqdn
    require_sni                    = false
  }

  request_routing_rule {
    name                       = "${var.ignite_api_fqdn}-routing-rule"
    rule_type                  = "Basic"
    http_listener_name         = "${var.ignite_api_fqdn}-https-listener"
    backend_address_pool_name  = "${var.ignite_api_fqdn}-backend-pool"
    backend_http_settings_name = "${var.ignite_api_fqdn}-https-settings"
    rewrite_rule_set_name      = "Append-Security-Headers"
  }

  probe {
    name                = "${var.ignite_api_fqdn}-probe"
    host                = var.ignite_api_fqdn
    protocol            = "Https"
   # path                = "/api/v3"
    path                = "/api/v3/api_docs/"
    interval            = "30"
    timeout             = "30"
    unhealthy_threshold = "3"
    match {
     # status_code = ["200-499"]
      status_code = ["200-399"]
    }
  }

  # Site #3: Ignite MIO

  ssl_certificate {
    name     = var.ignite_mio_fqdn
    data     = filebase64("${var.mio_pfx_cert_name}.pfx")
    password = ""
  }

  backend_address_pool {
    name = "${var.ignite_mio_fqdn}-backend-pool"
    ip_addresses = var.backend_address_pool_ips
  }

  backend_http_settings {
    name                           = "${var.ignite_mio_fqdn}-https-settings"
    host_name                      = var.ignite_mio_fqdn
    cookie_based_affinity          = "Enabled"
    port                           = 443
    protocol                       = "Https"
    request_timeout                = 30
    probe_name                     = "${var.ignite_mio_fqdn}-probe"
  }

  http_listener {
    name                           = "${var.ignite_mio_fqdn}-https-listener"
    host_name                      = var.ignite_mio_fqdn
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    ssl_certificate_name           = var.ignite_mio_fqdn
    require_sni                    = false
  }

  request_routing_rule {
    name                       = "${var.ignite_mio_fqdn}-routing-rule"
    rule_type                  = "Basic"
    http_listener_name         = "${var.ignite_mio_fqdn}-https-listener"
    backend_address_pool_name  = "${var.ignite_mio_fqdn}-backend-pool"
    backend_http_settings_name = "${var.ignite_mio_fqdn}-https-settings"
    rewrite_rule_set_name      = "Append-Security-Headers"
  }

  probe {
    name                = "${var.ignite_mio_fqdn}-probe"
    host                = var.ignite_mio_fqdn
    protocol            = "Https"
    path                = "/minio/login"
    interval            = "30"
    timeout             = "30"
    unhealthy_threshold = "3"
    match {
      status_code = ["200-403"]
    }
  }

  # Site #4: IgniteUI API

  ssl_certificate {
    name     = var.ignite_ui_api_fqdn
    data     = filebase64("${var.ui_api_pfx_cert_name}.pfx")
    password = ""
  }

  backend_address_pool {
    name = "${var.ignite_ui_api_fqdn}-backend-pool"
    ip_addresses = var.backend_address_pool_ips
  }

  backend_http_settings {
    name                           = "${var.ignite_ui_api_fqdn}-https-settings"
    host_name                      = var.ignite_ui_api_fqdn
    cookie_based_affinity          = "Enabled"
    port                           = 443
    protocol                       = "Https"
    request_timeout                = 5400
    probe_name                     = "${var.ignite_ui_api_fqdn}-probe"
    path                           = "/"
  }

  http_listener {
    name                           = "${var.ignite_ui_api_fqdn}-https-listener"
    host_name                      = var.ignite_ui_api_fqdn
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    ssl_certificate_name           = var.ignite_ui_api_fqdn
    require_sni                    = false
  }

  request_routing_rule {
    name                       = "${var.ignite_ui_api_fqdn}-routing-rule"
    rule_type                  = "Basic"
    http_listener_name         = "${var.ignite_ui_api_fqdn}-https-listener"
    backend_address_pool_name  = "${var.ignite_ui_api_fqdn}-backend-pool"
    backend_http_settings_name = "${var.ignite_ui_api_fqdn}-https-settings"
    rewrite_rule_set_name      = "Ignite-Ui-Security-Headers"
  }

  probe {
    name                = "${var.ignite_ui_api_fqdn}-probe"
    host                = var.ignite_ui_api_fqdn
    protocol            = "Https"
    path                = "/swagger"
    interval            = "30"
    timeout             = "30"
    unhealthy_threshold = "3"
    match {
      status_code = ["200-403"]
    }
  }
  # Site #5: Igniteui DV

  ssl_certificate {
    name     = var.ignite_ui_fqdn
    data     = filebase64("${var.ui_pfx_cert_name}.pfx")
    password = ""
  }

  backend_address_pool {
    name = "${var.ignite_ui_fqdn}-backend-pool"
    ip_addresses = var.backend_address_pool_ips
  }

  backend_http_settings {
    name                           = "${var.ignite_ui_fqdn}-https-settings"
    host_name                      = var.ignite_ui_fqdn
    cookie_based_affinity          = "Enabled"
    port                           = 443
    protocol                       = "Https"
    request_timeout                = 5400
    probe_name                     = "${var.ignite_ui_fqdn}-probe"
    path                           = "/"
  }

  http_listener {
    name                           = "${var.ignite_ui_fqdn}-https-listener"
    host_name                      = var.ignite_ui_fqdn
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    ssl_certificate_name           = var.ignite_ui_fqdn
    require_sni                    = true
  }

  request_routing_rule {
    name                       = "${var.ignite_ui_fqdn}-routing-rule"
    rule_type                  = "Basic"
    http_listener_name         = "${var.ignite_ui_fqdn}-https-listener"
    backend_address_pool_name  = "${var.ignite_ui_fqdn}-backend-pool"
    backend_http_settings_name = "${var.ignite_ui_fqdn}-https-settings"
    rewrite_rule_set_name      = "Ignite-Ui-Security-Headers"
  }

  probe {
    name                = "${var.ignite_ui_fqdn}-probe"
    host                = var.ignite_ui_fqdn
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
    

resource "azurerm_monitor_diagnostic_setting" "application_gateway_diag" {
  name                       = "agw-use-${var.application_acronym}-${var.engagement_name}${var.separator}${var.environment}-diag"
  target_resource_id         = azurerm_application_gateway.application_gateway.id
 log_analytics_workspace_id  = data.azurerm_log_analytics_workspace.log_analytics_workspace.id

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
