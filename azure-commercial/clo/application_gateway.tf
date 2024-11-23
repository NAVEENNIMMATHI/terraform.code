resource "azurerm_application_gateway" "application_gateway" {
  name                                        = var.environment == "production" ? "co-p-eastus-cloapp1-agw" : "apg-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name                         = module.apprg.resource_group_name
  location                                    = module.apprg.resource_group_location
  
  ssl_policy {
    policy_type          = "Custom"
    min_protocol_version = "TLSv1_2"
    cipher_suites = ["TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384", "TLS_RSA_WITH_AES_256_GCM_SHA384", "TLS_RSA_WITH_AES_128_GCM_SHA256", "TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384", "TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256"]
  }

  sku {
    name                                      = var.appgateway_sku
    tier                                      = "WAF"
    capacity                                  = "2"
  }

  waf_configuration {
    enabled                                   = "true"
    firewall_mode                             = "Detection"
    rule_set_version                          = "3.0"
    request_body_check                        = false
  }

  backend_address_pool {
    name                                      = var.app_backend_address_pool_name
  }

  backend_http_settings {
    name                                      = var.app_http_setting_name
    cookie_based_affinity                     = "Enabled"
    port                                      = 443
    protocol                                  = "Https"
    request_timeout                           = 180

    authentication_certificate {
      name                                    = "clo${var.cert_environment_acronym}_kpmgcloudops_com"
    }
  }

  gateway_ip_configuration {
    name                                      = "appGatewayIpConfig"
    subnet_id                                 = azurerm_subnet.cloappgwsbn.id
  }

  frontend_port {
    name                                      = "appGatewayFrontendPort"
    port                                      = 443
  }

  frontend_ip_configuration {
    name                                      = "appGatewayFrontendIP"
    public_ip_address_id                      = azurerm_public_ip.cloappgwpip.id
  }

  http_listener {
    name                                      = "appGatewayHttpsListener"
    host_name                                 = "clo${var.cert_environment_acronym}.kpmgcloudops.com"
    frontend_ip_configuration_name            = var.frontend_ip_configuration_name
    frontend_port_name                        = "appGatewayFrontendPort"
    protocol                                  = "Https"
    require_sni                               = true
    ssl_certificate_name                      = "clo${var.cert_environment_acronym}_kpmgcloudops_com"
  }

  request_routing_rule {
    backend_address_pool_name                 = "appGatewayBackendPool"
    backend_http_settings_name                = "appGatewayBackendHttpsSettings"
    http_listener_name                        = "appGatewayHttpsListener"
    name                                      = "appGatewayRule"
    rule_type                                 = "Basic"
  }

  probe {
    name                                      = "appGatewayProbe"
    host                                      = "clo${var.cert_environment_acronym}.kpmgcloudops.com"
    protocol                                  = "Https"
    path                                      = "/"
    interval                                  = "30"
    timeout                                   = "30"
    unhealthy_threshold                       = "3"
    pick_host_name_from_backend_http_settings = false

    match {
      status_code                             = ["200-399"]
      body                                    = "*"
    }
  }

  ssl_certificate {
    name                                      = "clo${var.cert_environment_acronym}_kpmgcloudops_com"
    data                                      = filebase64("clo${var.cert_environment_acronym}.kpmgcloudops.com.pfx")
    password                                  = var.AppGatewaycertpassword
  }

  authentication_certificate {
    name                                      = "clo${var.cert_environment_acronym}_kpmgcloudops_com"
    data                                      = filebase64("kpmgcloudops.com.cer")
  }

  tags                                        = var.tags
}