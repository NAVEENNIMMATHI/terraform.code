locals {
  frontend_port_name             = "${var.application_acronym}frontendport"
  frontend_ip_configuration_name = "${var.application_acronym}frontendip"

  application_backend_address_pool_name = "${var.application_acronym}backendpool"
  application_http_setting_name         = "${var.application_acronym}backendHttpsSettings"
  application_listener_name             = "${var.application_acronym}httpslistener"
  application_request_routing_rule_name = "${var.application_acronym}rule"
  application_probe_name                = "${var.application_acronym}probe"
  application_probe_host_name           = var.app_gateway_hostname
  application_listener_host_name        = var.app_gateway_hostname

  supportapp_backend_address_pool_name = "supportappbackendpool"
  supportapp_http_setting_name         = "supportappbackendHttpsSettings"
  supportapp_listener_name             = "supportapphttpslistener"
  supportapp_request_routing_rule_name = "supportapprule"
  supportapp_probe_name                = "supportappprobe"
  supportapp_probe_host_name           = var.supportapp_gateway_hostname
  supportapp_listener_host_name        = var.supportapp_gateway_hostname

  apiapp_backend_address_pool_name        = "apiappbackendpool"
  apiapp_http_setting_name                = "apiappbackendHttpsSettings"
  apiapp_listener_name                    = "apiapphttpslistener"
  apiapp_request_routing_rule_name        = "apiapprule"
  apiapp_probe_name                       = "apiappprobe"
  apiapp_probe_host_name                  = var.apiapp_gateway_hostname
  apiapp_listener_host_name               = var.apiapp_gateway_hostname

  apisupportapp_backend_address_pool_name = "apisupportappbackendpool"
  apisupportapp_http_setting_name         = "apisupportappbackendHttpsSettings"
  apisupportapp_listener_name             = "apisupportapphttpslistener"
  apisupportapp_request_routing_rule_name = "apisupportapprule"
  apisupportapp_probe_name                = "apisupportappprobe"
  apisupportapp_probe_host_name           = var.apisupportapp_gateway_hostname
  apisupportapp_listener_host_name        = var.apisupportapp_gateway_hostname
}

resource "azurerm_public_ip" "public_ip" {
  name                = "pip-${var.app_gateway_name}"
  resource_group_name = module.sharedrg.resource_group_name
  location            = module.sharedrg.resource_group_location
  allocation_method   = "Dynamic"

  tags = var.tags
}

