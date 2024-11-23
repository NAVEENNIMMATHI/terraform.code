resource "azurerm_function_app" "funapptest" {
  name                      = "fun-usc-${lower(var.application_acronym)}-${lower(var.environment_type_test)}"
  location                  = module.applicationrg.resource_group_location
  resource_group_name       = module.applicationrg.resource_group_name
  app_service_plan_id       = module.app_service_plan.app_service_plan_id
  #storage_connection_string = module.storage_account.primary_connection_string
  storage_account_name      = module.storage_account.storage_account_name
  storage_account_access_key  = module.storage_account.primary_access_key
  tags                      = var.tags
  count                     = var.restrict_gateway_endpoint == "true" ? 0 : 1

  identity {
        type = "SystemAssigned"
    }

  app_settings = {
      APPINSIGHTS_INSTRUMENTATIONKEY = azurerm_application_insights.app_insights_fun_app_test[0].instrumentation_key
      APPLICATIONINSIGHTS_CONNECTION_STRING = "InstrumentationKey=${azurerm_application_insights.app_insights_fun_app_test[0].instrumentation_key}"
      ApplicationInsightsAgent_EXTENSION_VERSION = "~2"
      FUNCTIONS_WORKER_RUNTIME = "dotnet"
      WEBSITE_NODE_DEFAULT_VERSION = "~12"
  }
}

resource "azurerm_function_app" "funappfinal" {
  name                      = "fun-usc-${lower(var.application_acronym)}-${lower(var.funapp_final_environment_suffix)}"
  location                  = module.applicationrg.resource_group_location
  resource_group_name       = module.applicationrg.resource_group_name
  app_service_plan_id       = module.app_service_plan.app_service_plan_id
  #storage_connection_string = module.storage_account.primary_connection_string
  storage_account_name      = module.storage_account.storage_account_name
  storage_account_access_key  = module.storage_account.primary_access_key
  tags                      = var.tags

  identity {
        type = "SystemAssigned"
    }

  app_settings = {
      APPINSIGHTS_INSTRUMENTATIONKEY = azurerm_application_insights.app_insights_fun_app_final.instrumentation_key
      APPLICATIONINSIGHTS_CONNECTION_STRING = "InstrumentationKey=${azurerm_application_insights.app_insights_fun_app_final.instrumentation_key}"
      ApplicationInsightsAgent_EXTENSION_VERSION = "~2"
      FUNCTIONS_WORKER_RUNTIME = "dotnet"
      WEBSITE_NODE_DEFAULT_VERSION = "~12"
  }
}