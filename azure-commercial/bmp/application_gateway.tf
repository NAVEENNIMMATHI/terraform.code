locals {
  frontend_port_name             = "appGatewayFrontendPort"
  frontend_ip_configuration_name = "appGatewayFrontendIP"

  apphostname                   = "bmp${var.app_gateway_environment_acronym}.kpmgcloudops.com"
  appcertname                   = "bmp${var.app_gateway_environment_acronym}_kpmgcloudops_com"
  appauthcertcer                = "bmp${var.app_gateway_environment_acronym}.kpmgcloudops.com.cer"
  appsslcertpfx                 = "bmp${var.app_gateway_environment_acronym}.kpmgcloudops.com.pfx"
  app_backend_address_pool_name = "appGatewayBackendPool"
  app_http_setting_name         = "appGatewayBackendHttpsSettings"
  app_listener_name             = "appGatewayHttpsListener"
  app_request_routing_rule_name = "appRule"
  app_probe_name                = "appGatewayProbe"
  app_probe_host_name           = "bmp${var.app_gateway_environment_acronym}.kpmgcloudops.com"
  app_listener_host_name        = "bmp${var.app_gateway_environment_acronym}.kpmgcloudops.com"

  kpimhostname                   = "bmpkpim${var.app_gateway_environment_acronym}.kpmgcloudops.com"
  kpimcertname                   = "bmpkpim${var.app_gateway_environment_acronym}_kpmgcloudops_com"
  kpimauthcertcer                = "bmpkpim${var.app_gateway_environment_acronym}.kpmgcloudops.com.cer"
  kpimsslcertpfx                 = "bmpkpim${var.app_gateway_environment_acronym}.kpmgcloudops.com.pfx"
  kpim_backend_address_pool_name = "kpimGatewayBackendPool"
  kpim_http_setting_name         = "kpimGatewayBackendHttpsSettings"
  kpim_listener_name             = "kpimGatewayHttpsListener"
  kpim_request_routing_rule_name = "kpimRule"
  kpim_probe_name                = "kpimGatewayProbe"
  kpim_probe_host_name           = "bmpkpim${var.app_gateway_environment_acronym}.kpmgcloudops.com"
  kpim_listener_host_name        = "bmpkpim${var.app_gateway_environment_acronym}.kpmgcloudops.com"

  resthostname                   = "bmprest${var.app_gateway_environment_acronym}.kpmgcloudops.com"
  restcertname                   = "bmprest${var.app_gateway_environment_acronym}_kpmgcloudops_com"
  restauthcertcer                = "bmprest${var.app_gateway_environment_acronym}.kpmgcloudops.com.cer"
  restsslcertpfx                 = "bmprest${var.app_gateway_environment_acronym}.kpmgcloudops.com.pfx"
  rest_backend_address_pool_name = "restGatewayBackendPool"
  rest_http_setting_name         = "restGatewayBackendHttpsSettings"
  rest_listener_name             = "restGatewayHttpsListener"
  rest_request_routing_rule_name = "restRule"
  rest_probe_name                = "restGatewayProbe"
  rest_probe_host_name           = "bmprest${var.app_gateway_environment_acronym}.kpmgcloudops.com"
  rest_listener_host_name        = "bmprest${var.app_gateway_environment_acronym}.kpmgcloudops.com"

  mepresthostname                   = "meprest${var.app_gateway_environment_acronym}.kpmgcloudops.com"
  meprestcertname                   = "meprest${var.app_gateway_environment_acronym}_kpmgcloudops_com"
  meprestauthcertcer                = "meprest${var.app_gateway_environment_acronym}.kpmgcloudops.com.cer"
  meprestsslcertpfx                 = "meprest${var.app_gateway_environment_acronym}.kpmgcloudops.com.pfx"
  meprest_backend_address_pool_name = "meprestGatewayBackendPool"
  meprest_http_setting_name         = "meprestGatewayBackendHttpsSettings"
  meprest_listener_name             = "meprestGatewayHttpsListener"
  meprest_request_routing_rule_name = "meprestRule"
  meprest_probe_name                = "meprestGatewayProbe"
  meprest_probe_host_name           = "meprest${var.app_gateway_environment_acronym}.kpmgcloudops.com"
  meprest_listener_host_name        = "meprest${var.app_gateway_environment_acronym}.kpmgcloudops.com"

  mephostname                   = "mep${var.app_gateway_environment_acronym}.kpmgcloudops.com"
  mepcertname                   = "mep${var.app_gateway_environment_acronym}_kpmgcloudops_com"
  mepauthcertcer                = "mep${var.app_gateway_environment_acronym}.kpmgcloudops.com.cer"
  mepsslcertpfx                 = "mep${var.app_gateway_environment_acronym}.kpmgcloudops.com.pfx"
  mep_backend_address_pool_name = "mepGatewayBackendPool"
  mep_http_setting_name         = "mepGatewayBackendHttpsSettings"
  mep_listener_name             = "mepGatewayHttpsListener"
  mep_request_routing_rule_name = "mepRule"
  mep_probe_name                = "mepGatewayProbe"
  mep_probe_host_name           = "mep${var.app_gateway_environment_acronym}.kpmgcloudops.com"
  mep_listener_host_name        = "mep${var.app_gateway_environment_acronym}.kpmgcloudops.com"

  dashostname                   = "das${var.app_gateway_environment_acronym}.kpmgcloudops.com"
  dascertname                   = "das${var.app_gateway_environment_acronym}_kpmgcloudops_com"
  dasauthcertcer                = "das${var.app_gateway_environment_acronym}.kpmgcloudops.com.cer"
  dassslcertpfx                 = "das${var.app_gateway_environment_acronym}.kpmgcloudops.com.pfx"
  das_backend_address_pool_name = "dasGatewayBackendPool"
  das_http_setting_name         = "dasGatewayBackendHttpsSettings"
  das_listener_name             = "dasGatewayHttpsListener"
  das_request_routing_rule_name = "dasRule"
  das_probe_name                = "dasGatewayProbe"
  das_probe_host_name           = "das${var.app_gateway_environment_acronym}.kpmgcloudops.com"
  das_listener_host_name        = "das${var.app_gateway_environment_acronym}.kpmgcloudops.com"

  dasresthostname                   = "dasrest${var.app_gateway_environment_acronym}.kpmgcloudops.com"
  dasrestcertname                   = "dasrest${var.app_gateway_environment_acronym}_kpmgcloudops_com"
  dasrestauthcertcer                = "dasrest${var.app_gateway_environment_acronym}.kpmgcloudops.com.cer"
  dasrestsslcertpfx                 = "dasrest${var.app_gateway_environment_acronym}.kpmgcloudops.com.pfx"
  dasrest_backend_address_pool_name = "dasrestGatewayBackendPool"
  dasrest_http_setting_name         = "dasrestGatewayBackendHttpsSettings"
  dasrest_listener_name             = "dasrestGatewayHttpsListener"
  dasrest_request_routing_rule_name = "dasrestRule"
  dasrest_probe_name                = "dasrestGatewayProbe"
  dasrest_probe_host_name           = "dasrest${var.app_gateway_environment_acronym}.kpmgcloudops.com"
  dasrest_listener_host_name        = "dasrest${var.app_gateway_environment_acronym}.kpmgcloudops.com"

  dashhostname                   = "dash${var.app_gateway_environment_acronym}.kpmgcloudops.com"
  dashcertname                   = "dash${var.app_gateway_environment_acronym}_kpmgcloudops_com"
  dashauthcertcer                = "dash${var.app_gateway_environment_acronym}.kpmgcloudops.com.cer"
  dashsslcertpfx                 = "dash${var.app_gateway_environment_acronym}.kpmgcloudops.com.pfx"
  dash_backend_address_pool_name = "dashGatewayBackendPool"
  dash_http_setting_name         = "dashGatewayBackendHttpsSettings"
  dash_listener_name             = "dashGatewayHttpsListener"
  dash_request_routing_rule_name = "dashRule"
  dash_probe_name                = "dashGatewayProbe"
  dash_probe_host_name           = "dash${var.app_gateway_environment_acronym}.kpmgcloudops.com"
  dash_listener_host_name        = "dash${var.app_gateway_environment_acronym}.kpmgcloudops.com"

  acthostname                   = "act${var.app_gateway_environment_acronym}.kpmgcloudops.com"
  actcertname                   = "act${var.app_gateway_environment_acronym}_kpmgcloudops_com"
  actauthcertcer                = "act${var.app_gateway_environment_acronym}.kpmgcloudops.com.cer"
  actsslcertpfx                 = "act${var.app_gateway_environment_acronym}.kpmgcloudops.com.pfx"
  act_backend_address_pool_name = "actGatewayBackendPool"
  act_http_setting_name         = "actGatewayBackendHttpsSettings"
  act_listener_name             = "actGatewayHttpsListener"
  act_request_routing_rule_name = "actRule"
  act_probe_name                = "actGatewayProbe"
  act_probe_host_name           = "act${var.app_gateway_environment_acronym}.kpmgcloudops.com"
  act_listener_host_name        = "act${var.app_gateway_environment_acronym}.kpmgcloudops.com"

  bmpfahostname                   = "bmpfa${var.app_gateway_environment_acronym2}.kpmgcloudops.com"
  bmpfacertname                   = "bmpfa${var.app_gateway_environment_acronym2}_kpmgcloudops_com"
  bmpfaauthcertcer                = "bmpfa${var.app_gateway_environment_acronym2}.kpmgcloudops.com.cer"
  bmpfasslcertpfx                 = "bmpfa${var.app_gateway_environment_acronym2}.kpmgcloudops.com.pfx"
  bmpfa_backend_address_pool_name = "bmpfaGatewayBackendPool"
  bmpfa_http_setting_name         = "bmpfaGatewayBackendHttpsSettings"
  bmpfa_listener_name             = "bmpfaGatewayHttpsListener"
  bmpfa_request_routing_rule_name = "bmpfaRule"
  bmpfa_probe_name                = "bmpfaGatewayProbe"
  bmpfa_probe_host_name           = "bmpfa${var.app_gateway_environment_acronym2}.kpmgcloudops.com"
  bmpfa_listener_host_name        = "bmpfa${var.app_gateway_environment_acronym2}.kpmgcloudops.com"
}