resource "azurerm_application_gateway" "application_gateway" {
  name                = var.app_gateway_name
  resource_group_name = module.sharedrg.resource_group_name
  location            = module.sharedrg.resource_group_location

  #disabled_ssl_protocols = ["TLSv1_0","TLSv1_1"]
  ssl_policy {
    policy_type          = "Custom"
    min_protocol_version = "TLSv1_2"

    #disabled_protocols  = ["TLSv1_0","TLSv1_1"]
    cipher_suites = ["TLS_RSA_WITH_AES_128_GCM_SHA256", "TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384", "TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA", "TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384", "TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384", "TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA", "TLS_RSA_WITH_AES_256_GCM_SHA384", "TLS_RSA_WITH_AES_256_CBC_SHA256", "TLS_RSA_WITH_AES_256_CBC_SHA"]
  }

  sku {
    name     = "WAF_Medium"
    tier     = "WAF"
    capacity = "2"
  }

  waf_configuration {
    enabled          = "true"
    firewall_mode    = "Detection"
    rule_set_version = "3.0"
  }

  backend_address_pool {
    name         = local.application_backend_address_pool_name
    ip_addresses = [var.ase_internal_ip]
  }

  backend_address_pool {
    name         = local.supportapp_backend_address_pool_name
    ip_addresses = [var.ase_internal_ip]
  }

  backend_address_pool {
    name         = local.apiapp_backend_address_pool_name
    ip_addresses = [var.ase_internal_ip]
  }

  backend_address_pool {
    name         = local.apisupportapp_backend_address_pool_name
    ip_addresses = [var.ase_internal_ip]
  }

  backend_http_settings {
    name                  = local.application_http_setting_name
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    cookie_based_affinity = "Disabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = "300"
    probe_name            = local.application_probe_name
    host_name             = var.target_deployment_environment == "prod" ? var.app_url : ""

    authentication_certificate {
      name = var.agw_cert_name
    }
  }

  backend_http_settings {
    name                  = local.supportapp_http_setting_name
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    cookie_based_affinity = "Disabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = "300"
    probe_name            = local.supportapp_probe_name

    authentication_certificate {
      name = var.agw_cert_name
    }
  }

  backend_http_settings {
    name                  = local.apiapp_http_setting_name
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    cookie_based_affinity = "Disabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = "300"
    probe_name            = local.apiapp_probe_name

    authentication_certificate {
      name = var.agw_cert_name
    }
  }

  backend_http_settings {
    name                  = local.apisupportapp_http_setting_name
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    cookie_based_affinity = "Disabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = "300"
    probe_name            = local.apisupportapp_probe_name

    authentication_certificate {
      name = var.agw_cert_name
    }
  }

  gateway_ip_configuration {
    name      = "applicationGatewayIpConfig"
    subnet_id = module.appgatewaysubnet.subnet_id
  }

  frontend_port {
    name = local.frontend_port_name
    port = 443
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.public_ip.id
  }

  http_listener {
    name                           = local.application_listener_name
    host_name                      = local.application_listener_host_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = var.agw_cert_name
  }

  http_listener {
    name                           = local.supportapp_listener_name
    host_name                      = local.supportapp_listener_host_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = var.supportapp_agw_cert_name
  }

  http_listener {
    name                           = local.apiapp_listener_name
    host_name                      = local.apiapp_listener_host_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = var.apiapp_agw_cert_name
  }

  http_listener {
    name                           = local.apisupportapp_listener_name
    host_name                      = local.apisupportapp_listener_host_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = var.apisupportapp_agw_cert_name
  }

  request_routing_rule {
    name                       = local.application_request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.application_listener_name
    backend_address_pool_name  = local.application_backend_address_pool_name
    backend_http_settings_name = local.application_http_setting_name
  }

  request_routing_rule {
    name                       = local.supportapp_request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.supportapp_listener_name
    backend_address_pool_name  = local.supportapp_backend_address_pool_name
    backend_http_settings_name = local.supportapp_http_setting_name
  }

  request_routing_rule {
    name                       = local.apiapp_request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.apiapp_listener_name
    backend_address_pool_name  = local.apiapp_backend_address_pool_name
    backend_http_settings_name = local.apiapp_http_setting_name
  }

  request_routing_rule {
    name                       = local.apisupportapp_request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.apisupportapp_listener_name
    backend_address_pool_name  = local.apisupportapp_backend_address_pool_name
    backend_http_settings_name = local.apisupportapp_http_setting_name
  }

  probe {
    name                = local.application_probe_name
    host                = var.app_gateway_hostname
    protocol            = "Https"
    path                = "/"
    interval            = "30"
    timeout             = "300"
    unhealthy_threshold = "3"

    match {
      status_code = ["200-499"]
      body        = ""
    }
  }

  probe {
    name                = local.supportapp_probe_name
    host                = var.supportapp_gateway_hostname
    protocol            = "Https"
    path                = "/"
    interval            = "30"
    timeout             = "300"
    unhealthy_threshold = "3"

    match {
      status_code = ["200-499"]
      body        = ""
    }
  }

  probe {
    name                = local.apiapp_probe_name
    host                = var.apiapp_gateway_hostname
    protocol            = "Https"
    path                = "/"
    interval            = "30"
    timeout             = "300"
    unhealthy_threshold = "3"

    match {
      status_code = ["200-699"]
      body        = ""
    }
  }

  probe {
    name                = local.apisupportapp_probe_name
    host                = var.apisupportapp_gateway_hostname
    protocol            = "Https"
    path                = "/"
    interval            = "30"
    timeout             = "300"
    unhealthy_threshold = "3"

    match {
      status_code = ["200-699"]
      body        = ""
    }
  }

  authentication_certificate {
    name      = var.agw_cert_name
    data      = filebase64(var.agw_cert_cer)
  }

  ssl_certificate {
    name     = var.agw_cert_name
    data     = filebase64(var.agw_cert_pfx)
    password = var.app_gateway_certpfx_password
  }

  ssl_certificate {
    name     = var.supportapp_agw_cert_name
    data     = filebase64(var.supportapp_agw_cert_pfx)
    password = var.app_gateway_certpfx_password
  }

  ssl_certificate {
    name     = var.apiapp_agw_cert_name
    data     = filebase64(var.apiapp_agw_cert_pfx)
    password = var.app_gateway_certpfx_password
  }

  ssl_certificate {
    name     = var.apisupportapp_agw_cert_name
    data     = filebase64(var.apisupportapp_agw_cert_pfx)
    password = var.app_gateway_certpfx_password
  }

  tags      = var.tags
}

