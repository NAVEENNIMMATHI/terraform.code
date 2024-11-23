resource "azurerm_function_app" "eccm_fun_app" {
  name                       = "fun-${lower(var.location_acronym)}-${lower(var.application_acronym)}-${lower(var.environment_acronym)}"
  location                   = var.resource_location
  resource_group_name        = module.eccm_rg.resource_group_name
  app_service_plan_id        = azurerm_service_plan.eccm_app_web_app.id
  storage_account_name       = azurerm_storage_account.eccm_app.name
  storage_account_access_key = azurerm_storage_account.eccm_app.primary_access_key
  os_type                    = "linux"
  version                    = "~4"
  https_only                 = true
  tags                = var.tags

  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME"                   = "python"
    "APPINSIGHTS_INSTRUMENTATIONKEY"             = module.eccmappinsights.instrumentation_key
    "APPLICATIONINSIGHTS_CONNECTION_STRING"      = "InstrumentationKey=${module.eccmappinsights.instrumentation_key}"
    WEBSITE_VNET_ROUTE_ALL                       = 1
  }

  site_config {
    linux_fx_version = "python|3.9"
    always_on        = true
  }

  identity {
    type = "SystemAssigned"
  }
}


resource "azurerm_monitor_diagnostic_setting" "eccm_function_app_logging" {
  name                       = "eccm-function-app-logs"
  target_resource_id         = azurerm_function_app.eccm_fun_app.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.spoke_law.id
  log_analytics_destination_type = "AzureDiagnostics"

  log {
    category = "FunctionAppLogs"                                
    enabled  = true

    retention_policy {
      days    = 0
      enabled = true
    }
  }
    lifecycle {
     ignore_changes = [
       log_analytics_destination_type
     ]
   }
}
