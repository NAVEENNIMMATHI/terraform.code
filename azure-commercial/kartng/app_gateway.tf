locals {
  frontend_port_name                     = "${lower(var.application_acronym)}frontendport"
  frontend_ip_configuration_name         = "${lower(var.application_acronym)}frontendip"
  application_backend_address_pool_name  = "${lower(var.application_acronym)}backendpool"
  application_gateway_cert_name         = "${lower(var.application_acronym)}_frontend_digicert_pfx"
  application_gateway_cert_rest_name    = "${lower(var.application_acronym)}_rest_frontend_digicert_pfx"
  backend_app_gateway_cert_name         = "${lower(var.application_acronym)}_backend_authentication_ase_cer"
  environment_type                  = var.app_gateway_environment_acronym
  ###environment_type                 = var.environment_type
}

module "appgateway_public_ip" {
  source                    = "../../modules/public_ip"
  public_ip_name            = "pip-gateway-${lower(var.location_acronym)}-${lower(var.application_acronym)}-${lower(var.environment_acronym)}"
  resource_group_name       = module.applicationrg.resource_group_name
  resource_group_location   = module.applicationrg.resource_group_location
  sku                       = "Basic"
  allocation_method         = "Dynamic"
  tags                      = var.tags
}

resource "azurerm_application_gateway" "this" {
  name                = "agw-${lower(var.location_acronym)}-appgw-${lower(var.application_acronym)}-${lower(var.environment_acronym)}"
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location
  ssl_policy {
    policy_type          = "Custom"
    min_protocol_version = "TLSv1_2"
    cipher_suites = ["TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384", "TLS_RSA_WITH_AES_256_GCM_SHA384", "TLS_RSA_WITH_AES_128_GCM_SHA256", "TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384", "TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256"]
  }

#Common Configuration Start
  sku {
    name     = var.application_gateway_sku_name
    tier     = var.application_gateway_sku_tier
    capacity = var.application_gateway_sku_capacity
  }
  waf_configuration {
    enabled          = "true"
    firewall_mode    = "Detection"
    rule_set_version = "3.0"
  }
  backend_address_pool {
    name = local.application_backend_address_pool_name
    ip_addresses = [var.ase_internal_ip]
  }
  gateway_ip_configuration {
    name      = "applicationGatewayIpConfig"
    subnet_id = data.terraform_remote_state.shared.outputs.agw_kpmgonly_subnet_id
  }
  frontend_port {
    name = local.frontend_port_name
    port = 443
  }
  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = module.appgateway_public_ip.public_ip_id
  }
  #Common Configuration End
 

  backend_http_settings {
    name                  = "${lower(var.application_acronym)}${lower(local.environment_type)}-https-settings"
    cookie_based_affinity = "Enabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 30
    probe_name            = "${lower(var.application_acronym)}${lower(local.environment_type)}-probe"

    authentication_certificate {
      name = local.backend_app_gateway_cert_name
    }
  }  

  http_listener {
    name                           = "${lower(var.application_acronym)}${lower(local.environment_type)}-https-listener"
    host_name                      = "${lower(var.application_acronym)}${lower(local.environment_type)}.kpmgcloudops.com"
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = local.application_gateway_cert_name
  }

  request_routing_rule {
    name                       = "${lower(var.application_acronym)}${lower(local.environment_type)}-routing-rule"
    rule_type                  = "Basic"
    http_listener_name         = "${lower(var.application_acronym)}${lower(local.environment_type)}-https-listener"
    backend_address_pool_name  = local.application_backend_address_pool_name
    backend_http_settings_name = "${lower(var.application_acronym)}${lower(local.environment_type)}-https-settings"
  }

  probe {
    name                = "${lower(var.application_acronym)}${lower(local.environment_type)}-probe"
    host                = "${lower(var.application_acronym)}${lower(local.environment_type)}.kpmgcloudops.com"
    protocol            = "Https"
    path                = "/"
    interval            = "30"
    timeout             = "30"
    unhealthy_threshold = "3"

    match {
      status_code = ["200-399"]
    }
  }

  ssl_certificate {
    name     = local.application_gateway_cert_name
    data     = filebase64("${var.frontend_pfx_cert_name}.pfx")
    password = ""
    #key_vault_secret_id = data.azurerm_key_vault_secret.ssl_certificate.id
  }

 
  ############REST Services End-Point Start
 

  backend_http_settings {
    name                  = "${lower(var.application_acronym)}rest${lower(local.environment_type)}-https-settings"
    cookie_based_affinity = "Enabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 30
    probe_name            = "${lower(var.application_acronym)}rest${lower(local.environment_type)}-probe"

    authentication_certificate {
      name = local.backend_app_gateway_cert_name
    }
  }  

  http_listener {
    name                           = "${lower(var.application_acronym)}rest${lower(local.environment_type)}-https-listener"
    host_name                      = "${lower(var.application_acronym)}rest${lower(local.environment_type)}.kpmgcloudops.com"
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = local.application_gateway_cert_rest_name
  }

  request_routing_rule {
    name                       = "${lower(var.application_acronym)}rest${lower(local.environment_type)}-routing-rule"
    rule_type                  = "Basic"
    http_listener_name         = "${lower(var.application_acronym)}rest${lower(local.environment_type)}-https-listener"
    backend_address_pool_name  = local.application_backend_address_pool_name
    backend_http_settings_name = "${lower(var.application_acronym)}rest${lower(local.environment_type)}-https-settings"
  }

  probe {
    name                = "${lower(var.application_acronym)}rest${lower(local.environment_type)}-probe"
    host                = "${lower(var.application_acronym)}rest${lower(local.environment_type)}.kpmgcloudops.com"
    protocol            = "Https"
    path                = "/"
    interval            = "30"
    timeout             = "30"
    unhealthy_threshold = "3"

    match {
      status_code = ["200-399"]
    }
  }
  

  authentication_certificate {
    name = local.backend_app_gateway_cert_name
    data = filebase64("${var.backend_cer_cert_name}.cer")
  }

  ssl_certificate {
    name     = local.application_gateway_cert_rest_name
    data     = filebase64("${var.frontend_pfx_cert_rest_name}.pfx")
    password = ""
    #key_vault_secret_id = data.azurerm_key_vault_secret.ssl_certificate.id
  }
  tags = var.tags
}