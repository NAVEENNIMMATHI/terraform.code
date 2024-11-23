locals {
  frontend_port_name                     = "${lower(var.application_acronym)}frontendport"
  frontend_ip_configuration_name         = "${lower(var.application_acronym)}frontendip"
  application_backend_address_pool_name  = "${lower(var.application_acronym)}backendpool"
  application_gateway_cert_name         = "${lower(var.application_acronym)}_frontend_digicert_pfx"
  backend_app_gateway_cert_name         = "${lower(var.application_acronym)}_backend_authentication_ase_cer"
  environment_type_test                  = var.environment_type_test
  environment_type_final                 = var.environment_type_final
  application_acronym_umt                = "umt"

}

resource "azurerm_application_gateway" "app_application_gateway" {
  name                = "agw-${var.location_acronym}-app-${lower(var.application_acronym)}-${lower(var.environment_acronym)}"
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
    subnet_id = data.terraform_remote_state.shared.outputs.agw_subnet_id
  }
  frontend_port {
    name = local.frontend_port_name
    port = 443
  }
  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = module.agw_public_ip.public_ip_id
  }
  #Common Configuration End
#----------------------------------------------------------------------------------------------------------------#
 dynamic "backend_http_settings" { 
    for_each = var.app_gateway_backend_info == null ? [] : list(var.app_gateway_backend_info)
    content {
        name                  = "${lower(var.application_acronym)}${lower(local.environment_type_test)}-https-settings"
        cookie_based_affinity = "Enabled"
        port                  = 443
        protocol              = "Https"
        request_timeout       = 30
        probe_name            = "${lower(var.application_acronym)}${lower(local.environment_type_test)}-probe"

        authentication_certificate {
          name = local.backend_app_gateway_cert_name
      }
    }
  }
  
  dynamic "http_listener" {
    for_each = var.app_gateway_backend_info == null ? [] : list(var.app_gateway_backend_info)
    content {
    name                           = "${lower(var.application_acronym)}${lower(local.environment_type_test)}-https-listener"
    host_name                      = "${lower(var.application_acronym)}${lower(local.environment_type_test)}.kpmgcloudops.com"
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = local.application_gateway_cert_name
    }
  }

  dynamic "request_routing_rule" {
    for_each = var.app_gateway_backend_info == null ? [] : list(var.app_gateway_backend_info)
    content {
    name                       = "${lower(var.application_acronym)}${lower(local.environment_type_test)}-routing-rule"
    rule_type                  = "Basic"
    http_listener_name         = "${lower(var.application_acronym)}${lower(local.environment_type_test)}-https-listener"
    backend_address_pool_name  = local.application_backend_address_pool_name
    backend_http_settings_name = "${lower(var.application_acronym)}${lower(local.environment_type_test)}-https-settings"
    }
  }

  dynamic "probe" {
    for_each = var.app_gateway_backend_info == null ? [] : list(var.app_gateway_backend_info)
    content {
    name                = "${lower(var.application_acronym)}${lower(local.environment_type_test)}-probe"
    host                = "${lower(var.application_acronym)}${lower(local.environment_type_test)}.kpmgcloudops.com"
    protocol            = "Https"
    path                = "/"
    interval            = "30"
    timeout             = "30"
    unhealthy_threshold = "3"

    match {
      status_code = ["200-399"]
    }
   }
  }

  #----------------------------------------------------------------------------------------------------------------#

  backend_http_settings {
    name                  = "${lower(var.application_acronym)}${lower(local.environment_type_final)}-https-settings"
    cookie_based_affinity = "Enabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 90
    probe_name            = "${lower(var.application_acronym)}${lower(local.environment_type_final)}-probe"

    authentication_certificate {
      name = local.backend_app_gateway_cert_name
    }
  }  

  http_listener {
    name                           = "${lower(var.application_acronym)}${lower(local.environment_type_final)}-https-listener"
    host_name                      = "${lower(var.application_acronym)}${lower(local.environment_type_final)}.kpmgcloudops.com"
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = local.application_gateway_cert_name
  }

  request_routing_rule {
    name                       = "${lower(var.application_acronym)}${lower(local.environment_type_final)}-routing-rule"
    rule_type                  = "Basic"
    http_listener_name         = "${lower(var.application_acronym)}${lower(local.environment_type_final)}-https-listener"
    backend_address_pool_name  = local.application_backend_address_pool_name
    backend_http_settings_name = "${lower(var.application_acronym)}${lower(local.environment_type_final)}-https-settings"
  }

  probe {
    name                = "${lower(var.application_acronym)}${lower(local.environment_type_final)}-probe"
    host                = "${lower(var.application_acronym)}${lower(local.environment_type_final)}.kpmgcloudops.com"
    protocol            = "Https"
    path                = "/"
    interval            = "30"
    timeout             = "30"
    unhealthy_threshold = "3"

    match {
      status_code = ["200-399"]
    }
  }

