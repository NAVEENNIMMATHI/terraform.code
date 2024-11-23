
resource "azurerm_application_insights" "app_insights" {
  name                = "ais-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name = module.rgfpi.resource_group_name
  location            = module.rgfpi.resource_group_location
  application_type    = "web"
  retention_in_days   = 90
  sampling_percentage = 0
  tags                = var.tags
}