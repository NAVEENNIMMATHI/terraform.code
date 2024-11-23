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
  location                = module.mdp_rg_main.resource_group_location
  resource_group_name     = module.mdp_rg_main.resource_group_name
  domain_name_label       = "agw-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  sku                     = "Standard"
  allocation_method       = "Static"
  tags                    = var.tags
}

resource "azurerm_application_gateway" "this" {
  name                = lower("agw-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}")
  resource_group_name = module.mdp_rg_main.resource_group_name
  location            = module.mdp_rg_main.resource_group_location
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
  waf_configuration {
    enabled          = "true"
    firewall_mode    = "Detection"
    rule_set_version = "3.0"
  }

  autoscale_configuration {
    min_capacity = 1
    max_capacity = 10
  }

  gateway_ip_configuration {
    name      = "applicationGatewayIpConfig"
    subnet_id = module.mdp_subnet_agw.subnet_id
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


##############Site=1 AKS

backend_address_pool {
    name         = "aksapp-backendpool"
    fqdns        = [
                    "mdp${var.application_gateway.environment_acronym}.kpmgcloudops.com"
                  ]
}

backend_http_settings {
    name                  = "${lower(var.application_acronym)}aks${lower(local.environment_suffix)}-https-settings"
    cookie_based_affinity = "Enabled"
    affinity_cookie_name = "ApplicationGatewayAffinity"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 30
    probe_name            = "${lower(var.application_acronym)}aks${lower(local.environment_suffix)}-probe"

  }

  http_listener {
    name                           = "aks-https-listener"
    host_name                      = var.aks_cert_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = var.aks_cert_name
  }

  request_routing_rule {
    name                       = "${lower(var.application_acronym)}aks${lower(local.environment_type)}-routing-rule"
    rule_type                  = "Basic"
    http_listener_name         = "aks-https-listener"
    backend_address_pool_name  = "aksapp-backendpool"
    backend_http_settings_name = "${lower(var.application_acronym)}aks${lower(local.environment_suffix)}-https-settings"
  }

probe {
    host                       = var.aks_cert_name
    name                       = "${lower(var.application_acronym)}aks${lower(local.environment_suffix)}-probe"
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
    name     = var.aks_cert_name
    data     = filebase64("${var.aks_cert_name}")
    password = ""
    #key_vault_secret_id = data.azurerm_key_vault_secret.ssl_certificate.id
  }

##############Site=2 APIM

backend_address_pool {
    name         = "apim-backendpool"
    fqdns        = [
                    "mdpapi${local.environment_suffix}.kpmgcloudops.com",
                  ]
  }

  backend_http_settings {
    name                  = "${lower(var.application_acronym)}${lower(local.environment_suffix)}-https-settings"
    cookie_based_affinity = "Enabled"
    affinity_cookie_name = "ApplicationGatewayAffinity"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 30
    host_name             = "mdpapi${local.environment_suffix}.kpmgcloudops.com"
    probe_name            = "${lower(var.application_acronym)}${lower(local.environment_suffix)}-probe"

  }
  http_listener {
    name                           = "apim-https-listener"
    host_name                      = var.api_pfx_cert_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = var.api_pfx_cert_name
  }

  request_routing_rule {
    name                       = "${lower(var.application_acronym)}${lower(local.environment_type)}-routing-rule"
    rule_type                  = "Basic"
    http_listener_name         = "apim-https-listener"
    backend_address_pool_name  = "apim-backendpool"
    backend_http_settings_name = "${lower(var.application_acronym)}${lower(local.environment_suffix)}-https-settings"
  }

  probe {
    host                       = "${lower(var.application_acronym)}api-${lower(local.environment_type)}.kpmgcloudops.com"
    name                       = "${lower(var.application_acronym)}${lower(local.environment_suffix)}-probe"
    protocol                   = "Https"
    path                       = var.probe_path
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
    data     = filebase64("${var.api_pfx_cert_name}")
    password = ""
    #key_vault_secret_id = data.azurerm_key_vault_secret.ssl_certificate.id
  }

  ##############Site=3 APIM_developer

backend_address_pool {
    name         = "apim-developer-backendpool"
    fqdns        = [
                    "mdpapi${local.environment_suffix}-developer.kpmgcloudops.com",
                  ]
  }

  backend_http_settings {
    name                  = "${lower(var.application_acronym)}-apim${lower(local.environment_suffix)}-developer-https-settings"
    cookie_based_affinity = "Enabled"
    affinity_cookie_name = "ApplicationGatewayAffinity"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 30
    host_name             = "mdpapi${local.environment_suffix}-developer.kpmgcloudops.com"
    probe_name            = "${lower(var.application_acronym)}-apim${lower(local.environment_suffix)}-developer-probe"

  }
  http_listener {
    name                           = "apim-developer-https-listener"
    host_name                      = var.api_developer_pfx_cert_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = var.api_developer_pfx_cert_name
  }

  request_routing_rule {
    name                       = "${lower(var.application_acronym)}-apim${lower(local.environment_type)}-developer-routing-rule"
    rule_type                  = "Basic"
    http_listener_name         = "apim-developer-https-listener"
    backend_address_pool_name  = "apim-developer-backendpool"
    backend_http_settings_name = "${lower(var.application_acronym)}-apim${lower(local.environment_suffix)}-developer-https-settings"
  }

  probe {
    host                       = "${lower(var.application_acronym)}api-${lower(local.environment_type)}-developer.kpmgcloudops.com"
    name                       = "${lower(var.application_acronym)}-apim${lower(local.environment_suffix)}-developer-probe"
    protocol                   = "Https"
    path                       = var.probe_path
    interval                   = "30"
    timeout                    = "30"
    unhealthy_threshold        = "3"

    match {
      status_code = [
      "200-399"]
    }
  }
  
  ssl_certificate {
    name     = var.api_developer_pfx_cert_name
    data     = filebase64("${var.api_developer_pfx_cert_name}")
    password = ""
    #key_vault_secret_id = data.azurerm_key_vault_secret.ssl_certificate.id
  }

##############Site=4 Appintg

backend_address_pool {
    name         = "appintg-backendpool" #Appintg backendpool
    fqdns        = [
                    "mdp${local.environment_suffix}.kpmgcloudops.com"
                   ]
  }

backend_http_settings {
    name                  = "${lower(var.application_acronym)}appintg${lower(local.environment_suffix)}-https-settings"
    cookie_based_affinity = "Enabled"
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 30
    pick_host_name_from_backend_address = "true"
    probe_name            = "${lower(var.application_acronym)}appintg${lower(local.environment_suffix)}-probe"

  }

  http_listener {
    name                           = "appintg-https-listener"
    host_name                      = var.app_intg_cert_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Https"
    require_sni                    = "true"
    ssl_certificate_name           = var.app_intg_cert_name
  }

  request_routing_rule {
    name                       = "${lower(var.application_acronym)}appintg${lower(local.environment_type)}-routing-rule"
    rule_type                  = "Basic"
    http_listener_name         = "appintg-https-listener"
    backend_address_pool_name  = "appintg-backendpool"
    backend_http_settings_name = "${lower(var.application_acronym)}appintg${lower(local.environment_suffix)}-https-settings"
  }

probe {
    #host                       = "${lower(var.application_acronym)}${lower(local.environment_type)}.kpmgcloudops.com"
    name                       = "${lower(var.application_acronym)}appintg${lower(local.environment_suffix)}-probe"
    protocol                   = "Https"
    pick_host_name_from_backend_http_settings= "true"
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
    name     = var.app_intg_cert_name
    data     = filebase64("${var.app_intg_cert_name}.pfx")
    password = ""
    #key_vault_secret_id = data.azurerm_key_vault_secret.ssl_certificate.id
  }
    tags = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "mdp_waf_logs" {
  name                       = "app_gateway_waf_logs"
  target_resource_id         = azurerm_application_gateway.this.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.spoke_law.id

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
/*
resource "azurerm_monitor_diagnostic_setting" "mdp_waf_CSM_Eventhub" {
    name                           = "mdp_gateway_CSM_Eventhub"
    target_resource_id             = azurerm_application_gateway.this.id
    eventhub_name                  = "insights-logs-paasdiag"
    eventhub_authorization_rule_id = "${var.DV_CSM_eventhub_authorization_rule_id}"
    
    log {
    category = "AzureFirewallApplicationRule"
    enabled  = true

    retention_policy {
      enabled = true
      days    = 7
    }
  }

  log {
    category = "AzureFirewallNetworkRule"
    enabled  = true

    retention_policy {
      enabled = true
      days    = 7
    }
  }

  log {
    category = "AzureFirewallDnsProxy"
    enabled  = true

    retention_policy {
      enabled = true
      days    = 0
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
*/