#----------------------------------------------------------------------------------------------------------------#

dynamic "backend_http_settings" {
  for_each = var.app_gateway_backend_info == null ? [] : list(var.app_gateway_backend_info)
  content {
    name                  = "${lower(local.application_acronym_umt)}${lower(local.environment_type_test)}-https-settings"
    cookie_based_affinity = "Enabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 30
    probe_name            = "${lower(local.application_acronym_umt)}${lower(local.environment_type_test)}-probe"

    authentication_certificate {
      name = local.backend_app_gateway_cert_name
    }
  }
}  

  dynamic "http_listener" {
    for_each = var.app_gateway_backend_info == null ? [] : list(var.app_gateway_backend_info)
    content {
    name                           = "${lower(local.application_acronym_umt)}${lower(local.environment_type_test)}-https-listener"
    host_name                      = "${lower(local.application_acronym_umt)}${lower(local.environment_type_test)}.kpmgcloudops.com"
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = local.application_gateway_cert_name
    }
  }

  dynamic "request_routing_rule" {
    for_each = var.app_gateway_backend_info == null ? [] : list(var.app_gateway_backend_info)
    content {
    name                       = "${lower(local.application_acronym_umt)}${lower(local.environment_type_test)}-routing-rule"
    rule_type                  = "Basic"
    http_listener_name         = "${lower(local.application_acronym_umt)}${lower(local.environment_type_test)}-https-listener"
    backend_address_pool_name  = local.application_backend_address_pool_name
    backend_http_settings_name = "${lower(local.application_acronym_umt)}${lower(local.environment_type_test)}-https-settings"
   }
  }

  dynamic "probe" {
    for_each = var.app_gateway_backend_info == null ? [] : list(var.app_gateway_backend_info)
    content {
    name                = "${lower(local.application_acronym_umt)}${lower(local.environment_type_test)}-probe"
    host                = "${lower(local.application_acronym_umt)}${lower(local.environment_type_test)}.kpmgcloudops.com"
    protocol            = "Https"
    path                = "/"
    interval            = "30"
    timeout             = "30"
    unhealthy_threshold = "3"

    match {
      status_code = ["200-399"]
    }
   }
  }

  #----------------------------------------------------------------------------------------------------------------#

  backend_http_settings {
    name                  = "${lower(local.application_acronym_umt)}${lower(local.environment_type_final)}-https-settings"
    cookie_based_affinity = "Enabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 90
    probe_name            = "${lower(local.application_acronym_umt)}${lower(local.environment_type_final)}-probe"

    authentication_certificate {
      name = local.backend_app_gateway_cert_name
    }
  }  

  http_listener {
    name                           = "${lower(local.application_acronym_umt)}${lower(local.environment_type_final)}-https-listener"
    host_name                      = "${lower(local.application_acronym_umt)}${lower(local.environment_type_final)}.kpmgcloudops.com"
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = local.application_gateway_cert_name
  }

  request_routing_rule {
    name                       = "${lower(local.application_acronym_umt)}${lower(local.environment_type_final)}-routing-rule"
    rule_type                  = "Basic"
    http_listener_name         = "${lower(local.application_acronym_umt)}${lower(local.environment_type_final)}-https-listener"
    backend_address_pool_name  = local.application_backend_address_pool_name
    backend_http_settings_name = "${lower(local.application_acronym_umt)}${lower(local.environment_type_final)}-https-settings"
  }

  probe {
    name                = "${lower(local.application_acronym_umt)}${lower(local.environment_type_final)}-probe"
    host                = "${lower(local.application_acronym_umt)}${lower(local.environment_type_final)}.kpmgcloudops.com"
    protocol            = "Https"
    path                = "/"
    interval            = "30"
    timeout             = "30"
    unhealthy_threshold = "3"

    match {
      status_code = ["200-399"]
    }
  }

  #----------------------------------------------------------------------------------------------------------------#


  ############REST Services End-Point Start

  dynamic "backend_http_settings" {
    for_each = var.app_gateway_backend_info == null ? [] : list(var.app_gateway_backend_info)
    content {
    name                  = "${lower(var.application_acronym)}rest${lower(local.environment_type_test)}-https-settings"
    cookie_based_affinity = "Enabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 30
    probe_name            = "${lower(var.application_acronym)}rest${lower(local.environment_type_test)}-probe"

    authentication_certificate {
      name = local.backend_app_gateway_cert_name
    }
   }  
  }

  dynamic "http_listener" {
    for_each = var.app_gateway_backend_info == null ? [] : list(var.app_gateway_backend_info)
    content {
    name                           = "${lower(var.application_acronym)}rest${lower(local.environment_type_test)}-https-listener"
    host_name                      = "${lower(var.application_acronym)}rest${lower(local.environment_type_test)}.kpmgcloudops.com"
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = local.application_gateway_cert_name
    }
  }

  dynamic "request_routing_rule" {
    for_each = var.app_gateway_backend_info == null ? [] : list(var.app_gateway_backend_info)
    content {
    name                       = "${lower(var.application_acronym)}rest${lower(local.environment_type_test)}-routing-rule"
    rule_type                  = "Basic"
    http_listener_name         = "${lower(var.application_acronym)}rest${lower(local.environment_type_test)}-https-listener"
    backend_address_pool_name  = local.application_backend_address_pool_name
    backend_http_settings_name = "${lower(var.application_acronym)}rest${lower(local.environment_type_test)}-https-settings"
   }
  }

  dynamic "probe" {
    for_each = var.app_gateway_backend_info == null ? [] : list(var.app_gateway_backend_info)
    content {
    name                = "${lower(var.application_acronym)}rest${lower(local.environment_type_test)}-probe"
    host                = "${lower(var.application_acronym)}rest${lower(local.environment_type_test)}.kpmgcloudops.com"
    protocol            = "Https"
    path                = "/"
    interval            = "30"
    timeout             = "30"
    unhealthy_threshold = "3"

    match {
      status_code = ["200-399"]
    }
   }
  }

  #----------------------------------------------------------------------------------------------------------------#

  backend_http_settings {
    name                  = "${lower(var.application_acronym)}rest${lower(local.environment_type_final)}-https-settings"
    cookie_based_affinity = "Enabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 90
    probe_name            = "${lower(var.application_acronym)}rest${lower(local.environment_type_final)}-probe"

    authentication_certificate {
      name = local.backend_app_gateway_cert_name
    }
  }  

  http_listener {
    name                           = "${lower(var.application_acronym)}rest${lower(local.environment_type_final)}-https-listener"
    host_name                      = "${lower(var.application_acronym)}rest${lower(local.environment_type_final)}.kpmgcloudops.com"
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = local.application_gateway_cert_name
  }

  request_routing_rule {
    name                       = "${lower(var.application_acronym)}rest${lower(local.environment_type_final)}-routing-rule"
    rule_type                  = "Basic"
    http_listener_name         = "${lower(var.application_acronym)}rest${lower(local.environment_type_final)}-https-listener"
    backend_address_pool_name  = local.application_backend_address_pool_name
    backend_http_settings_name = "${lower(var.application_acronym)}rest${lower(local.environment_type_final)}-https-settings"
  }

  probe {
    name                = "${lower(var.application_acronym)}rest${lower(local.environment_type_final)}-probe"
    host                = "${lower(var.application_acronym)}rest${lower(local.environment_type_final)}.kpmgcloudops.com"
    protocol            = "Https"
    path                = "/"
    interval            = "30"
    timeout             = "30"
    unhealthy_threshold = "3"

    match {
      status_code = ["200-399"]
    }
  }

