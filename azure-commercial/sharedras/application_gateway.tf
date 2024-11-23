resource "azurerm_public_ip" "agwpip" {
  count               = var.environment_acronym == "pd" || var.environment_acronym == "dv" ? "1" : "0"

  name                = "pip-agw-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name = module.sharedrg.resource_group_name
  location            = module.sharedrg.resource_group_location
  allocation_method   = "Dynamic"

  tags = var.tags
}

locals {
  frontend_port_name                      = "fastpathfrontendport"
  frontend_ip_configuration_name          = "fastpathfrontendip"
  appcertname                             = "fastpath${var.agw_environment_acronym}_kpmgcloudops_com"

  fastpath_backend_http_setting_name      = "fastpathbackendHttpsSettings"
  fastpath_listener_name                  = "fastpathhttpslistener"
  fastpath_listener_host_name             = "fastpath${var.agw_environment_acronym}.kpmgcloudops.com"
  fastpath_ssl_certificate_name           = "fastpath${var.agw_environment_acronym}_kpmgcloudops_com"
  fastpath_request_routing_rule_name      = "fastpathrule"
  fastpath_backend_address_pool_name      = "fastpathbackendpool"
  fastpath_probe_name                     = "fastpathprobe"
  fastpath_probe_host_name                = "fastpath${var.agw_environment_acronym}.kpmgcloudops.com"
  fastpath_backend_host_name              = var.environment_acronym == "pd" ? "fppd.kpmgcloudops.com" : "fastpath${var.agw_environment_acronym}.kpmgcloudops.com"

  supportapp_backend_http_setting_name    = "supportappbackendHttpsSettings"
  supportapp_listener_name                = "supportapphttpslistener"
  supportapp_listener_host_name           = "adminfastpath${var.agw_environment_acronym}.kpmgcloudops.com"
  supportapp_ssl_certificate_name         = "adminfastpath${var.agw_environment_acronym}_kpmgcloudops_com"
  supportapp_request_routing_rule_name    = "supportapprule"
  supportapp_backend_address_pool_name    = "supportappbackendpool"
  supportapp_probe_name                   = "supportappprobe"
  supportapp_probe_host_name              = "adminfastpath${var.agw_environment_acronym}.kpmgcloudops.com"

  apiapp_backend_http_setting_name        = "apiappbackendHttpsSettings"
  apiapp_listener_name                    = "apiapphttpslistener"
  apiapp_listener_host_name               = "apifastpath${var.agw_environment_acronym}.kpmgcloudops.com"
  apiapp_ssl_certificate_name             = "apifastpath${var.agw_environment_acronym}_kpmgcloudops_com"
  apiapp_request_routing_rule_name        = "apiapprule"
  apiapp_backend_address_pool_name        = "apiappbackendpool"
  apiapp_probe_name                       = "apiappprobe"
  apiapp_probe_host_name                  = "apifastpath${var.agw_environment_acronym}.kpmgcloudops.com"

  apisupportapp_backend_http_setting_name = "apisupportappbackendHttpsSettings"
  apisupportapp_listener_name             = "apisupportapphttpslistener"
  apisupportapp_listener_host_name        = "apiadminfastpath${var.agw_environment_acronym}.kpmgcloudops.com"
  apisupportapp_ssl_certificate_name      = "apiadminfastpath${var.agw_environment_acronym}_kpmgcloudops_com"
  apisupportapp_request_routing_rule_name = "apisupportapprule"
  apisupportapp_backend_address_pool_name = "apisupportappbackendpool"
  apisupportapp_probe_name                = "apisupportappprobe"
  apisupportapp_probe_host_name           = "apiadminfastpath${var.agw_environment_acronym}.kpmgcloudops.com"
}

