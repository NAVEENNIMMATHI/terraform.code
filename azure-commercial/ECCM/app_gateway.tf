
locals {
  fdqn                                  = "${var.application_acronym}-${var.environment_acronym}.kpmgcloudops.com"
  frontend_port_name                    = "${lower(var.application_acronym)}frontendport"
  frontend_ip_configuration_name        = "${lower(var.application_acronym)}frontendip"
  application_gateway_cert_name         = "${lower(var.application_acronym)}_frontend_digicert_pfx"
  backend_app_gateway_cert_name         = "${lower(var.application_acronym)}_backend_authentication_ase_cer"
  environment_type                      = var.environment_acronym
  environment_suffix                    = "${var.environment_acronym}"
  listener_name                         = "${var.application_acronym}-https-listener"
  request_routing_rule_name             = lower("${var.application_acronym}-${var.environment_acronym}-routing-rule")
  probe_name                            = "${var.application_acronym}-dev.kpmgcloudops.com"
  #probe_host_name                      = local.fqdn
  #listener_host_name                   = local.fqdn
}

resource "azurerm_public_ip" "appgateway_public_ip" {
  name                    = lower("pip-agw-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}")
  location                = module.eccm_rg.resource_group_location
  resource_group_name     = module.eccm_rg.resource_group_name
  domain_name_label       = "agw-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  sku                     = "Standard"
  allocation_method       = "Static"
  tags                    = var.tags
}

resource "azurerm_application_gateway" "eccm_app_gw" {
  name                = lower("agw-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}")
  resource_group_name = module.eccm_rg.resource_group_name
  location            = module.eccm_rg.resource_group_location
  #subnet_name         = module.eccm_agw_subnet.subnet_name
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
    #capacity = var.application_gateway.sku.capacity
  }

  firewall_policy_id = azurerm_web_application_firewall_policy.eccm_waf_policy.id

  # waf_configuration {
  #   enabled              = "true"
  #   firewall_mode        = "Detection"
  #   rule_set_version     = "3.0"
  #   request_body_check   = "false"
  # }

  autoscale_configuration {
    min_capacity = 1
    max_capacity = 10
  }

  gateway_ip_configuration {
    name      = "appGatewayIpConfig"
    subnet_id = module.eccm_agw_subnet.subnet_id
  }

  frontend_port {
    name = local.frontend_port_name
    port = 443
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.appgateway_public_ip.id
  }

  http_listener {
    name                           = "${var.application_acronym}-https-listener"
    host_name                      = "${var.application_acronym}service-${var.environment_acronym}.kpmgcloudops.com"
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    #require_sni                    = "true"
    ssl_certificate_name           = local.application_gateway_cert_name
  }

  backend_http_settings {
    name                  = "${lower(var.application_acronym)}-${lower(local.environment_type)}-https-settings"
    cookie_based_affinity = "Enabled"
    affinity_cookie_name = "ApplicationGatewayAffinity"
    port                  = 443
    protocol              = "Https"
    host_name             = "${var.application_acronym}service-${var.environment_acronym}.kpmgcloudops.com"
    request_timeout       = 30
    probe_name            = "${lower(var.application_acronym)}${lower(local.environment_type)}-probe"
  
  #   authentication_certificate {
  #     name = local.backend_app_gateway_cert_name
  #   }
  }

 backend_address_pool {
    name         = "lap-backendpool"
    fqdns        = [
                    "lap-use-eccm-${local.environment_suffix}.azurewebsites.net",
                  ]
  }
  

  request_routing_rule {
    name                       = local.request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = "${var.application_acronym}-https-listener"
    backend_address_pool_name  = "lap-backendpool"
    backend_http_settings_name = "${lower(var.application_acronym)}-${lower(local.environment_type)}-https-settings"
    priority                   = 20
  }

  probe {
    host                = "lap-use-eccm-${local.environment_suffix}.azurewebsites.net"
    name                = "${lower(var.application_acronym)}${lower(local.environment_type)}-probe"
    protocol            = "Https"
    path                = "/"
    interval            = "30"
    timeout             = "30"
    unhealthy_threshold = "3"

    match {
      status_code = [
      "200-399"]
    }
  }

   #Enable when receive the SSL cert
  ssl_certificate {
    name     = local.application_gateway_cert_name
    data     = filebase64("${var.frontend_pfx_cert_name}.pfx")
    password = ""
  }

  tags = var.tags
  # lifecycle {
  #   ignore_changes = [
  #     ssl_certificate
  #   ]
  # }
}



# ####### Daiagnotic #########
# resource "azurerm_monitor_diagnostic_setting" "eccm_waf_logs" {
#   name                       = "app_gateway_waf_logs"
#   target_resource_id         = azurerm_application_gateway.eccm_app_gw.id
#   log_analytics_workspace_id = data.azurerm_log_analytics_workspace.spoke_law.id

#  log {
#     category = "ApplicationGatewayFirewallLog"
#     enabled  = true

#     retention_policy {
#       enabled = true
#       days = 30
#     }
#   }
#   log {
#     category = "ApplicationGatewayAccessLog"
#     enabled  = true

#     retention_policy {
#       enabled = true
#       days = 30
#     }
#   }
#   log {
#     category = "ApplicationGatewayPerformanceLog"
#     enabled  = true

#     retention_policy {
#       enabled = true
#       days = 30
#     }
#   }

#   metric {
#           category = "AllMetrics"
#           enabled  = false

#           retention_policy {
#               days    = 0
#              enabled = false
#             }
#         }

# }