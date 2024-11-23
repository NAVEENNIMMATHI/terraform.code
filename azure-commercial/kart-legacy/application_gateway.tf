locals {
  frontend_port_name             = "krtGatewayFrontendPort"
  frontend_ip_configuration_name = "krtGatewayFrontendIP"

  krtdev_backend_address_pool_name = "krtdevGatewayBackendPool"
  krtdev_http_setting_name         = "krtdevGatewayBackendHttpsSettings"
  krtdev_listener_name             = "krtdevGatewayHttpsListener"
  krtdev_request_routing_rule_name = "krtdevRule"
  krtdev_probe_name                = "krtdevGatewayProbe"
  krtdev_probe_host_name           = var.krtdevhostname
  krtdev_listener_host_name        = var.krtdevhostname

  krtqa_backend_address_pool_name = "krtqaGatewayBackendPool"
  krtqa_http_setting_name         = "krtqaGatewayBackendHttpsSettings"
  krtqa_listener_name             = "krtqaGatewayHttpsListener"
  krtqa_request_routing_rule_name = "krtqaRule"
  krtqa_probe_name                = "krtqaGatewayProbe"
  krtqa_probe_host_name           = var.krtqahostname
  krtqa_listener_host_name        = var.krtqahostname

  krtuat_backend_address_pool_name = "krtuatGatewayBackendPool"
  krtuat_http_setting_name         = "krtuatGatewayBackendHttpsSettings"
  krtuat_listener_name             = "krtuatGatewayHttpsListener"
  krtuat_request_routing_rule_name = "krtuatRule"
  krtuat_probe_name                = "krtuatGatewayProbe"
  krtuat_probe_host_name           = var.krtuathostname
  krtuat_listener_host_name        = var.krtuathostname
}

resource "azurerm_public_ip" "krtagwpip" {
  name                = var.app_gateway_pip_name
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location
  allocation_method   = "Dynamic"
  count               = var.target_deployment_environment == "prod" ? 0 : 1
  tags                = var.tags
}

resource "azurerm_application_gateway" "krtappgw" {
  name                = var.app_gateway_name
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location
  count               = var.target_deployment_environment == "prod" ? 0 : 1

  #disabled_ssl_protocols = ["TLSv1_0","TLSv1_1"]
  ssl_policy {
    policy_type          = "Custom"
    min_protocol_version = "TLSv1_2"

    #disabled_protocols = ["TLSv1_0","TLSv1_1"]
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
    name = local.krtdev_backend_address_pool_name
    ip_addresses = var.dev_backend_ips
  }

  backend_address_pool {
    name = local.krtqa_backend_address_pool_name
    ip_addresses = var.qa_backend_ips
  }

  backend_address_pool {
    name = local.krtuat_backend_address_pool_name
    ip_addresses = var.uat_backend_ips
  }

  backend_http_settings {
    name                  = local.krtuat_http_setting_name
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    cookie_based_affinity = "Enabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 300
    probe_name            = local.krtuat_probe_name

    authentication_certificate {
      name = var.selfsigncertname
    }
  }

  backend_http_settings {
    name                  = local.krtqa_http_setting_name
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    cookie_based_affinity = "Enabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 300
    probe_name            = local.krtqa_probe_name
    host_name             = var.krtqahostname

    authentication_certificate {
      name = var.selfsigncertname
    }
  }

  backend_http_settings {
    name                  = local.krtdev_http_setting_name
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    cookie_based_affinity = "Enabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 300
    probe_name            = local.krtdev_probe_name
    host_name             = var.krtdevhostname

    authentication_certificate {
      name = var.selfsigncertname
    }
  }

  gateway_ip_configuration {
    name      = "appGatewayIpConfig"
    subnet_id = module.krtagw1subnet.subnet_id
  }

  frontend_port {
    name = local.frontend_port_name
    port = 443
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.krtagwpip[0].id
  }

  http_listener {
    name                           = local.krtqa_listener_name
    host_name                      = local.krtqa_listener_host_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = var.krtqacertname
  }

  http_listener {
    name                           = local.krtuat_listener_name
    host_name                      = local.krtuat_listener_host_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = var.krtuatcertname
  }

  http_listener {
    name                           = local.krtdev_listener_name
    host_name                      = local.krtdev_listener_host_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = var.krtdevcertname
  }

  request_routing_rule {
    name                       = local.krtdev_request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.krtdev_listener_name
    backend_address_pool_name  = local.krtdev_backend_address_pool_name
    backend_http_settings_name = local.krtdev_http_setting_name
  }

  request_routing_rule {
    name                       = local.krtqa_request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.krtqa_listener_name
    backend_address_pool_name  = local.krtqa_backend_address_pool_name
    backend_http_settings_name = local.krtqa_http_setting_name
  }

  request_routing_rule {
    name                       = local.krtuat_request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.krtuat_listener_name
    backend_address_pool_name  = local.krtuat_backend_address_pool_name
    backend_http_settings_name = local.krtuat_http_setting_name
  }

  probe {
    name                = local.krtdev_probe_name
    host                = local.krtdev_probe_host_name
    protocol            = "Https"
    path                = "/"
    interval            = "30"
    timeout             = "30"
    unhealthy_threshold = "3"
  }

  probe {
    name                = local.krtqa_probe_name
    host                = local.krtqa_probe_host_name
    protocol            = "Https"
    path                = "/"
    interval            = "30"
    timeout             = "30"
    unhealthy_threshold = "3"
  }

  probe {
    name                = local.krtuat_probe_name
    host                = local.krtuat_probe_host_name
    protocol            = "Https"
    path                = "/"
    interval            = "30"
    timeout             = "30"
    unhealthy_threshold = "3"
  }

  authentication_certificate {
    name = var.selfsigncertname
    data = filebase64(var.selfsignauthcertcer)
  }

  ssl_certificate {
    name     = var.krtdevcertname
    data     = filebase64(var.krtdevsslcertpfx)
    password = var.krtdevcertpfxpwd
  }

  /*authentication_certificate {
  name                                  = "${var.selfsigncertname}"
  data                                  = "${filebase64(var.selfsignauthcertcer)}"
  }*/

  ssl_certificate {
    name     = var.krtqacertname
    data     = filebase64(var.krtqasslcertpfx)
    password = var.krtqacertpfxpwd
  }

  /*authentication_certificate {
  name                                  = "${var.selfsigncertname}"
  data                                  = "${filebase64(var.selfsignauthcertcer)}"
  }*/

  ssl_certificate {
    name     = var.krtuatcertname
    data     = filebase64(var.krtuatsslcertpfx)
    password = var.krtuatcertpfxpwd
  }
  tags = var.tags
}

