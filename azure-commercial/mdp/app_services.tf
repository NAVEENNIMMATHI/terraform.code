#Web App for ClamAV

resource "azurerm_app_service" "app_avscan" {
  name                = "web-${var.location_acronym}-${var.application_acronym}-avwap-${var.environment_acronym}"
  location            = module.mdp_rg_main.resource_group_location
  resource_group_name = module.mdp_rg_main.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.asp_avscan_wap.id
  https_only          = "true"
  app_settings = {
    "DOCKER_REGISTRY_SERVER_URL"          = "https://${azurerm_container_registry.mdpacr.login_server}"
    "DOCKER_REGISTRY_SERVER_USERNAME"     = azurerm_container_registry.mdpacr.admin_username
    "DOCKER_REGISTRY_SERVER_PASSWORD"     = azurerm_container_registry.mdpacr.admin_password
    "WEBSITE_DNS_SERVER"                  = "168.63.129.16"
    "WEBSITE_HTTPLOGGING_RETENTION_DAYS"  = "5"
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
    "WEBSITES_VNET_ROUTE_ALL"             = "1"
    "PORT"                                = "9000"
  }

  site_config {
    app_command_line = ""
    linux_fx_version = "DOCKER|${azurerm_container_registry.mdpacr.login_server}/kpmg-clamav:latest"
    always_on        = true
    min_tls_version  = "1.2"
    scm_type         = "VSTSRM"

  }

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags

  lifecycle {
    ignore_changes = [
      backup,
      site_config,
      app_settings
    ]
  }
}

#Web App for App Integration
resource "azurerm_app_service" "web_appintg" {
  name                = "web-${var.location_acronym}-${var.application_acronym}-appintg-${var.environment_acronym}"
  location            = module.mdp_rg_main.resource_group_location
  resource_group_name = module.mdp_rg_main.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.asp_appintg.id
  https_only          = "true"
  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE"            = "1",
    "WEBSITES_VNET_ROUTE_ALL"             = "1"
  }

    site_config {
        use_32_bit_worker_process = "false"
        dotnet_framework_version  = "v6.0"
        min_tls_version           = "1.2"
        vnet_route_all_enabled    ="true"
        default_documents         = [
              "Default.htm",
              "Default.html",
              "Default.asp",
              "index.htm",
              "index.html",
              "iisstart.htm",
              "default.aspx",
              "index.php",
              "hostingstart.html",
            ] 
  }

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
  }

resource "azurerm_monitor_diagnostic_setting" "mdp_appintg_logging" {
  name                           = "appintg-mdp-logs"
  target_resource_id             = azurerm_app_service.web_appintg.id
  log_analytics_workspace_id     = data.azurerm_log_analytics_workspace.spoke_law.id

  log {
    category = "AppServiceAppLogs"
    enabled  = true

    retention_policy {
      days    = 30
      enabled = true
    }
  }

  log {
    category = "AppServiceAuditLogs"
    enabled  = true

    retention_policy {
      days    = 30
      enabled = true
    }
  }
  log {
            category = "AppServiceAntivirusScanAuditLogs" 
            enabled  = false 

            retention_policy {
                days    = 0 
                enabled = false 
             }
         }
  log {
            category = "AppServiceConsoleLogs" 
            enabled  = false 
 
            retention_policy {
                days    = 0 
                enabled = false 
             }
         }
  log {
            category = "AppServiceFileAuditLogs" 
            enabled  = false 
            retention_policy {
                days    = 0 
                enabled = false 
             }
         }
  log {
            category = "AppServiceIPSecAuditLogs" 
            enabled  = false 
            retention_policy {
                days    = 0 
                enabled = false 
             }
         }
  log {
           category = "AppServicePlatformLogs" 
           enabled  = false 
           retention_policy {
                days    = 0 
                enabled = false 
             }
        }


  log {
    category = "AppServiceAppLogs"
    enabled  = true
    retention_policy {
      days    = 30
      enabled = true
    }
  }

  log {
    category = "AppServiceHTTPLogs"
    enabled  = true

    retention_policy {
      days    = 30
      enabled = true
    }
  }

  metric {
    category = "AllMetrics"
    
    retention_policy {
      days    = 0
      enabled = false
    }
  }
}

/*
resource "azurerm_monitor_diagnostic_setting" "mdp_CSM_Eventhub" {
    name                           = "mdp_appintg_CSM_Eventhub"
    target_resource_id             = azurerm_app_service.web_appintg.id
    eventhub_name                  = "insights-logs-paasdiag"
    eventhub_authorization_rule_id = "${var.DV_CSM_eventhub_authorization_rule_id}"
    
    log {
    category = "AppServiceAppLogs"
    enabled  = true

    retention_policy {
      days    = 30
      enabled = true
    }
  }

  log {
    category = "AppServiceAuditLogs"
    enabled  = true

    retention_policy {
      days    = 30
      enabled = true
    }
  }

  log {
    category = "AppServiceAppLogs"
    enabled  = true

    retention_policy {
      days    = 30
      enabled = true
    }
  }

  log {
    category = "AppServiceHTTPLogs"
    enabled  = true

    retention_policy {
      days    = 30
      enabled = true
    }
  }

  metric {
    category = "AllMetrics"
    
    retention_policy {
      days    = 0
      enabled = false
    }
  }
}

*/
