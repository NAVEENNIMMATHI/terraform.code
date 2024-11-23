locals {
  spipaasrepgenrest_frontend_port_name                    = "${var.application_name}repgenrestGatewayFrontendIP"
  spipaasrepgenrest_frontend_ip_configuration_name        = "${var.application_name}repgenrestGatewayFrontendIP"
  spipaasrepgenrest_http_setting_name                     = "${var.application_name}repgenrestGatewayBackendHttpsSettings"
  spipaasrepgenrest_listener_name                         = "${var.application_name}repgenrestGatewayHttpsListener"
  spipaasrepgenrest_request_routing_rule_name             = "${var.application_name}repgenrestRule"
  spipaasrepgenrest_backend_address_pool_name             = "${var.application_name}repgenrestappBackendPool"
  spipaasrepgenrest_probe_name                            = "${var.application_name}repgenrestGatewayProbe"
}

resource "azurerm_public_ip" "agwpip" {
  for_each = var.application_gateway
  name                        = "pip-agw-${each.value.location_acronym}-${var.application_acronym}-${each.value.region}-${var.environment_acronym}"
  resource_group_name         = module.applicationrg[each.key].resource_group_name
  location                    = module.applicationrg[each.key].resource_group_location
  allocation_method           = "Dynamic"
  tags                        = var.tags
}

resource "azurerm_application_gateway" "application_gateway" {
  for_each = var.application_gateway
  name                                    = "agw-${each.value.location_acronym}-${var.application_acronym}-${each.value.region}-${var.environment_acronym}"
  resource_group_name                     = module.applicationrg[each.key].resource_group_name
  location                                = module.applicationrg[each.key].resource_group_location

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
    name                                    = local.spipaasrepgenrest_backend_address_pool_name
    fqdns                                   = ["${var.application_name}repgenrest${each.value.region}${var.app_gateway_environment_acronym}.azurewebsites.net"]

  }
 

  backend_http_settings {
    name                          = local.spipaasrepgenrest_http_setting_name
    affinity_cookie_name          = "ApplicationGatewayAffinity"
    host_name                     = each.value.hostname
    cookie_based_affinity         = "Enabled"
    port                          = 443
    protocol                      = "Https"
    request_timeout               = 30
    probe_name                    = local.spipaasrepgenrest_probe_name

    authentication_certificate {
      name                        = "${var.application_name}repgenrest${each.value.region}${var.app_gateway_environment_acronym}_kpmgcloudops_com"
    }
  }

  gateway_ip_configuration {
    name                                     = "${var.application_name}repgenrestappGatewayIpConfig"
    subnet_id                                = azurerm_subnet.spipaasappgw_subnet[each.key].id
  }


  frontend_port {
    name                                      = local.spipaasrepgenrest_frontend_port_name
    port                                      = 443
  }

  frontend_ip_configuration {
    name                                      = local.spipaasrepgenrest_frontend_ip_configuration_name
    public_ip_address_id                      = azurerm_public_ip.agwpip[each.key].id
  }

 
 http_listener {
    name                           = local.spipaasrepgenrest_listener_name
    host_name                      = each.value.hostname
    frontend_ip_configuration_name = local.spipaasrepgenrest_frontend_ip_configuration_name
    frontend_port_name             = local.spipaasrepgenrest_frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = "${var.application_name}repgenrest${each.value.region}${var.app_gateway_environment_acronym}_kpmgcloudops_com"
  }
 
request_routing_rule {
    name                           = local.spipaasrepgenrest_request_routing_rule_name
    rule_type                      = "Basic"
    http_listener_name             = local.spipaasrepgenrest_listener_name
    backend_address_pool_name      = local.spipaasrepgenrest_backend_address_pool_name
    backend_http_settings_name     = local.spipaasrepgenrest_http_setting_name
  }

  probe {
    name                = local.spipaasrepgenrest_probe_name
    host                = each.value.hostname
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
    name                                      = "${var.application_name}repgenrest${each.value.region}${var.app_gateway_environment_acronym}_kpmgcloudops_com"
    data                                      = filebase64("${each.value.sslcert}")
  }

ssl_certificate {
    name                                      = "${var.application_name}repgenrest${each.value.region}${var.app_gateway_environment_acronym}_kpmgcloudops_com"
    data                                      = filebase64("${each.value.sslcertpfx}")
    password                                  = var.AppGatewaycertpassword
  }
  tags                                        = var.tags
}
