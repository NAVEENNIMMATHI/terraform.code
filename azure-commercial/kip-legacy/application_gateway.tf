locals {
  frontend_port_name             = "GatewayFrontendPort"
  frontend_ip_configuration_name = "GatewayFrontendIP"

  kipdev_backend_address_pool_name = "kipdevGatewayBackendPool"
  kipdev_http_setting_name         = "kipdevGatewayBackendHttpsSettings"
  kipdev_listener_name             = "kipdevGatewayHttpsListener"
  kipdev_request_routing_rule_name = "kipdevRule"
  kipdev_probe_name                = "kipdevGatewayProbe"
  kipdev_probe_host_name           = var.kipdevhostname
  kipdev_listener_host_name        = var.kipdevhostname

  kiprestdev_backend_address_pool_name = "kiprestdevGatewayBackendPool"
  kiprestdev_http_setting_name         = "kiprestdevGatewayBackendHttpsSettings"
  kiprestdev_listener_name             = "kiprestdevGatewayHttpsListener"
  kiprestdev_request_routing_rule_name = "kiprestdevRule"
  kiprestdev_probe_name                = "kiprestdevGatewayProbe"
  kiprestdev_probe_host_name           = var.kiprestdevhostname
  kiprestdev_listener_host_name        = var.kiprestdevhostname

  kipqa_backend_address_pool_name = "kipqaGatewayBackendPool"
  kipqa_http_setting_name         = "kipqaGatewayBackendHttpsSettings"
  kipqa_listener_name             = "kipqaGatewayHttpsListener"
  kipqa_request_routing_rule_name = "kipqaRule"
  kipqa_probe_name                = "kipqaGatewayProbe"
  kipqa_probe_host_name           = var.kipqahostname
  kipqa_listener_host_name        = var.kipqahostname

  kiprestqa_backend_address_pool_name = "kiprestqaGatewayBackendPool"
  kiprestqa_http_setting_name         = "kiprestqaGatewayBackendHttpsSettings"
  kiprestqa_listener_name             = "kiprestqaGatewayHttpsListener"
  kiprestqa_request_routing_rule_name = "kiprestqaRule"
  kiprestqa_probe_name                = "kiprestqaGatewayProbe"
  kiprestqa_probe_host_name           = var.kiprestqahostname
  kiprestqa_listener_host_name        = var.kiprestqahostname

  mep-kipdev_backend_address_pool_name = "mep-kipdevGatewayBackendPool"
  mep-kipdev_http_setting_name         = "mep-kipdevGatewayBackendHttpsSettings"
  mep-kipdev_listener_name             = "mep-kipdevGatewayHttpsListener"
  mep-kipdev_request_routing_rule_name = "mep-kipdevRule"
  mep-kipdev_probe_name                = "mep-kipdevGatewayProbe"
  mep-kipdev_probe_host_name           = var.mep-kipdevhostname
  mep-kipdev_listener_host_name        = var.mep-kipdevhostname

  meprest-kipdev_backend_address_pool_name = "meprest-kipdevGatewayBackendPool"
  meprest-kipdev_http_setting_name         = "meprest-kipdevGatewayBackendHttpsSettings"
  meprest-kipdev_listener_name             = "meprest-kipdevGatewayHttpsListener"
  meprest-kipdev_request_routing_rule_name = "meprest-kipdevRule"
  meprest-kipdev_probe_name                = "meprest-kipdevGatewayProbe"
  meprest-kipdev_probe_host_name           = var.meprest-kipdevhostname
  meprest-kipdev_listener_host_name        = var.meprest-kipdevhostname

  mep-kipqa_backend_address_pool_name = "mep-kipqaGatewayBackendPool"
  mep-kipqa_http_setting_name         = "mep-kipqaGatewayBackendHttpsSettings"
  mep-kipqa_listener_name             = "mep-kipqaGatewayHttpsListener"
  mep-kipqa_request_routing_rule_name = "mep-kipqaRule"
  mep-kipqa_probe_name                = "mep-kipqaGatewayProbe"
  mep-kipqa_probe_host_name           = var.mep-kipqahostname
  mep-kipqa_listener_host_name        = var.mep-kipqahostname

  meprest-kipqa_backend_address_pool_name = "meprest-kipqaGatewayBackendPool"
  meprest-kipqa_http_setting_name         = "meprest-kipqaGatewayBackendHttpsSettings"
  meprest-kipqa_listener_name             = "meprest-kipqaGatewayHttpsListener"
  meprest-kipqa_request_routing_rule_name = "meprest-kipqaRule"
  meprest-kipqa_probe_name                = "meprest-kipqaGatewayProbe"
  meprest-kipqa_probe_host_name           = var.meprest-kipqahostname
  meprest-kipqa_listener_host_name        = var.meprest-kipqahostname

  dasnp_backend_address_pool_name = "dasnpGatewayBackendPool"
  dasnp_http_setting_name         = "dasnpGatewayBackendHttpsSettings"
  dasnp_listener_name             = "dasnpGatewayHttpsListener"
  dasnp_request_routing_rule_name = "dasnpRule"
  dasnp_probe_name                = "dasnpGatewayProbe"
  dasnp_probe_host_name           = var.dasnphostname
  dasnp_listener_host_name        = var.dasnphostname

  dasrestnp_backend_address_pool_name = "dasrestnpGatewayBackendPool"
  dasrestnp_http_setting_name         = "dasrestnpGatewayBackendHttpsSettings"
  dasrestnp_listener_name             = "dasrestnpGatewayHttpsListener"
  dasrestnp_request_routing_rule_name = "dasrestnpRule"
  dasrestnp_probe_name                = "dasrestnpGatewayProbe"
  dasrestnp_probe_host_name           = var.dasrestnphostname
  dasrestnp_listener_host_name        = var.dasrestnphostname
}

