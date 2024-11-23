resource "azurerm_application_insights" "app_insights_app" {
  name                = "ais-${var.location_acronym}-${var.application_acronym}-${lower(var.environment_acronym)}"
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location
  application_type    = "web"
  retention_in_days   = 90
  sampling_percentage = 100

  tags = var.tags
}
resource "azurerm_application_insights" "app_insights_rest_app" {
  name                = "ais-${var.location_acronym}-${var.application_acronym}-rest-${lower(var.environment_acronym)}"
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location
  application_type    = "web"
  retention_in_days   = 90
  sampling_percentage = 100

  tags = var.tags
}
