resource "azurerm_application_insights" "vmap_webapp_insights" {
  name                = "ais-${var.location_acronym}-${var.application_acronym}-${lower(var.environment_acronym)}"
  resource_group_name = module.vmap_resource_group.resource_group_name
  location            = module.vmap_resource_group.resource_group_location
  application_type    = "web"
  retention_in_days   = 90
  sampling_percentage = 100
  tags                = var.tags
}
