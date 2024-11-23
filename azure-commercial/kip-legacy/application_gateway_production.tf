locals {
  frontend_port_name_production             = "GatewayFrontendPort"
  frontend_ip_configuration_name_production = "GatewayFrontendIP"

  kip_backend_address_pool_name             = "kipGatewayBackendPool"
  kip_http_setting_name                     = "kipGatewayBackendHttpsSettings"
  kip_listener_name                         = "kipGatewayHttpsListener"
  kip_request_routing_rule_name             = "kipRule"
  kip_probe_name                            = "kipGatewayProbe"
  kip_probe_host_name                       = var.kiphostname
  kip_listener_host_name                    = var.kiphostname

  kiprest_backend_address_pool_name         = "kiprestGatewayBackendPool"
  kiprest_http_setting_name                 = "kiprestGatewayBackendHttpsSettings"
  kiprest_listener_name                     = "kiprestGatewayHttpsListener"
  kiprest_request_routing_rule_name         = "kiprestRule"
  kiprest_probe_name                        = "kiprestGatewayProbe"
  kiprest_probe_host_name                   = var.kipresthostname
  kiprest_listener_host_name                = var.kipresthostname

  mep-kip_backend_address_pool_name         = "mep-kipGatewayBackendPool"
  mep-kip_http_setting_name                 = "mep-kipGatewayBackendHttpsSettings"
  mep-kip_listener_name                     = "mep-kipGatewayHttpsListener"
  mep-kip_request_routing_rule_name         = "mep-kipRule"
  mep-kip_probe_name                        = "mep-kipGatewayProbe"
  mep-kip_probe_host_name                   = var.mep-kiphostname
  mep-kip_listener_host_name                = var.mep-kiphostname

  meprest-kip_backend_address_pool_name     = "meprest-kipGatewayBackendPool"
  meprest-kip_http_setting_name             = "meprest-kipGatewayBackendHttpsSettings"
  meprest-kip_listener_name                 = "meprest-kipGatewayHttpsListener"
  meprest-kip_request_routing_rule_name     = "meprest-kipRule"
  meprest-kip_probe_name                    = "meprest-kipGatewayProbe"
  meprest-kip_probe_host_name               = var.meprest-kiphostname
  meprest-kip_listener_host_name            = var.meprest-kiphostname
}

resource "azurerm_public_ip" "agwpip_production" {
  count               = var.target_deployment_environment == "production" ? 1 : 0

  name                = var.app_gateway_pip_name
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location
  allocation_method   = "Dynamic"
  tags = var.tags
}

