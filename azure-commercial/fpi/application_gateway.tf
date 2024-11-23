resource "azurerm_application_gateway" "fpi_appgw01" {
  name                                       = var.environment=="production" ? "co-p-spi-fpi-appgw" : "agw-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name                        = module.rgfpi.resource_group_name
  location                                   = module.rgfpi.resource_group_location
  ssl_policy {
    policy_type                              = "Custom"
    min_protocol_version                     = "TLSv1_2"
    cipher_suites                            = ["TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256", "TLS_RSA_WITH_AES_128_GCM_SHA256", "TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384", "TLS_RSA_WITH_AES_256_GCM_SHA384", "TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384"]
  }
  sku {
    name                                     = "WAF_v2"
    tier                                     = "WAF_v2"
    capacity                                 = 2
  }
  gateway_ip_configuration {
    name                                     = var.gateway_ip_configuration_name
    subnet_id                                = azurerm_subnet.frontend.id
  }
  frontend_port {
    name                                     = var.frontend_port_name
    port                                     = 80
  }
  frontend_port {
    name                                     = var.frontend_port2_name
    port                                     = 443
  }
  frontend_ip_configuration {
    name                                     = var.frontend_ip_configuration_name
    public_ip_address_id                     = azurerm_public_ip.fpiappgwpip.id
  }

  backend_address_pool {
    name                                     = var.backend_address_pool_name
  }

  backend_http_settings {
    name                                     = var.backend_http_settings_name1
    path                                     = "/"
    port                                     = 80
    probe_name                               = ""
    protocol                                 = "Http"
    request_timeout                          = 1200
    affinity_cookie_name                     = "ApplicationGatewayAffinity"
    cookie_based_affinity                    = "Disabled"
  }

  backend_http_settings {
    cookie_based_affinity                    = "Enabled"
    name                                     = var.backend_http_settings_name2
    port                                     = 443
    protocol                                 = "Https"
    request_timeout                          = 1200
    probe_name                               = "healthprobefpi"
    affinity_cookie_name                     = "ApplicationGatewayAffinity"
    host_name                                = var.host_name
  }
  backend_http_settings {
    cookie_based_affinity                    = "Enabled"
    name                                     = var.backend_http_settings_name3
    port                                     = 8083
    protocol                                 = "Https"
    request_timeout                          = 1200
    probe_name                               = "healthproberestfpi"
    affinity_cookie_name                     = "ApplicationGatewayAffinity"
    host_name                                = var.host_name1
  }

  http_listener {
    name                                     = var.listener_name
    frontend_ip_configuration_name           = var.frontend_ip_configuration_name
    frontend_port_name                       = var.frontend_port_name
    protocol                                 = "Http"
    require_sni                              = "false"
  }

  http_listener {
    name                                     = var.listener2_name
    host_name                                = var.app_listener_host_name
    frontend_ip_configuration_name           = var.frontend_ip_configuration_name
    frontend_port_name                       = var.frontend_port2_name
    protocol                                 = "Https"
    require_sni                              = "true"
    ssl_certificate_name                     = var.http_listener_ssl_certificate_name
  }
  http_listener {
    name                                     = var.listener3_name
    host_name                                = var.fpirest_listener_host_name
    frontend_ip_configuration_name           = var.frontend_ip_configuration_name
    frontend_port_name                       = var.frontend_port2_name
    protocol                                 = "Https"
    require_sni                              = "true"
    ssl_certificate_name                     = var.http_listener_rest_ssl_certificate_name
  }

  probe {
    name                                      = var.probe_name
    host                                      = var.probe_host_name
    protocol                                  = "Https"
    path                                      = "/"
    interval                                  = "30"
    timeout                                   = "30"
    unhealthy_threshold                       = "10"
    pick_host_name_from_backend_http_settings = false
    match {
      status_code                             = ["200-499"]
      body                                    = ""
    }
  }
   probe {
    name                                      = var.probe_name1
    host                                      = var.probe_host_name1
    protocol                                  = "Https"
    path                                      = "/"
    interval                                  = "30"
    timeout                                   = "30"
    unhealthy_threshold                       = "10"
    pick_host_name_from_backend_http_settings = false
    match {
      status_code                             = ["200-499"]
      body                                    = ""
    }
  }

  request_routing_rule {
    name                                      = var.request_routing_rule_name
    rule_type                                 = "Basic"
    http_listener_name                        = var.listener_name
    backend_address_pool_name                 = var.backend_address_pool_name
    backend_http_settings_name                = var.backend_http_settings_name1
  }

  request_routing_rule {
    name                                      = var.request_routing_rule2_name
    rule_type                                 = "Basic"
    http_listener_name                        = var.listener2_name
    backend_address_pool_name                 = var.backend_address_pool_name
    backend_http_settings_name                = var.backend_http_settings_name2
  }
   request_routing_rule {
    name                                      = var.request_routing_rule3_name
    rule_type                                 = "Basic"
    http_listener_name                        = var.listener3_name
    backend_address_pool_name                 = var.backend_address_pool_name
    backend_http_settings_name                = var.backend_http_settings_name3
  }

  ssl_certificate {
    name                                      = var.http_listener_ssl_certificate_name
    data                                      = filebase64("${var.http_listener_ssl_certificate}.pfx")
    password                                  = var.http_listener_ssl_certificate_password
  }
  ssl_certificate {
    name                                      = var.http_listener_rest_ssl_certificate_name
    data                                      = filebase64("${var.http_listener_rest_ssl_certificate_name}.pfx")
    password                                  = var.http_listener_ssl_certificate_password
  }
  waf_configuration {
    enabled                                   = "true"
    firewall_mode                             = "Detection"
    rule_set_version                          = "3.0"
  }

  tags = var.tags
}