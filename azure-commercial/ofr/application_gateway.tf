locals {
  frontend_port_name                    = "${var.application_acronym}frontendport"
  frontend_ip_configuration_name        = "${var.application_acronym}frontendip"
  application_backend_address_pool_name = "${var.application_acronym}backendpool"
  application_http_setting_name         = "${var.application_acronym}backendHttpsSettings"
  application_listener_name             = "${var.application_acronym}httpslistener"
  application_probe_name                = "${var.application_acronym}probe"
}

resource "azurerm_public_ip" "agw_public_ip" {
  name                = "pip-agw-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name = azurerm_resource_group.ofr.name
  location            = azurerm_resource_group.ofr.location
  allocation_method   = "Dynamic"
  tags                = var.tags
}

resource "azurerm_application_gateway" "application_gateway" {
  name                = "agw-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name = azurerm_resource_group.ofr.name
  location            = azurerm_resource_group.ofr.location

  ssl_policy {
    disabled_protocols = ["TLSv1_0", "TLSv1_1"]
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
    name         = local.application_backend_address_pool_name
    ip_addresses = [var.ase_internal_ip] 
  }

  backend_http_settings {
    name                                = local.application_http_setting_name
    cookie_based_affinity               = "Enabled"
    affinity_cookie_name                = "ApplicationGatewayAffinity"
    probe_name                          = local.application_probe_name
    port                                = 443
    protocol                            = "Https"
    request_timeout                     = 600
    #trusted_root_certificate_names      = [var.application_gw_cert_name]

    authentication_certificate {
      name = var.application_gw_cert_name
    }
  }

  gateway_ip_configuration {
    name      = "applicationGatewayIpConfig"
    subnet_id = azurerm_subnet.agw.id
  }

  frontend_port {
    name = local.frontend_port_name
    port = 443
  }

  frontend_ip_configuration {
    name                          = local.frontend_ip_configuration_name
    public_ip_address_id          = azurerm_public_ip.agw_public_ip.id
    private_ip_address_allocation = "Dynamic"
  }

  http_listener {
    name                           = local.application_listener_name
    host_name                      = var.application_gw_host_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = var.application_gw_cert_name
  }

  request_routing_rule {
    name                       = "${var.application_acronym}rule"
    rule_type                  = "Basic"
    http_listener_name         = local.application_listener_name
    backend_address_pool_name  = local.application_backend_address_pool_name
    backend_http_settings_name = local.application_http_setting_name
  }

  probe {
    name                                      = local.application_probe_name
    host                                      = var.app_service_url
    protocol                                  = "Https"
    path                                      = "/"
    interval                                  = "30"
    timeout                                   = "30"
    unhealthy_threshold                       = "3"
    pick_host_name_from_backend_http_settings = "false"

    match {
      status_code = ["200-401"]
      body        = ""
    }
  }

  authentication_certificate {
    name = var.application_gw_cert_name
    data = filebase64("${var.application_gw_host_name}.cer")
  }

  ssl_certificate {
    name     = var.application_gw_cert_name
    data     = filebase64("${var.application_gw_host_name}.pfx")
    password = ""
  }

  tags = var.tags
}
