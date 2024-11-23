
locals {
  frontend_port_name                    = "${lower(var.application_acronym)}frontendport"
  frontend_ip_configuration_name        = "${lower(var.application_acronym)}frontendip"
  application_gateway_cert_name         = "${lower(var.application_acronym)}_frontend_digicert_pfx"
  backend_app_gateway_cert_name         = "${lower(var.application_acronym)}_backend_authentication_ase_cer"
  environment_type                      = var.application_gateway.environment_acronym
  environment_suffix                    = var.application_gateway.environment_acronym == "" ? "" : "-${var.application_gateway.environment_acronym}"
  rest_prefix                           = "${lower(var.application_acronym)}rest${lower(local.environment_type)}"
  
}

resource "azurerm_public_ip" "appgateway_public_ip" {
  name                    = lower("pip-agw-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}")
  location                = module.impact_rg.resource_group_location
  resource_group_name     = module.impact_rg.resource_group_name
  domain_name_label       = "agw-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  sku                     = "Standard"
  allocation_method       = "Static"
  tags                    = var.tags
}

resource "azurerm_application_gateway" "app_gateway" {
  name                = lower("agw-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}")
  resource_group_name = module.impact_rg.resource_group_name
  location            = module.impact_rg.resource_group_location
  ssl_policy {
    policy_type          = "Custom"
    min_protocol_version = "TLSv1_2"
    cipher_suites = [
      "TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384",
      "TLS_RSA_WITH_AES_256_GCM_SHA384",
      "TLS_RSA_WITH_AES_128_GCM_SHA256",
      "TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384",
    "TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256"]
  }

  #Common Configuration Start
  sku {
    name     = var.application_gateway.sku.name
    tier     = var.application_gateway.sku.tier
    #capacity = var.application_gateway.sku.capacity
  }

  firewall_policy_id = azurerm_web_application_firewall_policy.impact_agw_policy.id

  autoscale_configuration {
    min_capacity = 1
    max_capacity = 10
  }

  gateway_ip_configuration {
    name      = "applicationGatewayIpConfig"
    subnet_id = module.impact_agw_subnet.subnet_id
  }
  frontend_port {
    name = local.frontend_port_name
    port = 443
  }
  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.appgateway_public_ip.id
  }
  #Common Configuration End


  ##############Site=1 Application

  backend_address_pool {
      name         = "webapp-backendpool"
      fqdns        = [
                      "app-use-impact-${var.environment_acronym}.azurewebsites.net"
                    ]
  }

  backend_http_settings {
      name                  = "${lower(var.application_acronym)}webapp${lower(local.environment_type)}-https-settings"
      cookie_based_affinity = "Enabled"
      affinity_cookie_name = "ApplicationGatewayAffinity"
      port                  = 443
      protocol              = "Https"
      request_timeout       = 30
      # host_name             = "app-use-impact-${var.environment_acronym}.azurewebsites.net"
      pick_host_name_from_backend_address = "true"
      probe_name            = "${lower(var.application_acronym)}webapp${lower(local.environment_type)}-probe"

    }

    http_listener {
      name                           = "webapp-https-listener"
      host_name                      = var.webapp_cert_name
      frontend_ip_configuration_name = local.frontend_ip_configuration_name
      frontend_port_name             = local.frontend_port_name
      protocol                       = "Https"
      require_sni                    = "true"
      ssl_certificate_name           = var.webapp_cert_name
    }

    request_routing_rule {
      name                       = "${lower(var.application_acronym)}webapp${lower(local.environment_type)}-routing-rule"
      rule_type                  = "Basic"
      http_listener_name         = "webapp-https-listener"
      backend_address_pool_name  = "webapp-backendpool"
      backend_http_settings_name = "${lower(var.application_acronym)}webapp${lower(local.environment_type)}-https-settings"
    }

  probe {
      #host                       = var.webapp_cert_name
      name                       = "${lower(var.application_acronym)}webapp${lower(local.environment_type)}-probe"
      protocol                   = "Https"
      path                       = "/"
      pick_host_name_from_backend_http_settings= "true"
      interval                   = "30"
      timeout                    = "30"
      unhealthy_threshold        = "3"
      match {
        status_code = [
        "200-399"]
      }
    }

  ssl_certificate {
    name     = var.webapp_cert_name
    data     = filebase64("${var.webapp_cert_name}.pfx")
    password = ""
    #key_vault_secret_id = data.azurerm_key_vault_secret.ssl_certificate.id
  }

 ##############FunctionApp

  backend_address_pool {
      name         = "funcapp-backendpool"
      fqdns        = [
                      "fun-use-impact-${var.environment_acronym}.azurewebsites.net"
                    ]
  }

  backend_http_settings {
      name                  = "${lower(var.application_acronym)}funcapp${lower(local.environment_type)}-https-settings"
      cookie_based_affinity = "Enabled"
      affinity_cookie_name = "ApplicationGatewayAffinity"
      port                  = 443
      protocol              = "Https"
      request_timeout       = 30
      host_name             = "fun-use-impact-${var.environment_acronym}.azurewebsites.net"
      #pick_host_name_from_backend_address = "true"
      probe_name            = "${lower(var.application_acronym)}funcapp${lower(local.environment_type)}-probe"

    }

    http_listener {
      name                           = "funcapp-https-listener"
      host_name                      = var.api_pfx_cert_name
      frontend_ip_configuration_name = local.frontend_ip_configuration_name
      frontend_port_name             = local.frontend_port_name
      protocol                       = "Https"
      require_sni                    = "true"
      ssl_certificate_name           = var.api_pfx_cert_name
    }

    request_routing_rule {
      name                       = "${lower(var.application_acronym)}funcapp${lower(local.environment_type)}-routing-rule"
      rule_type                  = "Basic"
      http_listener_name         = "funcapp-https-listener"
      backend_address_pool_name  = "funcapp-backendpool"
      backend_http_settings_name = "${lower(var.application_acronym)}funcapp${lower(local.environment_type)}-https-settings"
    }

  probe {
      host                       = "fun-use-impact-${var.environment_acronym}.azurewebsites.net"
      name                       = "${lower(var.application_acronym)}funcapp${lower(local.environment_type)}-probe"
      protocol                   = "Https"
      path                       = "/"
      interval                   = "30"
      timeout                    = "30"
      unhealthy_threshold        = "3"
      match {
        status_code = [
        "200-399"]
      }
    }

  ssl_certificate {
    name     = var.api_pfx_cert_name
    data     = filebase64("${var.api_pfx_cert_name}.pfx")
    password = ""
    #key_vault_secret_id = data.azurerm_key_vault_secret.ssl_certificate.id
  }
}
