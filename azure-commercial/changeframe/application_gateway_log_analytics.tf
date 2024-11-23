resource "azurerm_log_analytics_workspace" "app_gateway_logs" {
  name                = "law-${lower(var.location_acronym)}-${lower(var.application_acronym)}-${lower(var.environment_acronym)}"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags                = var.tags
}

resource "azurerm_log_analytics_solution" "app_gateway_solution_logs" {
  solution_name         = "AzureAppGatewayAnalytics"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.app_gateway_logs.id
  workspace_name        = azurerm_log_analytics_workspace.app_gateway_logs.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/AzureAppGatewayAnalytics"
  }
}