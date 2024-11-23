resource "azurerm_function_app" "datadogfn" {
  name                      = "fun-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  location                  = azurerm_resource_group.datadogrg.location
  resource_group_name       = azurerm_resource_group.datadogrg.name
  app_service_plan_id       = module.app_service_plan.app_service_plan_id
  storage_connection_string = module.storage_account.primary_connection_string
  enable_builtin_logging    = false 
  version                   = "~3" 

  identity {
        type = "SystemAssigned"
  }

  app_settings = {
      APPINSIGHTS_INSTRUMENTATIONKEY            = module.application_insights.instrumentation_key
      APPLICATIONINSIGHTS_CONNECTION_STRING     = "InstrumentationKey=${module.application_insights.instrumentation_key}"
      DD_API_KEY                                = "${var.dd_api_key}"
      DD_LOG_SPLITTING_CONFIG                   = "{}"
      WEBSITE_RUN_FROM_PACKAGE                  = "1"
      EVENT_HUB_NS_CONNECTION                   = azurerm_eventhub_namespace.event_hub_namespace.default_primary_connection_string
      FUNCTIONS_EXTENSION_VERSION               = "~3"
      FUNCTIONS_WORKER_RUNTIME                  = "node"
      WEBSITE_NODE_DEFAULT_VERSION              = "~12"
      AzureWebJobsStorage                       = module.storage_account.primary_connection_string
  }
       
  tags = var.tags

  site_config {
    always_on = true
  }
}