resource "azurerm_public_ip" "bmpappagwpip" {
  name                = var.environment == "production" ? "co-p-eastus-bmpapp1-agw-ip" : "pip-agw-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location
  allocation_method   = "Dynamic"

  tags = var.tags
}

resource "azurerm_application_gateway" "bmpappgw" {
  name                = var.environment == "production" ? "co-p-eastus-bmpapp1-agw" : "agw-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location

  ssl_policy {
    policy_type          = "Custom"
    min_protocol_version = "TLSv1_2"

    cipher_suites = [
      "TLS_RSA_WITH_AES_256_CBC_SHA256",
      "TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384",
      "TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384",
      "TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA",
      "TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384",
      "TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384",
      "TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA",
      "TLS_RSA_WITH_AES_256_GCM_SHA384",
      "TLS_RSA_WITH_AES_256_CBC_SHA",
      "TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256"
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

  backend_address_pool {
    name = local.app_backend_address_pool_name
  }

  backend_address_pool {
    name = local.kpim_backend_address_pool_name
  }

  backend_address_pool {
    name = local.rest_backend_address_pool_name
  }

  backend_address_pool {
    name = local.meprest_backend_address_pool_name
  }

  backend_address_pool {
    name = local.mep_backend_address_pool_name
  }

  backend_address_pool {
    name = local.das_backend_address_pool_name
  }

  backend_address_pool {
    name = local.dasrest_backend_address_pool_name
  }

  backend_address_pool {
    name = local.dash_backend_address_pool_name
  }

  backend_address_pool {
    name = local.act_backend_address_pool_name
  }

  backend_address_pool {
    name = local.bmpfa_backend_address_pool_name
    ip_addresses = [var.ase_internal_ip]
  }

  backend_http_settings {
    name                  = local.app_http_setting_name
    cookie_based_affinity = "Enabled"
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 30

    authentication_certificate {
      name = local.appcertname
    }
  }

  backend_http_settings {
    name                  = local.kpim_http_setting_name
    cookie_based_affinity = "Enabled"
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 30

    authentication_certificate {
      name = var.environment == "production" ? local.kpimcertname : local.appcertname
    }
  }

  backend_http_settings {
    name                  = local.rest_http_setting_name
    cookie_based_affinity = "Enabled"
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 30

    authentication_certificate {
      name = var.environment == "production" ? local.restcertname : local.appcertname
    }
  }

  backend_http_settings {
    name                  = local.meprest_http_setting_name
    cookie_based_affinity = "Enabled"
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    port                  = 8080
    protocol              = "Https"
    request_timeout       = 30

    authentication_certificate {
      name = var.environment == "production" ? local.meprestcertname : local.appcertname
    }
  }

  backend_http_settings {
    name                  = local.mep_http_setting_name
    cookie_based_affinity = "Enabled"
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    port                  = 8070
    protocol              = "Https"
    request_timeout       = 30

    authentication_certificate {
      name = var.environment == "production" ? local.mepcertname : local.appcertname
    }
  }

  backend_http_settings {
    name                  = local.das_http_setting_name
    cookie_based_affinity = "Enabled"
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    port                  = 7070
    protocol              = "Https"
    request_timeout       = 30

    authentication_certificate {
      name = var.environment == "production" ? local.dascertname : local.appcertname
    }
  }

  backend_http_settings {
    name                  = local.dasrest_http_setting_name
    cookie_based_affinity = "Enabled"
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    port                  = 7080
    protocol              = "Https"
    request_timeout       = 30

    authentication_certificate {
      name = var.environment == "production" ? local.dasrestcertname : local.appcertname
    }
  }

  backend_http_settings {
    name                  = local.dash_http_setting_name
    cookie_based_affinity = "Enabled"
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    port                  = 6070
    protocol              = "Https"
    request_timeout       = 30

    authentication_certificate {
      name = var.environment == "production" ? local.dashcertname : local.appcertname
    }
  }

  backend_http_settings {
    name                  = local.act_http_setting_name
    cookie_based_affinity = "Enabled"
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    port                  = 5080
    protocol              = "Https"
    request_timeout       = 30

    authentication_certificate {
      name = var.environment == "production" ? local.actcertname : local.appcertname
    }
  }

  backend_http_settings {
    name                  = local.bmpfa_http_setting_name
    cookie_based_affinity = "Enabled"
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 30

    authentication_certificate {
      name = "star_kpmgcloudops_com"
    }
  }

  gateway_ip_configuration {
    name      = "appGatewayIpConfig"
    subnet_id = azurerm_subnet.bmpagw1subnet.id
  }

  frontend_port {
    name = local.frontend_port_name
    port = 443
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.bmpappagwpip.id
  }

  http_listener {
    name                           = local.app_listener_name
    host_name                      = local.app_listener_host_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = local.appcertname
  }

  http_listener {
    name                           = local.kpim_listener_name
    host_name                      = local.kpim_listener_host_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = var.environment == "production" ? local.kpimcertname : local.appcertname
  }

  http_listener {
    name                           = local.rest_listener_name
    host_name                      = local.rest_listener_host_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = var.environment == "production" ? local.restcertname : local.appcertname
  }

  http_listener {
    name                           = local.meprest_listener_name
    host_name                      = local.meprest_listener_host_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = var.environment == "production" ? local.meprestcertname : local.appcertname
  }

  http_listener {
    name                           = local.mep_listener_name
    host_name                      = local.mep_listener_host_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = var.environment == "production" ? local.mepcertname : local.appcertname
  }

  http_listener {
    name                           = local.das_listener_name
    host_name                      = local.das_listener_host_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = var.environment == "production" ? local.dascertname : local.appcertname
  }

  http_listener {
    name                           = local.dasrest_listener_name
    host_name                      = local.dasrest_listener_host_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = var.environment == "production" ? local.dasrestcertname : local.appcertname
  }

  http_listener {
    name                           = local.dash_listener_name
    host_name                      = local.dash_listener_host_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = var.environment == "production" ? local.dashcertname : local.appcertname
  }

  http_listener {
    name                           = local.act_listener_name
    host_name                      = local.act_listener_host_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = var.environment == "production" ? local.actcertname : local.appcertname
  }

  http_listener {
    name                           = local.bmpfa_listener_name
    host_name                      = local.bmpfa_listener_host_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = local.bmpfacertname
  }

  request_routing_rule {
    name                       = local.app_request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.app_listener_name
    backend_address_pool_name  = local.app_backend_address_pool_name
    backend_http_settings_name = local.app_http_setting_name
  }

  request_routing_rule {
    name                       = local.kpim_request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.kpim_listener_name
    backend_address_pool_name  = local.kpim_backend_address_pool_name
    backend_http_settings_name = local.kpim_http_setting_name
  }

  request_routing_rule {
    name                       = local.rest_request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.rest_listener_name
    backend_address_pool_name  = local.rest_backend_address_pool_name
    backend_http_settings_name = local.rest_http_setting_name
  }

  request_routing_rule {
    name                       = local.meprest_request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.meprest_listener_name
    backend_address_pool_name  = local.meprest_backend_address_pool_name
    backend_http_settings_name = local.meprest_http_setting_name
  }

  request_routing_rule {
    name                       = local.mep_request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.mep_listener_name
    backend_address_pool_name  = local.mep_backend_address_pool_name
    backend_http_settings_name = local.mep_http_setting_name
  }

  request_routing_rule {
    name                       = local.das_request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.das_listener_name
    backend_address_pool_name  = local.das_backend_address_pool_name
    backend_http_settings_name = local.das_http_setting_name
  }

  request_routing_rule {
    name                       = local.dasrest_request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.dasrest_listener_name
    backend_address_pool_name  = local.dasrest_backend_address_pool_name
    backend_http_settings_name = local.dasrest_http_setting_name
  }

  request_routing_rule {
    name                       = local.dash_request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.dash_listener_name
    backend_address_pool_name  = local.dash_backend_address_pool_name
    backend_http_settings_name = local.dash_http_setting_name
  }

  request_routing_rule {
    name                       = local.act_request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.act_listener_name
    backend_address_pool_name  = local.act_backend_address_pool_name
    backend_http_settings_name = local.act_http_setting_name
  }

  request_routing_rule {
    name                       = local.bmpfa_request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.bmpfa_listener_name
    backend_address_pool_name  = local.bmpfa_backend_address_pool_name
    backend_http_settings_name = local.bmpfa_http_setting_name
  }

  probe {
    name                = local.app_probe_name
    host                = local.app_probe_host_name
    protocol            = "Https"
    path                = "/"
    interval            = "30"
    timeout             = "30"
    unhealthy_threshold = "3"
  }

  probe {
    name                = local.kpim_probe_name
    host                = local.kpim_probe_host_name
    protocol            = "Https"
    path                = "/"
    interval            = "30"
    timeout             = "30"
    unhealthy_threshold = "3"
  }

  probe {
    name                = local.rest_probe_name
    host                = local.rest_probe_host_name
    protocol            = "Https"
    path                = "/"
    interval            = "30"
    timeout             = "30"
    unhealthy_threshold = "3"
  }

  probe {
    name                = local.meprest_probe_name
    host                = local.meprest_probe_host_name
    protocol            = "Https"
    path                = "/"
    interval            = "30"
    timeout             = "30"
    unhealthy_threshold = "3"
  }

  probe {
    name                = local.mep_probe_name
    host                = local.mep_probe_host_name
    protocol            = "Https"
    path                = "/"
    interval            = "30"
    timeout             = "30"
    unhealthy_threshold = "3"
  }

  probe {
    name                = local.das_probe_name
    host                = local.das_probe_host_name
    protocol            = "Https"
    path                = "/"
    interval            = "30"
    timeout             = "30"
    unhealthy_threshold = "3"
  }

  probe {
    name                = local.dasrest_probe_name
    host                = local.dasrest_probe_host_name
    protocol            = "Https"
    path                = "/"
    interval            = "30"
    timeout             = "30"
    unhealthy_threshold = "3"
  }

  probe {
    name                = local.dash_probe_name
    host                = local.dash_probe_host_name
    protocol            = "Https"
    path                = "/"
    interval            = "30"
    timeout             = "30"
    unhealthy_threshold = "3"
  }

  probe {
    name                = local.act_probe_name
    host                = local.act_probe_host_name
    protocol            = "Https"
    path                = "/"
    interval            = "30"
    timeout             = "30"
    unhealthy_threshold = "3"
  }

  probe {
    name                = local.bmpfa_probe_name
    host                = local.bmpfa_probe_host_name
    protocol            = "Https"
    path                = "/"
    interval            = "30"
    timeout             = "30"
    unhealthy_threshold = "3"
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

  tags = var.tags
}