resource "azurerm_public_ip" "agwpip" {
  name                = var.app_gateway_pip_name
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location
  allocation_method   = "Dynamic"
  count               = var.target_deployment_environment == "nonprod" ? 1 : 0
  tags                = var.tags
}

resource "azurerm_application_gateway" "appgw" {
  name                = var.app_gateway_name
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location
  count               = var.target_deployment_environment == "nonprod" ? 1 : 0

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
    name = local.kipdev_backend_address_pool_name

    #    ip_addresses = ["10.12.0.69"]
    ip_addresses = [var.ase_internal_ip]
  }

  backend_address_pool {
    name = local.kiprestdev_backend_address_pool_name

    #    ip_addresses = ["10.12.0.69"]
    ip_addresses = [var.ase_internal_ip]
  }

  backend_address_pool {
    name         = local.kipqa_backend_address_pool_name
    ip_addresses = [var.ase_internal_ip]
  }

  backend_address_pool {
    name         = local.kiprestqa_backend_address_pool_name
    ip_addresses = [var.ase_internal_ip]
  }

  backend_address_pool {
    name         = local.mep-kipdev_backend_address_pool_name
    ip_addresses = [var.ase_internal_ip]
  }

  backend_address_pool {
    name         = local.meprest-kipdev_backend_address_pool_name
    ip_addresses = [var.ase_internal_ip]
  }

  backend_address_pool {
    name         = local.mep-kipqa_backend_address_pool_name
    ip_addresses = [var.ase_internal_ip]
  }

  backend_address_pool {
    name         = local.meprest-kipqa_backend_address_pool_name
    ip_addresses = [var.ase_internal_ip]
  }

  backend_address_pool {
    name         = local.dasnp_backend_address_pool_name
    ip_addresses = [var.ase_internal_ip]
  }

  backend_address_pool {
    name         = local.dasrestnp_backend_address_pool_name
    ip_addresses = [var.ase_internal_ip]
  }

  backend_http_settings {
    name                  = local.kipdev_http_setting_name
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    cookie_based_affinity = "Enabled"

    #    port                  = 8080
    port            = 443
    protocol        = "Https"
    request_timeout = 30
    probe_name      = local.kipdev_probe_name

    authentication_certificate {
      name = var.selfsigncertname
    }
  }

  backend_http_settings {
    name                  = local.kiprestdev_http_setting_name
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    cookie_based_affinity = "Enabled"

    #    port                  = 7080
    port            = 443
    protocol        = "Https"
    request_timeout = 30
    probe_name      = local.kiprestdev_probe_name

    authentication_certificate {
      name = var.selfsigncertname
    }
  }

  backend_http_settings {
    name                  = local.kipqa_http_setting_name
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    cookie_based_affinity = "Enabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 30
    probe_name            = local.kipqa_probe_name

    authentication_certificate {
      name = var.selfsigncertname
    }
  }

  backend_http_settings {
    name                  = local.kiprestqa_http_setting_name
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    cookie_based_affinity = "Enabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 30
    probe_name            = local.kiprestqa_probe_name

    authentication_certificate {
      name = var.selfsigncertname
    }
  }

  backend_http_settings {
    name                  = local.mep-kipdev_http_setting_name
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    cookie_based_affinity = "Enabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 30
    probe_name            = local.mep-kipdev_probe_name

    authentication_certificate {
      name = var.selfsigncertname
    }
  }

  backend_http_settings {
    name                  = local.meprest-kipdev_http_setting_name
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    cookie_based_affinity = "Enabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 30
    probe_name            = local.meprest-kipdev_probe_name

    authentication_certificate {
      name = var.selfsigncertname
    }
  }

  backend_http_settings {
    name                  = local.mep-kipqa_http_setting_name
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    cookie_based_affinity = "Enabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 30
    probe_name            = local.mep-kipqa_probe_name

    authentication_certificate {
      name = var.selfsigncertname
    }
  }

  backend_http_settings {
    name                  = local.meprest-kipqa_http_setting_name
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    cookie_based_affinity = "Enabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 30
    probe_name            = local.meprest-kipqa_probe_name

    authentication_certificate {
      name = var.selfsigncertname
    }
  }

  backend_http_settings {
    name                  = local.dasnp_http_setting_name
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    cookie_based_affinity = "Enabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 30
    probe_name            = local.dasnp_probe_name

    authentication_certificate {
      name = var.selfsigncertname
    }
  }

  backend_http_settings {
    name                  = local.dasrestnp_http_setting_name
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    cookie_based_affinity = "Enabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 30
    probe_name            = local.dasrestnp_probe_name

    authentication_certificate {
      name = var.selfsigncertname
    }
  }

  gateway_ip_configuration {
    name      = "appGatewayIpConfig"
    subnet_id = module.agw1subnet.subnet_id
  }

  frontend_port {
    name = local.frontend_port_name
    port = 443
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.agwpip[0].id
  }

  http_listener {
    name                           = local.kipdev_listener_name
    host_name                      = local.kipdev_listener_host_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = var.kipdevcertname
  }

  http_listener {
    name                           = local.kiprestdev_listener_name
    host_name                      = local.kiprestdev_listener_host_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = var.kiprestdevcertname
  }

  http_listener {
    name                           = local.kipqa_listener_name
    host_name                      = local.kipqa_listener_host_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = var.kipqacertname
  }

  http_listener {
    name                           = local.kiprestqa_listener_name
    host_name                      = local.kiprestqa_listener_host_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = var.kiprestqacertname
  }

  http_listener {
    name                           = local.mep-kipdev_listener_name
    host_name                      = local.mep-kipdev_listener_host_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = var.mep-kipdevcertname
  }

  http_listener {
    name                           = local.meprest-kipdev_listener_name
    host_name                      = local.meprest-kipdev_listener_host_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = var.meprest-kipdevcertname
  }

  http_listener {
    name                           = local.mep-kipqa_listener_name
    host_name                      = local.mep-kipqa_listener_host_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = var.mep-kipqacertname
  }

  http_listener {
    name                           = local.meprest-kipqa_listener_name
    host_name                      = local.meprest-kipqa_listener_host_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = var.meprest-kipqacertname
  }

  http_listener {
    name                           = local.dasnp_listener_name
    host_name                      = local.dasnp_listener_host_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = var.dasnpcertname
  }

  http_listener {
    name                           = local.dasrestnp_listener_name
    host_name                      = local.dasrestnp_listener_host_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = var.dasrestnpcertname
  }

  request_routing_rule {
    name                       = local.kipdev_request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.kipdev_listener_name
    backend_address_pool_name  = local.kipdev_backend_address_pool_name
    backend_http_settings_name = local.kipdev_http_setting_name
  }

  request_routing_rule {
    name                       = local.kiprestdev_request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.kiprestdev_listener_name
    backend_address_pool_name  = local.kiprestdev_backend_address_pool_name
    backend_http_settings_name = local.kiprestdev_http_setting_name
  }

  request_routing_rule {
    name                       = local.kipqa_request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.kipqa_listener_name
    backend_address_pool_name  = local.kipqa_backend_address_pool_name
    backend_http_settings_name = local.kipqa_http_setting_name
  }

  request_routing_rule {
    name                       = local.kiprestqa_request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.kiprestqa_listener_name
    backend_address_pool_name  = local.kiprestqa_backend_address_pool_name
    backend_http_settings_name = local.kiprestqa_http_setting_name
  }

  request_routing_rule {
    name                       = local.mep-kipdev_request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.mep-kipdev_listener_name
    backend_address_pool_name  = local.mep-kipdev_backend_address_pool_name
    backend_http_settings_name = local.mep-kipdev_http_setting_name
  }

  request_routing_rule {
    name                       = local.meprest-kipdev_request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.meprest-kipdev_listener_name
    backend_address_pool_name  = local.meprest-kipdev_backend_address_pool_name
    backend_http_settings_name = local.meprest-kipdev_http_setting_name
  }

  request_routing_rule {
    name                       = local.mep-kipqa_request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.mep-kipqa_listener_name
    backend_address_pool_name  = local.mep-kipqa_backend_address_pool_name
    backend_http_settings_name = local.mep-kipqa_http_setting_name
  }

  request_routing_rule {
    name                       = local.meprest-kipqa_request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.meprest-kipqa_listener_name
    backend_address_pool_name  = local.meprest-kipqa_backend_address_pool_name
    backend_http_settings_name = local.meprest-kipqa_http_setting_name
  }

  request_routing_rule {
    name                       = local.dasnp_request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.dasnp_listener_name
    backend_address_pool_name  = local.dasnp_backend_address_pool_name
    backend_http_settings_name = local.dasnp_http_setting_name
  }

  request_routing_rule {
    name                       = local.dasrestnp_request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.dasrestnp_listener_name
    backend_address_pool_name  = local.dasrestnp_backend_address_pool_name
    backend_http_settings_name = local.dasrestnp_http_setting_name
  }

  probe {
    name                = local.kipdev_probe_name
    host                = local.kipdev_probe_host_name
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
    name                = local.kiprestdev_probe_name
    host                = local.kiprestdev_probe_host_name
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
    name                = local.kipqa_probe_name
    host                = local.kipqa_probe_host_name
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
    name                = local.kiprestqa_probe_name
    host                = local.kiprestqa_probe_host_name
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
    name                = local.mep-kipdev_probe_name
    host                = local.mep-kipdev_probe_host_name
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
    name                = local.meprest-kipdev_probe_name
    host                = local.meprest-kipdev_probe_host_name
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
    name                = local.mep-kipqa_probe_name
    host                = local.mep-kipqa_probe_host_name
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
    name                = local.meprest-kipqa_probe_name
    host                = local.meprest-kipqa_probe_host_name
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
    name                = local.dasnp_probe_name
    host                = local.dasnp_probe_host_name
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
    name                = local.dasrestnp_probe_name
    host                = local.dasrestnp_probe_host_name
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
    name     = var.kipdevcertname
    data     = filebase64(var.kipdevsslcertpfx)
    password = var.kipdevcertpfxpwd
  }

  ssl_certificate {
    name     = var.kiprestdevcertname
    data     = filebase64(var.kiprestdevsslcertpfx)
    password = var.kiprestdevcertpfxpwd
  }

  ssl_certificate {
    name     = var.kipqacertname
    data     = filebase64(var.kipqasslcertpfx)
    password = var.kipqacertpfxpwd
  }

  ssl_certificate {
    name     = var.kiprestqacertname
    data     = filebase64(var.kiprestqasslcertpfx)
    password = var.kiprestqacertpfxpwd
  }

  ssl_certificate {
    name     = var.mep-kipdevcertname
    data     = filebase64(var.mep-kipdevsslcertpfx)
    password = var.mep-kipdevcertpfxpwd
  }

  ssl_certificate {
    name     = var.meprest-kipdevcertname
    data     = filebase64(var.meprest-kipdevsslcertpfx)
    password = var.meprest-kipdevcertpfxpwd
  }

  ssl_certificate {
    name     = var.mep-kipqacertname
    data     = filebase64(var.mep-kipqasslcertpfx)
    password = var.mep-kipqacertpfxpwd
  }

  ssl_certificate {
    name     = var.meprest-kipqacertname
    data     = filebase64(var.meprest-kipqasslcertpfx)
    password = var.meprest-kipqacertpfxpwd
  }

  ssl_certificate {
    name     = var.dasnpcertname
    data     = filebase64(var.dasnpsslcertpfx)
    password = var.dasnpcertpfxpwd
  }

  ssl_certificate {
    name     = var.dasrestnpcertname
    data     = filebase64(var.dasrestnpsslcertpfx)
    password = var.dasrestnpcertpfxpwd
  }

  tags = var.tags
}

