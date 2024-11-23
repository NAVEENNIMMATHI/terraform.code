resource "azurerm_function_app" "app_service_function" {
  name                       = "fun-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name        = module.applicationrg.resource_group_name
  location                   = module.applicationrg.resource_group_location
  app_service_plan_id        = azurerm_app_service_plan.appserviceplan.id
  storage_account_name       = module.functionappsa.storage_account_name
  storage_account_access_key = module.functionappsa.primary_access_key
  version                    = "~3"
  https_only                 = true
  
  app_settings               = {
    FUNCTIONS_WORKER_RUNTIME       = "dotnet"
    WEBSITE_NODE_DEFAULT_VERSION   = "~12"
  }
  
  identity {
        type = "SystemAssigned"
    }

  tags                       = var.tags
}