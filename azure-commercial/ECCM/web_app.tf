resource "azurerm_app_service" "eccm_web_app" {
  name                = "web-${lower(var.location_acronym)}-${lower(var.application_acronym)}-${lower(var.environment_acronym)}"
  location            = var.resource_location
  resource_group_name = module.eccm_rg.resource_group_name
  app_service_plan_id = azurerm_service_plan.eccm_app_web_app.id
  https_only          = "true"
  tags                = var.tags
  
    app_settings = {
      WEBSITE_VNET_ROUTE_ALL                       = 1
      "APPINSIGHTS_INSTRUMENTATIONKEY"             = module.eccmappinsights.instrumentation_key
      "APPLICATIONINSIGHTS_CONNECTION_STRING"      = "InstrumentationKey=${module.eccmappinsights.instrumentation_key}"
  }

  site_config {                                                            
     linux_fx_version = "PYTHON|3.9"
     scm_type="VSTSRM"                                        
   }      

  identity {
     type = "SystemAssigned"
    }                                                                  

}


resource "azurerm_monitor_diagnostic_setting" "eccm_app_web_diag" {
  name                           = "eccm-web-app-logs"
  target_resource_id             = azurerm_app_service.eccm_web_app.id
  log_analytics_workspace_id     = data.azurerm_log_analytics_workspace.spoke_law.id
  log_analytics_destination_type = "AzureDiagnostics"


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
  lifecycle {
     ignore_changes = [
       log_analytics_destination_type
     ]
   }
}


