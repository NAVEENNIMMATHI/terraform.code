  resource "azurerm_application_insights" "app_insights_fun_app" {
  name                = "ais-${var.location_acronym}-${var.application_acronym}-fun-${lower(var.environment_acronym)}"
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location
  application_type    = "web"
  retention_in_days   = 90
  sampling_percentage = 100
  tags                = var.tags
}
