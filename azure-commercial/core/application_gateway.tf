locals {
  frontend_port_name             = "appGatewayFrontendPort"
  frontend_ip_configuration_name = "appGatewayFrontendIP"
  app_backend_address_pool_name  = "appGatewayBackendPool"
  app_http_setting_name          = "appGatewayBackendHttpSettings"
  app_listener_name              = "appGatewayHttpListener"
  app_request_routing_rule_name  = "rule1"
  app_probe_name                 = "rdsssprhp"
  app_probe_host_name            = "rdgw-passwordreset.kpmgcloudops.com"
  app_cert_name                  = "rdgw-passwordreset.kpmgcloudops.com"
  app_gateway_name               = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "CO-${upper(var.legacy_env_acronym)}-${upper(var.location)}-RDSSSPR-GW" : "agw-${var.location_acronym}-rdssspr-${var.environment_acronym}"
}

resource "azurerm_application_gateway" "RDSSSPR-GW" {
  count = var.environment_acronym == "dv" ? 0 : 1

  name                = local.app_gateway_name
  resource_group_name = azurerm_resource_group.mfa.name
  location            = azurerm_resource_group.mfa.location
  enable_http2        = "false"

  sku {
    name     = "WAF_Medium"
    tier     = "WAF"
    capacity = "2"
  }

  waf_configuration {
    enabled                  = "true"
    firewall_mode            = "Detection"
    rule_set_version         = "3.0"
    file_upload_limit_mb     = "100"
    max_request_body_size_kb = "128"
    request_body_check       = "true"
    rule_set_type            = "OWASP"
  }

  backend_address_pool {
    name = local.app_backend_address_pool_name
  }

  backend_http_settings {
    name                                = local.app_http_setting_name
    cookie_based_affinity               = "Enabled"
    port                                = 443
    protocol                            = "Https"
    pick_host_name_from_backend_address = "false"
    probe_name                          = "rdsssprhp"
    request_timeout                     = 20
    affinity_cookie_name                = "ApplicationGatewayAffinity"

    authentication_certificate {
      name = "selfcermfaserver"
    }
  }

  gateway_ip_configuration {
    name      = "appGatewayIpConfig"
    subnet_id = azurerm_subnet.co-p-eastus-rdssspr-subnet.id
  }

  frontend_port {
    name = local.frontend_port_name
    port = 443
  }

  frontend_ip_configuration {
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.rdsssprpip[0].id
    name                          = local.frontend_ip_configuration_name
  }

  http_listener {
    name                           = local.app_listener_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "false"
    ssl_certificate_name           = local.app_cert_name
  }

  request_routing_rule {
    name                       = local.app_request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.app_listener_name
    backend_address_pool_name  = local.app_backend_address_pool_name
    backend_http_settings_name = local.app_http_setting_name
  }

  probe {
    name                                      = local.app_probe_name
    host                                      = local.app_probe_host_name
    pick_host_name_from_backend_http_settings = "false"
    protocol                                  = "Https"
    path                                      = "/*"
    interval                                  = "30"
    minimum_servers                           = 0
    timeout                                   = "30"
    unhealthy_threshold                       = "3"
  }

  authentication_certificate {
    name = "selfcermfaserver"
    data = filebase64(var.app_auth_cert_cer)
  }

  ssl_certificate {
    name     = local.app_cert_name
    data     = filebase64(var.app_ssl_cert_pfx)
    password = var.app_cert_pfx_password
  }

  tags = var.tags
}


################################
# CORE AKS APPLICATION GATEWAY #
################################
/*
resource "azurerm_public_ip" "aks_agw" {}
resource "azurerm_application_gateway" "aks" {}
resource "azurerm_monitor_diagnostic_setting" "aks_agw_diag" {}
*/
## Moved to Core-AKS folder ##