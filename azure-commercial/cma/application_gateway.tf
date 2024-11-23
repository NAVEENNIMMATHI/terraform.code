locals {
  frontend_port_name                           =  "${var.application_acronym}frontendport"
  frontend_ip_configuration_name               =  "${var.application_acronym}frontendip"
  application_backend_address_pool_name        =  "${var.application_acronym}backendpool"
  application_http_setting_name                =  "${var.application_acronym}backendHttpsSettings"
  application_listener_name                    =  "${var.application_acronym}httpslistener"
  application_request_routing_rule_name        =  "${var.application_acronym}rule"
  application_probe_name                       =  "${var.application_acronym}probe"
  application_probe_host_name                  =  var.app_gateway_hostname
  application_listener_host_name               =  var.app_gateway_hostname
}

resource "azurerm_application_gateway" "cma_application_gateway" {
  name                        = "agw-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name         = module.cmarg.resource_group_name
  location                    = module.cmarg.resource_group_location
  
  ssl_policy {
    policy_type          = "Custom"
    min_protocol_version = "TLSv1_2"

    
    cipher_suites = ["TLS_RSA_WITH_AES_128_GCM_SHA256", "TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384", "TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA", "TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384", "TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384","TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA","TLS_RSA_WITH_AES_256_GCM_SHA384","TLS_RSA_WITH_AES_256_CBC_SHA256","TLS_RSA_WITH_AES_256_CBC_SHA", "TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256"]
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

  backend_http_settings {
    name                  = local.application_http_setting_name
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    cookie_based_affinity = "Disabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = "300"
    probe_name            = local.application_probe_name
    

    authentication_certificate {
      name = var.agw_cert_name
    }
  }

  gateway_ip_configuration {
    name      = "applicationGatewayIpConfig"
    #subnet_id = module.cmaappgatewaysubnet.subnet_id  
    subnet_id = data.terraform_remote_state.shared.outputs.app_gatewaysubnet_id_cfr
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
    name                           =   local.application_listener_name
    host_name                      =   local.application_listener_host_name
    frontend_ip_configuration_name =   local.frontend_ip_configuration_name
    frontend_port_name             =   local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = var.agw_cert_name
  }
   
  request_routing_rule {
    name                       = local.application_request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.application_listener_name
    backend_address_pool_name  = local.application_backend_address_pool_name
    backend_http_settings_name = local.application_http_setting_name
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
      status_code = ["200-699"]
      body        = ""
    }
  }

  authentication_certificate {
    name = var.agw_cert_name
    data = filebase64("${var.agw_cert_cer}.cer")
  }

  ssl_certificate {
    name     = var.agw_cert_name
    data     = filebase64("${var.agw_cert_pfx}.pfx")
    password = var.app_gateway_certpfx_password
  }
  tags = var.tags
}