#----------------------------------------------------------------------------------------------------------------#

dynamic "backend_http_settings" {
  for_each = var.app_gateway_backend_info == null ? [] : list(var.app_gateway_backend_info)
  content {
    name                  = "${lower(local.application_acronym_umt)}rest${lower(local.environment_type_test)}-https-settings"
    cookie_based_affinity = "Enabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 30
    probe_name            = "${lower(local.application_acronym_umt)}rest${lower(local.environment_type_test)}-probe"

    authentication_certificate {
      name = local.backend_app_gateway_cert_name
    }
  }  
}

  dynamic "http_listener" {
    for_each = var.app_gateway_backend_info == null ? [] : list(var.app_gateway_backend_info)
    content {
    name                           = "${lower(local.application_acronym_umt)}rest${lower(local.environment_type_test)}-https-listener"
    host_name                      = "${lower(local.application_acronym_umt)}rest${lower(local.environment_type_test)}.kpmgcloudops.com"
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = local.application_gateway_cert_name
   }
  }

  dynamic "request_routing_rule" {
    for_each = var.app_gateway_backend_info == null ? [] : list(var.app_gateway_backend_info)
    content {
    name                       = "${lower(local.application_acronym_umt)}rest${lower(local.environment_type_test)}-routing-rule"
    rule_type                  = "Basic"
    http_listener_name         = "${lower(local.application_acronym_umt)}rest${lower(local.environment_type_test)}-https-listener"
    backend_address_pool_name  = local.application_backend_address_pool_name
    backend_http_settings_name = "${lower(local.application_acronym_umt)}rest${lower(local.environment_type_test)}-https-settings"
   }
  }

  dynamic "probe" {
    for_each = var.app_gateway_backend_info == null ? [] : list(var.app_gateway_backend_info)
    content {
    name                = "${lower(local.application_acronym_umt)}rest${lower(local.environment_type_test)}-probe"
    host                = "${lower(local.application_acronym_umt)}rest${lower(local.environment_type_test)}.kpmgcloudops.com"
    protocol            = "Https"
    path                = "/"
    interval            = "30"
    timeout             = "30"
    unhealthy_threshold = "3"

    match {
      status_code = ["200-399"]
    }
   }
  }

  #----------------------------------------------------------------------------------------------------------------#

  backend_http_settings {
    name                  = "${lower(local.application_acronym_umt)}rest${lower(local.environment_type_final)}-https-settings"
    cookie_based_affinity = "Enabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 90
    probe_name            = "${lower(local.application_acronym_umt)}rest${lower(local.environment_type_final)}-probe"

    authentication_certificate {
      name = local.backend_app_gateway_cert_name
    }
  }  

  http_listener {
    name                           = "${lower(local.application_acronym_umt)}rest${lower(local.environment_type_final)}-https-listener"
    host_name                      = "${lower(local.application_acronym_umt)}rest${lower(local.environment_type_final)}.kpmgcloudops.com"
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = local.application_gateway_cert_name
  }

  request_routing_rule {
    name                       = "${lower(local.application_acronym_umt)}rest${lower(local.environment_type_final)}-routing-rule"
    rule_type                  = "Basic"
    http_listener_name         = "${lower(local.application_acronym_umt)}rest${lower(local.environment_type_final)}-https-listener"
    backend_address_pool_name  = local.application_backend_address_pool_name
    backend_http_settings_name = "${lower(local.application_acronym_umt)}rest${lower(local.environment_type_final)}-https-settings"
  }

  probe {
    name                = "${lower(local.application_acronym_umt)}rest${lower(local.environment_type_final)}-probe"
    host                = "${lower(local.application_acronym_umt)}rest${lower(local.environment_type_final)}.kpmgcloudops.com"
    protocol            = "Https"
    path                = "/"
    interval            = "30"
    timeout             = "30"
    unhealthy_threshold = "3"

    match {
      status_code = ["200-399"]
    }
  }

  #Rest Services End-Point End

  authentication_certificate {
    name = local.backend_app_gateway_cert_name
    data = filebase64("${var.backend_cer_cert_name}.cer")
  }

  ssl_certificate {
    name     = local.application_gateway_cert_name
    data     = filebase64("${var.frontend_pfx_cert_name}.pfx")
    password = ""
    #key_vault_secret_id = data.azurerm_key_vault_secret.ssl_certificate.id
  }
  tags = var.tags
}
