locals {
  frontend_port_name                     = "appGatewayFrontendIP"
  frontend_ip_configuration_name         = "appGatewayFrontendIP"
  app_backend_address_pool_name          = "appGatewayBackendPool"
  app_http_setting_name                  = "appGatewayBackendHttpsSettings"
  app_listener_name                      = "appGatewayHttpsListener"
  app_request_routing_rule_name          = "ruleHttpToHttps"
  app_probe_name                         = "appgtwy-healthprobe-https"
  app_probe_host_name                    = "${var.application_acronym}.kpmgcloudops.com"
  app_listener_host_name                 = "spi${var.app_gateway_environment_acronym}.kpmgcloudops.com"
  app_gateway_name                       = "CO-${upper(var.location)}-${upper(var.application_acronym)}-APPGTWY"

  spirest_http_setting_name                     = "spirestGatewayBackendHttpsSettings"
  spirest_listener_name                         = "spirestGatewayHttpsListener"
  spirest_request_routing_rule_name             = "spirestRule"
  spirest_probe_name                            = "spirestGatewayProbe"
  spirest_probe_host_name                       = "spirest${var.app_gateway_environment_acronym}.kpmgcloudops.com"
  spirest_listener_host_name                    = "spirest${var.app_gateway_environment_acronym}.kpmgcloudops.com"
}

