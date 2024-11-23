locals {
  frontend_port_name_staging             = "GatewayFrontendPort"
  frontend_ip_configuration_name_staging = "GatewayFrontendIP"

  kipuat_backend_address_pool_name       = "kipuatGatewayBackendPool"
  kipuat_http_setting_name               = "kipuatGatewayBackendHttpsSettings"
  kipuat_listener_name                   = "kipuatGatewayHttpsListener"
  kipuat_request_routing_rule_name       = "kipuatRule"
  kipuat_probe_name                      = "kipuatGatewayProbe"
  kipuat_probe_host_name                 = var.kipuathostname
  kipuat_listener_host_name              = var.kipuathostname

  kiprestuat_backend_address_pool_name   = "kiprestuatGatewayBackendPool"
  kiprestuat_http_setting_name           = "kiprestuatGatewayBackendHttpsSettings"
  kiprestuat_listener_name               = "kiprestuatGatewayHttpsListener"
  kiprestuat_request_routing_rule_name   = "kiprestuatRule"
  kiprestuat_probe_name                  = "kiprestuatGatewayProbe"
  kiprestuat_probe_host_name             = var.kiprestuathostname
  kiprestuat_listener_host_name          = var.kiprestuathostname

  mep-kipuat_backend_address_pool_name   = "mep-kipuatGatewayBackendPool"
  mep-kipuat_http_setting_name           = "mep-kipuatGatewayBackendHttpsSettings"
  mep-kipuat_listener_name               = "mep-kipuatGatewayHttpsListener"
  mep-kipuat_request_routing_rule_name   = "mep-kipuatRule"
  mep-kipuat_probe_name                  = "mep-kipuatGatewayProbe"
  mep-kipuat_probe_host_name             = var.mep-kipuathostname
  mep-kipuat_listener_host_name          = var.mep-kipuathostname

  meprest-kipuat_backend_address_pool_name = "meprest-kipuatGatewayBackendPool"
  meprest-kipuat_http_setting_name         = "meprest-kipuatGatewayBackendHttpsSettings"
  meprest-kipuat_listener_name             = "meprest-kipuatGatewayHttpsListener"
  meprest-kipuat_request_routing_rule_name = "meprest-kipuatRule"
  meprest-kipuat_probe_name                = "meprest-kipuatGatewayProbe"
  meprest-kipuat_probe_host_name           = var.meprest-kipuathostname
  meprest-kipuat_listener_host_name        = var.meprest-kipuathostname
}

resource "azurerm_public_ip" "agwpip_staging" {
  count               = var.target_deployment_environment == "staging" ? 1 : 0

  name                = var.app_gateway_pip_name
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location
  allocation_method   = "Dynamic"
  tags = var.tags
}