resource "azurerm_application_gateway" "appgw_production" {
  count               = var.target_deployment_environment == "production" ? 1 : 0
  
  name                = var.app_gateway_name
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location

  ssl_policy {
    policy_type          = "Custom"
    min_protocol_version = "TLSv1_2"
    cipher_suites        = ["TLS_RSA_WITH_AES_128_GCM_SHA256", "TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384", "TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA", "TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384", "TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384", "TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA", "TLS_RSA_WITH_AES_256_GCM_SHA384", "TLS_RSA_WITH_AES_256_CBC_SHA256", "TLS_RSA_WITH_AES_256_CBC_SHA"]
  }

  sku {
    name     = var.application_gw_sku_name
    tier     = var.application_gw_sku_tier
    capacity = var.application_gw_sku_capacity
  }

  waf_configuration {
    enabled          = "true"
    firewall_mode    = "Detection"
    rule_set_version = "3.0"
  }

  backend_address_pool {
    name = local.kip_backend_address_pool_name

    #    ip_addresses = ["10.12.0.69"]
    ip_addresses = [var.ase_internal_ip]
  }

  backend_address_pool {
    name = local.kiprest_backend_address_pool_name

    #    ip_addresses = ["10.12.0.69"]
    ip_addresses = [var.ase_internal_ip]
  }

  backend_address_pool {
    name         = local.mep-kip_backend_address_pool_name
    ip_addresses = [var.ase_internal_ip]
  }

  backend_address_pool {
    name         = local.meprest-kip_backend_address_pool_name
    ip_addresses = [var.ase_internal_ip]
  }

  backend_http_settings {
    name                  = local.kip_http_setting_name
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    cookie_based_affinity = "Enabled"

    #    port                  = 8080
    port            = 443
    protocol        = "Https"
    request_timeout = 30
    probe_name      = local.kip_probe_name

    authentication_certificate {
      name = var.selfsigncertname
    }
  }

  backend_http_settings {
    name                  = local.kiprest_http_setting_name
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    cookie_based_affinity = "Enabled"

    #    port                  = 7080
    port            = 443
    protocol        = "Https"
    request_timeout = 30
    probe_name      = local.kiprest_probe_name

    authentication_certificate {
      name = var.selfsigncertname
    }
  }

  backend_http_settings {
    name                  = local.mep-kip_http_setting_name
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    cookie_based_affinity = "Enabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 30
    probe_name            = local.mep-kip_probe_name

    authentication_certificate {
      name = var.selfsigncertname
    }
  }

  backend_http_settings {
    name                  = local.meprest-kip_http_setting_name
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    cookie_based_affinity = "Enabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 30
    probe_name            = local.meprest-kip_probe_name

    authentication_certificate {
      name = var.selfsigncertname
    }
  }

  gateway_ip_configuration {
    name      = "appGatewayIpConfig"
    subnet_id = module.agw1subnet.subnet_id
  }

  frontend_port {
    name = local.frontend_port_name_production
    port = 443
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name_production
    public_ip_address_id = azurerm_public_ip.agwpip_production[0].id
  }

  http_listener {
    name                           = local.kip_listener_name
    host_name                      = local.kip_listener_host_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name_production
    frontend_port_name             = local.frontend_port_name_production
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = var.kipcertname
  }

  http_listener {
    name                           = local.kiprest_listener_name
    host_name                      = local.kiprest_listener_host_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name_production
    frontend_port_name             = local.frontend_port_name_production
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = var.kiprestcertname
  }

  http_listener {
    name                           = local.mep-kip_listener_name
    host_name                      = local.mep-kip_listener_host_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name_production
    frontend_port_name             = local.frontend_port_name_production
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = var.mep-kipcertname
  }

  http_listener {
    name                           = local.meprest-kip_listener_name
    host_name                      = local.meprest-kip_listener_host_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name_production
    frontend_port_name             = local.frontend_port_name_production
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = var.meprest-kipcertname
  }

  request_routing_rule {
    name                       = local.kip_request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.kip_listener_name
    backend_address_pool_name  = local.kip_backend_address_pool_name
    backend_http_settings_name = local.kip_http_setting_name
  }

  request_routing_rule {
    name                       = local.kiprest_request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.kiprest_listener_name
    backend_address_pool_name  = local.kiprest_backend_address_pool_name
    backend_http_settings_name = local.kiprest_http_setting_name
  }

  request_routing_rule {
    name                       = local.mep-kip_request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.mep-kip_listener_name
    backend_address_pool_name  = local.mep-kip_backend_address_pool_name
    backend_http_settings_name = local.mep-kip_http_setting_name
  }

  request_routing_rule {
    name                       = local.meprest-kip_request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.meprest-kip_listener_name
    backend_address_pool_name  = local.meprest-kip_backend_address_pool_name
    backend_http_settings_name = local.meprest-kip_http_setting_name
  }

  probe {
    name                = local.kip_probe_name
    host                = local.kip_probe_host_name
    protocol            = "Https"
    path                = "/"
    interval            = "30"
    timeout             = "30"
    unhealthy_threshold = "3"

    match {
      status_code = ["200-399"]
      body        = ""
    }
  }

  probe {
    name                = local.kiprest_probe_name
    host                = local.kiprest_probe_host_name
    protocol            = "Https"
    path                = "/"
    interval            = "30"
    timeout             = "30"
    unhealthy_threshold = "3"

    match {
      status_code = ["200-399"]
      body        = ""
    }
  }

  probe {
    name                = local.mep-kip_probe_name
    host                = local.mep-kip_probe_host_name
    protocol            = "Https"
    path                = "/"
    interval            = "30"
    timeout             = "30"
    unhealthy_threshold = "3"

    match {
      status_code = ["200-399"]
      body        = ""
    }
  }

  probe {
    name                = local.meprest-kip_probe_name
    host                = local.meprest-kip_probe_host_name
    protocol            = "Https"
    path                = "/"
    interval            = "30"
    timeout             = "30"
    unhealthy_threshold = "3"

    match {
      status_code = ["200-399"]
      body        = ""
    }
  }

  authentication_certificate {
    name = var.selfsigncertname
    data = filebase64(var.selfsignauthcertcer)
  }

  ssl_certificate {
    name     = var.kipcertname
    data     = filebase64(var.kipsslcertpfx)
    password = var.kipcertpfxpwd
  }

  ssl_certificate {
    name     = var.kiprestcertname
    data     = filebase64(var.kiprestsslcertpfx)
    password = var.kiprestcertpfxpwd
  }

  ssl_certificate {
    name     = var.mep-kipcertname
    data     = filebase64(var.mep-kipsslcertpfx)
    password = var.mep-kipcertpfxpwd
  }

  ssl_certificate {
    name     = var.meprest-kipcertname
    data     = filebase64(var.meprest-kipsslcertpfx)
    password = var.meprest-kipcertpfxpwd
  }

  tags = var.tags
}