resource "azurerm_application_gateway" "application_gateway" {
  name                                    = var.environment == "production" ? "CO-EASTUS-SPI-APPGTWY" : "apg-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name                     = azurerm_resource_group.cospivnetrg.name
  location                                = azurerm_resource_group.cospivnetrg.location

  ssl_policy {
    policy_type                           = "Custom"
    min_protocol_version                  = "TLSv1_2"
    cipher_suites                         = ["TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384", "TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384", "TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384", "TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA", "TLS_RSA_WITH_AES_256_GCM_SHA384", "TLS_RSA_WITH_AES_256_CBC_SHA256","TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256"]
  }

  sku {
    name                                   = var.appgateway_sku
    tier                                   = "WAF"
    capacity                               = "2"
  }

  waf_configuration {
    enabled                                = "true"
    firewall_mode                          = "Prevention"
    rule_set_version                       = "3.0"

    disabled_rule_group {
      rule_group_name                      = "REQUEST-942-APPLICATION-ATTACK-SQLI"
      rules                                = ["942440", "942430"]
    }
  }

  backend_address_pool {
    name                                    = local.app_backend_address_pool_name
  }
  backend_http_settings {
    name                                    = "appGatewayBackendHttpSettings"
    cookie_based_affinity                   = "Disabled"
    port                                    = 80
    protocol                                = "Http"
    request_timeout                         = 30
    probe_name                              = ""
  }

  backend_http_settings {
    name                                    = local.app_http_setting_name
    cookie_based_affinity                   = "Disabled"
    port                                    = 443
    protocol                                = "Https"
    request_timeout                         = 20
    host_name                               = "${lower(var.application_acronym)}${lower(var.environment_acronym_agw)}.kpmgcloudops.com"
    probe_name                              = "appgtwy-healthprobe-https"

    authentication_certificate {
      name                                  = "${lower(var.application_acronym)}_kpmgcloudops_com"
    }
  }

  backend_http_settings {
    name                          = local.spirest_http_setting_name
    affinity_cookie_name          = "ApplicationGatewayAffinity"
    cookie_based_affinity         = "Enabled"
    port                          = 8083
    protocol                      = "Https"
    request_timeout               = 30
    probe_name                    = local.spirest_probe_name

    authentication_certificate {
      name                        = "${var.spirest}_kpmgcloudops_com"
    }
  }

  gateway_ip_configuration {
    name                                     = "appGatewayIpConfig"
    subnet_id                                = azurerm_subnet.spiappgw_subnet.id
  }

  frontend_port {
    name                                      = "appGatewayFrontendPort"
    port                                      = 80
  }

  frontend_port {
    name                                      = "appGatewayFrontendPort_HTTPS"
    port                                      = 443
  }

  frontend_ip_configuration {
    name                                      = "appGatewayFrontendIP"
    public_ip_address_id                      = azurerm_public_ip.gatewayip.id
  }

  http_listener {
    name                                      = "appGatewayHttpListener"
    host_name                                 = ""
    frontend_ip_configuration_name            = "appGatewayFrontendIP"
    frontend_port_name                        = "appGatewayFrontendPort"
    protocol                                  = "Http"
    require_sni                               = "false"
  }

  http_listener {
    name                                      = "appGatewayHttpsListener"
    host_name                                 = local.app_listener_host_name
    frontend_ip_configuration_name            = local.frontend_ip_configuration_name
    frontend_port_name                        = "appGatewayFrontendPort_HTTPS"
    protocol                                  = "Https"
    require_sni                               = "true"
    ssl_certificate_name                      = "${lower(var.application_acronym)}_kpmgcloudops_com"
  }
 http_listener {
    name                           = local.spirest_listener_name
    host_name                      = local.spirest_listener_host_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = "appGatewayFrontendPort_HTTPS"
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = "${var.spirest}_kpmgcloudops_com"
  }
  request_routing_rule {
    name                                      = "ruleHttps"
    rule_type                                 = "Basic"
    http_listener_name                        = "appGatewayHttpsListener"
    backend_address_pool_name                 = "appGatewayBackendPool"
    backend_http_settings_name                = "appGatewayBackendHttpsSettings"
  }

  request_routing_rule {
    name                                      = "ruleHttpToHttps"
    rule_type                                 = "Basic"
    http_listener_name                        = "appGatewayHttpListener"
    backend_address_pool_name                 = ""
    backend_http_settings_name                = ""
    redirect_configuration_name               = "ruleHttpToHttps"
  }
  request_routing_rule {
    name                           = local.spirest_request_routing_rule_name
    rule_type                      = "Basic"
    http_listener_name             = local.spirest_listener_name
    #backend_address_pool_name      = local.spirest_backend_address_pool_name
    backend_address_pool_name      = "appGatewayBackendPool"
    backend_http_settings_name     = local.spirest_http_setting_name
  }

  redirect_configuration {
    name                                      = "ruleHttpToHttps"
    target_listener_name                      = "appGatewayHttpsListener"
    include_path                              = true
    include_query_string                      = true
    redirect_type                             = "Permanent"
  }

  probe {
    name                                      = "appgtwy-healthprobe-https"
    host                                      = ""
    protocol                                  = "Https"
    path                                      = "/"
    interval                                  = "30"
    timeout                                   = "30"
    unhealthy_threshold                       = "3"
    pick_host_name_from_backend_http_settings = true

    match {
      status_code                             = ["200-399"]
      body                                    = ""
    }
  }
  probe {
    name                = local.spirest_probe_name
    host                = local.spirest_probe_host_name
    protocol            = "Https"
    path                = "/"
    interval            = "30"
    timeout             = "30"
    unhealthy_threshold = "3"

    match {
      status_code       = ["200-399"]
      body              = ""
    }
  }

  ssl_certificate {
    name                                      = "${lower(var.application_acronym)}_kpmgcloudops_com"
    data                                      = filebase64("${var.spisslcertpfx}")
    password                                  = var.AppGatewaycertpassword
  }

  authentication_certificate {
    name                                      = "${lower(var.application_acronym)}_kpmgcloudops_com"
    data                                      = filebase64("${var.spisslcert}")
  }
ssl_certificate {
    name                                      = "${var.spirest}_kpmgcloudops_com"
    data                                      = filebase64("${var.spirestsslcertpfx}")
    password                                  = var.AppGatewaycertpassword
  }

  authentication_certificate {
    name                                      = "${var.spirest}_kpmgcloudops_com"
    data                                      = filebase64("${var.spirestsslcert}")
  }
  tags                                        = var.tags
}