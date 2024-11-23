locals {
  frontend_port_name                     = "appGatewayFrontendIP"
  frontend_ip_configuration_name         = "appGatewayFrontendIP"
  app_backend_address_pool_name          = "${var.application_name}webappGatewayBackendPool"
  app_http_setting_name                  = "appGatewayBackendHttpsSettings"
  app_listener_name                      = "appGatewayHttpsListener"
  app_request_routing_rule_name          = "ruleHttpToHttps"
  app_probe_name                         = "appgtwy-healthprobe-https"
  app_probe_host_name                    = "${var.application_name}${var.app_gateway_environment_acronym}.azurewebsites.net"
  app_listener_host_name                 = "${var.application_name}${var.app_gateway_environment_acronym}.kpmgcloudops.com"
  app_gateway_name                       = "CO-${upper(var.location)}-${upper(var.application_acronym)}-APPGTWY"
  spipaasweb_request_routing_rule_name   ="spipaaswebRule"
  
  spipaasrest_http_setting_name                     = "${var.application_name}restGatewayBackendHttpsSettings"
  spipaasrest_listener_name                         = "${var.application_name}restGatewayHttpsListener"
  spipaasrest_request_routing_rule_name             = "${var.application_name}restRule"
  spipaasrest_backend_address_pool_name             = "${var.application_name}restappBackendPool"
  spipaasrest_probe_name                            = "${var.application_name}restGatewayProbe"
  spipaasrest_probe_host_name                       = "${var.application_name}rest${var.app_gateway_environment_acronym}.azurewebsites.net"
  spipaasrest_listener_host_name                    = "${var.application_name}rest${var.app_gateway_environment_acronym}.kpmgcloudops.com"
}

resource "azurerm_public_ip" "agwpip_central" {
  # count               = var.environment == "production" ? 1 : 0

  name                        = "pip-agw-${var.location_acronym}-${var.application_acronym}-${var.application_region}-${var.environment_acronym}"
  resource_group_name         = module.applicationrg_central.resource_group_name
  location                    = module.applicationrg_central.resource_group_location
  allocation_method           = "Dynamic"
  tags                        = var.tags
}

resource "azurerm_application_gateway" "application_gateway_central" {
  name                                    = "agw-${var.location_acronym}-${var.application_acronym}-${var.application_region}-${var.environment_acronym}"
  resource_group_name                     = module.applicationrg_central.resource_group_name
  location                                = module.applicationrg_central.resource_group_location

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
    fqdns                                   = var.spipaas_fqdn
  }
   backend_address_pool {
    name                                    = local.spipaasrest_backend_address_pool_name
    fqdns                                   = var.spipaasrest_fqdn
  }
 

  backend_http_settings {
    name                                    = local.app_http_setting_name
    affinity_cookie_name                    = "ApplicationGatewayAffinity"
    host_name                               = local.app_listener_host_name
    cookie_based_affinity                   = "Enabled"
    port                                    = 443
    protocol                                = "Https"
    request_timeout                         = 30
    probe_name                              = "appgtwy-healthprobe-https"

    authentication_certificate {
      name                                  = var.selfsigncertname
    }
  }

  backend_http_settings {
    name                          = local.spipaasrest_http_setting_name
    affinity_cookie_name          = "ApplicationGatewayAffinity"
    host_name                     = local.spipaasrest_listener_host_name
    cookie_based_affinity         = "Enabled"
    port                          = 443
    protocol                      = "Https"
    request_timeout               = 30
    probe_name                    = local.spipaasrest_probe_name

    authentication_certificate {
      name                        = var.selfsigncertname
    }
  }

  gateway_ip_configuration {
    name                                     = "appGatewayIpConfig"
    subnet_id                                = azurerm_subnet.spipaasappgw_subnet_central.id
  }



  frontend_port {
    name                                      = "appGatewayFrontendPort_HTTPS"
    port                                      = 443
  }

  frontend_ip_configuration {
    name                                      = "appGatewayFrontendIP"
    public_ip_address_id                      = azurerm_public_ip.agwpip_central.id
  }

  http_listener {
    name                                      = "appGatewayHttpsListener"
    host_name                                 = local.app_listener_host_name
    frontend_ip_configuration_name            = local.frontend_ip_configuration_name
    frontend_port_name                        = "appGatewayFrontendPort_HTTPS"
    protocol                                  = "Https"
    require_sni                               = "true"
    ssl_certificate_name                      = "${var.spipaasctrapp}_kpmgcloudops_com"
  }
 http_listener {
    name                           = local.spipaasrest_listener_name
    host_name                      = local.spipaasrest_listener_host_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = "appGatewayFrontendPort_HTTPS"
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = "${var.spipaasrestctrapp}_kpmgcloudops_com"
  }
  request_routing_rule {
    name                                      = local.spipaasweb_request_routing_rule_name
    rule_type                                 = "Basic"
    http_listener_name                        = "appGatewayHttpsListener"
    backend_address_pool_name                 = local.app_backend_address_pool_name
    backend_http_settings_name                = "appGatewayBackendHttpsSettings"
  }

  request_routing_rule {
    name                           = local.spipaasrest_request_routing_rule_name
    rule_type                      = "Basic"
    http_listener_name             = local.spipaasrest_listener_name
    backend_address_pool_name      = local.spipaasrest_backend_address_pool_name
    backend_http_settings_name     = local.spipaasrest_http_setting_name
  }

  probe {
    name                                      = "appgtwy-healthprobe-https"
    host                                      = local.app_listener_host_name
    protocol                                  = "Https"
    path                                      = "/"
    interval                                  = "30"
    timeout                                   = "30"
    unhealthy_threshold                       = "3"

    match {
      status_code                             = ["200-404"]
      body                                    = ""
    }
  }
  probe {
    name                = local.spipaasrest_probe_name
    host                = local.spipaasrest_listener_host_name
    protocol            = "Https"
    path                = "/"
    interval            = "30"
    timeout             = "30"
    unhealthy_threshold = "3"

    match {
      status_code       = ["200-404"]
      body              = ""
    }
  }
   authentication_certificate {
    name                = var.selfsigncertname
    data                = filebase64("${var.spipaaswebappsslcert}")
  }
 authentication_certificate {
    name                                      = "var.selfsigncertname"
    data                                      = filebase64("${var.spipaasrestsslcert}")
  }
  ssl_certificate {
    name                                      = "${var.spipaasctrapp}_kpmgcloudops_com"
    data                                      = filebase64("${var.spipaasctrsslcertpfx}")
    password                                  = var.AppGatewaycertpassword
  }

ssl_certificate {
    name                                      = "${var.spipaasrestctrapp}_kpmgcloudops_com"
    data                                      = filebase64("${var.spipaasrestctrsslcertpfx}")
    password                                  = var.AppGatewaycertpassword
  }
  tags                                        = var.tags
}