resource "azurerm_application_gateway" "appgw_staging" {
  count               = var.target_deployment_environment == "staging" ? 1 : 0
  
  name                = var.app_gateway_name
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location

  ssl_policy {
    policy_type          = "Custom"
    min_protocol_version = "TLSv1_2"

    cipher_suites = ["TLS_RSA_WITH_AES_128_GCM_SHA256", "TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384", "TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA", "TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384", "TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384", "TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA", "TLS_RSA_WITH_AES_256_GCM_SHA384", "TLS_RSA_WITH_AES_256_CBC_SHA256", "TLS_RSA_WITH_AES_256_CBC_SHA"]
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
    name = local.kipuat_backend_address_pool_name

    #    ip_addresses = ["10.12.0.69"]
    ip_addresses = [var.ase_internal_ip]
  }

  backend_address_pool {
    name = local.kiprestuat_backend_address_pool_name

    #    ip_addresses = ["10.12.0.69"]
    ip_addresses = [var.ase_internal_ip]
  }

  backend_address_pool {
    name         = local.mep-kipuat_backend_address_pool_name
    ip_addresses = [var.ase_internal_ip]
  }

  backend_address_pool {
    name         = local.meprest-kipuat_backend_address_pool_name
    ip_addresses = [var.ase_internal_ip]
  }

  backend_http_settings {
    name                  = local.kipuat_http_setting_name
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    cookie_based_affinity = "Enabled"

    #    port                  = 8080
    port            = 443
    protocol        = "Https"
    request_timeout = 30
    probe_name      = local.kipuat_probe_name

    authentication_certificate {
      name = var.selfsigncertname
    }
  }

  backend_http_settings {
    name                  = local.kiprestuat_http_setting_name
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    cookie_based_affinity = "Enabled"

    #    port                  = 7080
    port            = 443
    protocol        = "Https"
    request_timeout = 30
    probe_name      = local.kiprestuat_probe_name

    authentication_certificate {
      name = var.selfsigncertname
    }
  }

  backend_http_settings {
    name                  = local.mep-kipuat_http_setting_name
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    cookie_based_affinity = "Enabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 30
    probe_name            = local.mep-kipuat_probe_name

    authentication_certificate {
      name = var.selfsigncertname
    }
  }

  backend_http_settings {
    name                  = local.meprest-kipuat_http_setting_name
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    cookie_based_affinity = "Enabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 30
    probe_name            = local.meprest-kipuat_probe_name

    authentication_certificate {
      name = var.selfsigncertname
    }
  }

  gateway_ip_configuration {
    name      = "appGatewayIpConfig"
    subnet_id = module.agw1subnet.subnet_id
  }

  frontend_port {
    name = local.frontend_port_name_staging
    port = 443
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name_staging
    public_ip_address_id = azurerm_public_ip.agwpip_staging[0].id
  }

  http_listener {
    name                           = local.kipuat_listener_name
    host_name                      = local.kipuat_listener_host_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name_staging
    frontend_port_name             = local.frontend_port_name_staging
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = var.kipuatcertname
  }

  http_listener {
    name                           = local.kiprestuat_listener_name
    host_name                      = local.kiprestuat_listener_host_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name_staging
    frontend_port_name             = local.frontend_port_name_staging
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = var.kiprestuatcertname
  }

  http_listener {
    name                           = local.mep-kipuat_listener_name
    host_name                      = local.mep-kipuat_listener_host_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name_staging
    frontend_port_name             = local.frontend_port_name_staging
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = var.mep-kipuatcertname
  }

  http_listener {
    name                           = local.meprest-kipuat_listener_name
    host_name                      = local.meprest-kipuat_listener_host_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name_staging
    frontend_port_name             = local.frontend_port_name_staging
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = var.meprest-kipuatcertname
  }

  request_routing_rule {
    name                       = local.kipuat_request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.kipuat_listener_name
    backend_address_pool_name  = local.kipuat_backend_address_pool_name
    backend_http_settings_name = local.kipuat_http_setting_name
  }

  request_routing_rule {
    name                       = local.kiprestuat_request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.kiprestuat_listener_name
    backend_address_pool_name  = local.kiprestuat_backend_address_pool_name
    backend_http_settings_name = local.kiprestuat_http_setting_name
  }

  request_routing_rule {
    name                       = local.mep-kipuat_request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.mep-kipuat_listener_name
    backend_address_pool_name  = local.mep-kipuat_backend_address_pool_name
    backend_http_settings_name = local.mep-kipuat_http_setting_name
  }

  request_routing_rule {
    name                       = local.meprest-kipuat_request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.meprest-kipuat_listener_name
    backend_address_pool_name  = local.meprest-kipuat_backend_address_pool_name
    backend_http_settings_name = local.meprest-kipuat_http_setting_name
  }

  probe {
    name                = local.kipuat_probe_name
    host                = local.kipuat_probe_host_name
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
    name                = local.kiprestuat_probe_name
    host                = local.kiprestuat_probe_host_name
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
    name                = local.mep-kipuat_probe_name
    host                = local.mep-kipuat_probe_host_name
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
    name                = local.meprest-kipuat_probe_name
    host                = local.meprest-kipuat_probe_host_name
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
    name     = var.kipuatcertname
    data     = filebase64(var.kipuatsslcertpfx)
    password = var.kipuatcertpfxpwd
  }

  ssl_certificate {
    name     = var.kiprestuatcertname
    data     = filebase64(var.kiprestuatsslcertpfx)
    password = var.kiprestuatcertpfxpwd
  }

  ssl_certificate {
    name     = var.mep-kipuatcertname
    data     = filebase64(var.mep-kipuatsslcertpfx)
    password = var.mep-kipuatcertpfxpwd
  }

  ssl_certificate {
    name     = var.meprest-kipuatcertname
    data     = filebase64(var.meprest-kipuatsslcertpfx)
    password = var.meprest-kipuatcertpfxpwd
  }

  tags = var.tags
}

