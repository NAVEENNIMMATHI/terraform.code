locals {
  frontend_port_name                     = "appGatewayFrontendIP"
  frontend_ip_configuration_name         = "appGatewayFrontendIP"
  app_backend_address_pool_name          = "appGatewayBackendPool"
  app_http_setting_name                  = "appGatewayBackendHttpsSettings"
  app_listener_name                      = "appGatewayHttpsListener"
  app_request_routing_rule_name          = "ruleHttpToHttps"
  app_probe_name                         = "appgtwy-healthprobe-https"
  app_probe_host_name                    = "${var.application_acronym}.kpmgcloudops.com"
  app_listener_host_name                 = "${var.application_acronym}.kpmgcloudops.com"
  app_gateway_name                       = var.environment == "production" ? "CO-P-EASTUS-TAB-APPGW" : "apg-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
}

resource "azurerm_application_gateway" "application_gateway" {
  name                                    = local.app_gateway_name
  resource_group_name                     = module.applicationrg.resource_group_name
  location                                = module.applicationrg.resource_group_location

  sku {
    name                                  = var.appgateway_sku
    tier                                  = "WAF_v2"
    capacity                              = "0"
  }

  zones                                   = ["1", "2"]

  autoscale_configuration {
    max_capacity                          = 3
    min_capacity                          = 2
  }

  request_routing_rule {
    name                                  = "rule1"
    rule_type                             = "Basic"
    http_listener_name                    = "appGatewayHttpsListener"
    backend_address_pool_name             = "appGatewayBackendPool"
    backend_http_settings_name            = "appGatewayBackendHttpSettings"
  }

  frontend_port {
    name                                  = "appGatewayFrontendPort"
    port                                  = 80
  }

  frontend_port {
    name                                  = "HTTPS"
    port                                  = 443
  }

  frontend_ip_configuration {
    name                                  = "appGatewayFrontendIP"
    public_ip_address_id                  = azurerm_public_ip.gatewayip.id
  }

  http_listener {
    name                                  = "appGatewayHttpListener"
    host_name                             = ""
    frontend_ip_configuration_name        = "appGatewayFrontendIP"
    frontend_port_name                    = "appGatewayFrontendPort"
    protocol                              = "Http"
    require_sni                           = "false"
  }

  http_listener {
    name                                  = "appGatewayHttpsListener"
    host_name                             = ""
    frontend_ip_configuration_name        = local.frontend_ip_configuration_name
    frontend_port_name                    = "HTTPS"
    protocol                              = "Https"
    require_sni                           = "false"
    ssl_certificate_name                  = var.environment == "production" ? "spitableaucert" : "dasaviz_kpmgcloudops_com"
  }

  gateway_ip_configuration {
    name                                  = "appGatewayIpConfig"
    subnet_id                             = module.tabappgw_subnet.subnet_id
  }

  backend_address_pool {
    name                                  = local.app_backend_address_pool_name
  }

  backend_http_settings {    
    name                                  = "appGatewayBackendHttpSettings"
    affinity_cookie_name                  = "ApplicationGatewayAffinity"
    cookie_based_affinity                 = "Disabled"
    port                                  = 80
    protocol                              = "Http"
    request_timeout                       = 30
    probe_name                            = ""
  }

  rewrite_rule_set {
    name                                  = "rewriteRuleSet1"
    rewrite_rule {
      name                                = "rewriteRule1"
      rule_sequence                       = 100
      response_header_configuration {
        header_name                       = "X-FRAME-OPTIONS"
        header_value                      = "SAMEORIGIN"
        }
    }
  }

  ssl_certificate {
    name                                  = var.environment == "production" ? "spitableaucert" : "dasaviz_kpmgcloudops_com"
    data                                  = filebase64("dasaviz.kpmgcloudops.com.pfx")
    password                              = var.AppGatewaycertpassword
  }

  ssl_policy {
    cipher_suites                         = ["TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA",
                                            "TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384",
                                            "TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384",
                                            "TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA",
                                            "TLS_RSA_WITH_AES_256_GCM_SHA384",
                                            "TLS_RSA_WITH_AES_256_CBC_SHA256",
                                            "TLS_RSA_WITH_AES_256_CBC_SHA",]
    disabled_protocols                    = []
    min_protocol_version                  = "TLSv1_2"
    policy_type                           = "Custom"
  }

  waf_configuration {
    enabled                               = true 
    file_upload_limit_mb                  = 100 
    firewall_mode                         = "Detection" 
    max_request_body_size_kb              = 128 
    request_body_check                    = true 
    rule_set_type                         = "OWASP" 
    rule_set_version                      = "3.0" 

    disabled_rule_group {
      rule_group_name                     = "REQUEST-942-APPLICATION-ATTACK-SQLI" 
        rules                             = [
                                             942180,
                                             942330,
                                             942340,
                                             942260,
                                             942310,
                                             942370,
                                             942420,
                                             942421,
                                             942430,
                                             942431,
                                             942432,
                                             942440,
                                             ] 
                        }
    disabled_rule_group {
      rule_group_name                     = "REQUEST-920-PROTOCOL-ENFORCEMENT" 
        rules                             = [
                                             920300,
                                             920320,
                                             920350,
                                             920420,
                                             920340,
                                             920280,
                                            ] 
                        }

            exclusion {
            match_variable              = "RequestCookieNames" 
                selector                = "workgroup_session_id" 
                selector_match_operator = "Contains" 
            }
            exclusion {
                match_variable          = "RequestHeaderNames" 
                selector                = "REQUEST_HEADERS" 
                selector_match_operator = "Contains" 
            }
            exclusion {
                match_variable          = "RequestArgNames" 
                selector                = "code" 
                selector_match_operator = "Contains" 
            }
            exclusion {
                match_variable          = "RequestArgNames" 
                selector                = "TX" 
                selector_match_operator = "Contains" 
            }
            exclusion {
                match_variable          = "RequestHeaderNames" 
                selector                = "User-Agent" 
                selector_match_operator = "Contains" 
            }
            exclusion {
                match_variable          = "RequestArgNames" 
                selector                = "state" 
                selector_match_operator = "Contains" 
            }
            exclusion {
                match_variable          = "RequestArgNames" 
                selector                = "ARGS" 
                selector_match_operator = "Contains" 
            }
            exclusion {
                match_variable          = "RequestArgNames" 
                selector                = "ARGS_NAMES" 
                selector_match_operator = "Contains" 
            }
        }
  tags                                  = var.tags
}