resource "azurerm_application_gateway" "appgw" {
  count               = var.environment_acronym == "pd" || var.environment_acronym == "dv" ? "1" : "0"

  name                = "agw-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name = module.sharedrg.resource_group_name
  location            = module.sharedrg.resource_group_location

  ssl_policy {
    policy_type          = "Custom"
    min_protocol_version = "TLSv1_2"

    cipher_suites = [
      "TLS_RSA_WITH_AES_128_GCM_SHA256",
      "TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384",
      "TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA",
      "TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384",
      "TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256",
      "TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384",
      "TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA",
      "TLS_RSA_WITH_AES_256_GCM_SHA384",
      "TLS_RSA_WITH_AES_256_CBC_SHA256",
      "TLS_RSA_WITH_AES_256_CBC_SHA"      
    ]
  }

  sku {
    name     = var.app_gw_sku_name
    tier     = var.app_gw_sku_tier
    capacity = var.app_gw_sku_capacity
  }

  waf_configuration {
    enabled          = "true"
    firewall_mode    = "Detection"
    rule_set_version = "3.0"
  }

  dynamic "authentication_certificate" {
    for_each = var.authentication_certificates
    content {
      name = authentication_certificate.value["certname"]
      data = filebase64(authentication_certificate.value["authcertcer"])
    }
  }

  dynamic "ssl_certificate" {
    for_each = var.ssl_certificates
    content {
      name = ssl_certificate.value["certname"]
      data = filebase64(ssl_certificate.value["sslcertpfx"])
      password = ""
    }
  }

  backend_address_pool {
    name         = local.fastpath_backend_address_pool_name
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
    name                  = local.fastpath_backend_http_setting_name
    cookie_based_affinity = "Disabled"
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 300

    host_name             = local.fastpath_backend_host_name
    probe_name            = local.fastpath_probe_name

    authentication_certificate {
      name = local.appcertname
    }
  }

  backend_http_settings {
    name                  = local.supportapp_backend_http_setting_name
    cookie_based_affinity = "Disabled"
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 300

    probe_name            = local.supportapp_probe_name

    authentication_certificate {
      name = local.appcertname
    }
  }

  backend_http_settings {
    name                  = local.apiapp_backend_http_setting_name
    cookie_based_affinity = "Disabled"
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 300

    probe_name            = local.apiapp_probe_name

    authentication_certificate {
      name = local.appcertname
    }
  }

  backend_http_settings {
    name                  = local.apisupportapp_backend_http_setting_name
    cookie_based_affinity = "Disabled"
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 300

    probe_name            = local.apisupportapp_probe_name

    authentication_certificate {
      name = local.appcertname
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
    public_ip_address_id = azurerm_public_ip.agwpip[0].id
  }

  http_listener {
    name                           = local.fastpath_listener_name
    host_name                      = local.fastpath_listener_host_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = local.fastpath_ssl_certificate_name
  }

  http_listener {
    name                           = local.supportapp_listener_name
    host_name                      = local.supportapp_listener_host_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = local.supportapp_ssl_certificate_name
  }

  http_listener {
    name                           = local.apiapp_listener_name
    host_name                      = local.apiapp_listener_host_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = local.apiapp_ssl_certificate_name
  }

  http_listener {
    name                           = local.apisupportapp_listener_name
    host_name                      = local.apisupportapp_listener_host_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = local.apisupportapp_ssl_certificate_name
  }

  request_routing_rule {
    name                       = local.fastpath_request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.fastpath_listener_name
    backend_address_pool_name  = local.fastpath_backend_address_pool_name
    backend_http_settings_name = local.fastpath_backend_http_setting_name
  }

  request_routing_rule {
    name                       = local.supportapp_request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.supportapp_listener_name    
    backend_address_pool_name  = local.supportapp_backend_address_pool_name
    backend_http_settings_name = local.supportapp_backend_http_setting_name
  }

  request_routing_rule {
    name                       = local.apiapp_request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.apiapp_listener_name   
    backend_address_pool_name  = local.apiapp_backend_address_pool_name 
    backend_http_settings_name = local.apiapp_backend_http_setting_name
  }

  request_routing_rule {
    name                       = local.apisupportapp_request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.apisupportapp_listener_name    
    backend_address_pool_name  = local.apisupportapp_backend_address_pool_name 
    backend_http_settings_name = local.apisupportapp_backend_http_setting_name
  }

  probe {
    name                = local.fastpath_probe_name
    host                = local.fastpath_probe_host_name
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
    host                = local.supportapp_probe_host_name
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
    host                = local.apiapp_probe_host_name
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
    host                = local.apisupportapp_probe_host_name
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


  tags = var.tags
}