
resource "azurerm_function_app" "app_service_function" {
  name                       = "fun-${lower(var.location_acronym)}-${lower(var.application_acronym)}-${lower(var.environment_acronym)}"
  location                   = module.applicationrg.resource_group_location
  resource_group_name        = module.applicationrg.resource_group_name
  app_service_plan_id        = module.app_service_plan.app_service_plan_id
  #storage_connection_string = module.storage_account.primary_connection_string
  storage_account_name       = module.storage_account.storage_account_name
  storage_account_access_key = module.storage_account.primary_access_key
  

  identity {
        type = "SystemAssigned"
    }

  app_settings = {
      APPINSIGHTS_INSTRUMENTATIONKEY = azurerm_application_insights.app_insights_fun_app.instrumentation_key
      APPLICATIONINSIGHTS_CONNECTION_STRING = "InstrumentationKey=${azurerm_application_insights.app_insights_fun_app.instrumentation_key}"
      ApplicationInsightsAgent_EXTENSION_VERSION = "~2"
      FUNCTIONS_WORKER_RUNTIME = "dotnet"
      WEBSITE_NODE_DEFAULT_VERSION = "~12"
  }

  lifecycle {
   ignore_changes =  [
     app_settings
   ]
  }

  tags                       = var.tags

} 