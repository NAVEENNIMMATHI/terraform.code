resource "azurerm_function_app" "funapp" {
  name                      = "fun-usc-${var.application_acronym}-${var.environment_acronym}"
  location                  = module.applicationrg.resource_group_location
  resource_group_name       = module.applicationrg.resource_group_name
  app_service_plan_id       = module.app_service_plan.app_service_plan_id
  storage_connection_string = module.storage_account.primary_connection_string
  enable_builtin_logging    = false 
  version                   = "~3" 

  identity {
        type = "SystemAssigned"
    }

  app_settings = {
      APPINSIGHTS_INSTRUMENTATIONKEY = module.app_insights_fun_app.instrumentation_key
      APPLICATIONINSIGHTS_CONNECTION_STRING = "InstrumentationKey=${module.app_insights_fun_app.instrumentation_key}"
      ApplicationInsightsAgent_EXTENSION_VERSION = "~2"
      APPINSIGHTS_PROFILERFEATURE_VERSION = "disabled"
      APPINSIGHTS_SNAPSHOTFEATURE_VERSION = "disabled"
      ActivityFeedbackStatisticsAggregratorCronJob = "0 */5 * * * *"
             }
       
  tags                      = var.tags

  lifecycle {
    ignore_changes = [
      app_settings
    ]
  }

  site_config {
    always_on = true
  }
}


