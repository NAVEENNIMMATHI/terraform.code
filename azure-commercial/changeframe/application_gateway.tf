locals {
  frontend_port_name                     = "${var.application_acronym}frontendport"
  frontend_ip_configuration_name         = "${var.application_acronym}frontendip"
  application_backend_address_pool_name  = "${var.application_acronym}backendpool"
  application_gateway_cert_name          = "${var.application_acronym}_frontend_digicert_pfx"
  google_cert_name                       = "${var.application_acronym}_google_digicert_pfx"
  backend_app_gateway_cert_name          = "${var.application_acronym}_backend_authentication_ase_cer"
}

resource "azurerm_application_gateway" "application_gateway_2" {
  name                = "agw-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}${var.suffix}"
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location
  ssl_policy {
    policy_type          = "Custom"
    min_protocol_version = "TLSv1_2"
    cipher_suites = ["TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384", "TLS_RSA_WITH_AES_256_GCM_SHA384", "TLS_RSA_WITH_AES_128_GCM_SHA256", "TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384", "TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256"]
  }
  depends_on = [azurerm_app_service.appservice_test,azurerm_app_service.appservice_final]

#Common Configuration Start
  sku {
    name     = var.application_gateway_sku_name
    tier     = var.application_gateway_sku_tier
    capacity = var.application_gateway_sku_capacity
  }

  waf_configuration {
    enabled          = "true"
    firewall_mode    = "Detection"
    rule_set_type    = "OWASP"
    rule_set_version = "3.0"
    max_request_body_size_kb = "128"
    file_upload_limit_mb = "100"
    
  

    disabled_rule_group {
        rule_group_name = "REQUEST-911-METHOD-ENFORCEMENT"
        

    }
    disabled_rule_group {
        rule_group_name = "General"
        
    }
    disabled_rule_group {
        rule_group_name = "REQUEST-913-SCANNER-DETECTION"
        
    }
    disabled_rule_group {
        rule_group_name = "REQUEST-920-PROTOCOL-ENFORCEMENT" 
              
    }
    disabled_rule_group {
        rule_group_name = "REQUEST-921-PROTOCOL-ATTACK"
             
    }
    disabled_rule_group {
        rule_group_name = "REQUEST-943-APPLICATION-ATTACK-SESSION-FIXATION" 
              
    }
    disabled_rule_group {
        rule_group_name = "REQUEST-933-APPLICATION-ATTACK-PHP" 
              
    }
    disabled_rule_group {
        rule_group_name = "REQUEST-932-APPLICATION-ATTACK-RCE" 
              
    }
    disabled_rule_group {
        rule_group_name = "REQUEST-931-APPLICATION-ATTACK-RFI"
              
    }
    disabled_rule_group {
        rule_group_name = "REQUEST-930-APPLICATION-ATTACK-LFI"
             
    }
    disabled_rule_group {
        rule_group_name = "REQUEST-941-APPLICATION-ATTACK-XSS"
        rules = [
          941100,
          941150,
          941160,
          941320,
          941330,
          941340,
          941310, 
          941350
          ]
             
    }
    disabled_rule_group {
        rule_group_name = "REQUEST-942-APPLICATION-ATTACK-SQLI"
        rules = [
          942100,
          942130,
          942140,
          942160,
          942170,
          942180,
          942190,
          942200,
          942210,
          942220,
          942230,
          942240,
          942250,
          942251,
          942260,
          942270,
          942280,
          942290,
          942300,
          942310,
          942320,
          942330,
          942340,
          942350,
          942360,
          942370,
          942410,
          942420,
          942421,
          942430,
          942431,
          942432,
          942440,
          942450,
          942460,
          942390
        ]             
    }
    
  }

  backend_address_pool {
    name = local.application_backend_address_pool_name
    ip_addresses = [var.ase_internal_ip]
  }

  gateway_ip_configuration {
    name      = "applicationGatewayIpConfig"
    subnet_id = var.environment_acronym == "pd" ?  data.terraform_remote_state.shared.outputs.app_gatewaysubnet_id_cfr : data.terraform_remote_state.shared.outputs.app_gatewaysubnet_id
   
  }

  frontend_port {
    name = local.frontend_port_name
    port = 443
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = module.gateway_2_public_ip.public_ip_id
  }
  #Common Configuration End

#----------------------------------------------------------------------------------------------------------------#
dynamic "backend_http_settings" {
  for_each = var.app_gateway_backend_info == null ? [] : list(var.app_gateway_backend_info)
  content {
    name                  = "${var.app_service_name_test}-https-settings"
    cookie_based_affinity = "Enabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 30
    probe_name            = "${var.app_service_name_test}-probe"

    authentication_certificate {
      name = local.backend_app_gateway_cert_name
    }
  }  
}

dynamic "http_listener" {
  for_each = var.app_gateway_backend_info == null ? [] : list(var.app_gateway_backend_info)
  content {
    name                           = "${var.app_service_name_test}-https-listener"
    host_name                      = "${var.app_service_name_test}.kpmgcloudops.com"
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
    name                       = "${var.app_service_name_test}-routing-rule"
    rule_type                  = "Basic"
    http_listener_name         = "${var.app_service_name_test}-https-listener"
    backend_address_pool_name  = local.application_backend_address_pool_name
    backend_http_settings_name = "${var.app_service_name_test}-https-settings"
  }
}

dynamic "probe" {
  for_each = var.app_gateway_backend_info == null ? [] : list(var.app_gateway_backend_info)
    content {
    name                = "${var.app_service_name_test}-probe"
    host                = "${var.app_service_name_test}.kpmgcloudops.com"
    protocol            = "Https"
    path                = "/"
    interval            = "30"
    timeout             = "30"
    unhealthy_threshold = "3"

    match {
      status_code = ["200-401"]
    }
  }
}

  #Google----------------------------------------------------------------------------------------------------------------#
backend_http_settings {
    name                  = "${var.app_service_name_google}-https-settings"
    cookie_based_affinity = "Enabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 30
    probe_name            = "${var.app_service_name_google}-probe"

    authentication_certificate {
      name = local.backend_app_gateway_cert_name
    }
  }  

http_listener {
    name                           = "${var.app_service_name_google}-https-listener"
    host_name                      = "${var.app_service_name_google}.kpmgcloudops.com"
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = local.google_cert_name
  }

request_routing_rule {
    name                                 = "${var.app_service_name_google}-routing-rule"
    rule_type                            = "Basic"
    http_listener_name                   = "${var.app_service_name_google}-https-listener"
    redirect_configuration_name          = "googleauth"
    
  }

redirect_configuration {
    name                                      = "googleauth"
    target_url                                = "https://${var.app_service_name_final}.kpmgcloudops.com/auth/signin/GoogleInternal"
    include_path                              = true
    include_query_string                      = true
    redirect_type                             = "Permanent"
  }
  
  probe {
    name                = "${var.app_service_name_google}-probe"
    host                = "${var.app_service_name_final}.kpmgcloudops.com"
    protocol            = "Https"
    path                = "/"
    interval            = "30"
    timeout             = "30"
    unhealthy_threshold = "3"

    match {
      status_code = ["200-401"]
    }
  }

  #----------------------------------------------------------------------------------------------------------------#
  #----------------------------------------------------------------------------------------------------------------#
backend_http_settings {
    name                  = "${var.app_service_name_final}-https-settings"
    cookie_based_affinity = "Enabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 30
    probe_name            = "${var.app_service_name_final}-probe"

    authentication_certificate {
      name = local.backend_app_gateway_cert_name
    }
  }  

  http_listener {
    name                           = "${var.app_service_name_final}-https-listener"
    host_name                      = "${var.app_service_name_final}.kpmgcloudops.com"
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = local.application_gateway_cert_name
  }

  request_routing_rule {
    name                       = "${var.app_service_name_final}-routing-rule"
    rule_type                  = "Basic"
    http_listener_name         = "${var.app_service_name_final}-https-listener"
    backend_address_pool_name  = local.application_backend_address_pool_name
    backend_http_settings_name = "${var.app_service_name_final}-https-settings"
  }

  probe {
    name                = "${var.app_service_name_final}-probe"
    host                = "${var.app_service_name_final}.kpmgcloudops.com"
    protocol            = "Https"
    path                = "/"
    interval            = "30"
    timeout             = "30"
    unhealthy_threshold = "3"

    match {
      status_code = ["200-401"]
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

  ssl_certificate {
    name     = local.google_cert_name
    data     = filebase64("${var.google_pfx_cert_name}.pfx")
    password = ""
    #key_vault_secret_id = data.azurerm_key_vault_secret.ssl_certificate.id
  }

  tags = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "waf_logs" {
  name               = "app_gateway_waf_logs"
  target_resource_id = azurerm_application_gateway.application_gateway_2.id
  storage_account_id = module.storage_account.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.app_gateway_logs.id

  log {
    category = "ApplicationGatewayFirewallLog"
    enabled  = true

    retention_policy {
      enabled = true
      days = 30
    }
  }
  log {
    category = "ApplicationGatewayAccessLog"
    enabled  = true

    retention_policy {
      enabled = true
      days = 30
    }
  }
  log {
    category = "ApplicationGatewayPerformanceLog"
    enabled  = true

    retention_policy {
      enabled = true
      days = 30
    }
  }

  metric {
          category = "AllMetrics"
          enabled  = false

          retention_policy {
              days    = 0
             enabled = false
            }
        }

}
