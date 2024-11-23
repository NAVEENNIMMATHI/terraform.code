resource "azurerm_app_service_plan" "appserviceplan_central" {
  name                = "asp-${var.location_acronym}-${var.application_acronym}-${var.application_region}-${var.environment_acronym}"
  location            = module.applicationrg_central.resource_group_location
  resource_group_name = module.applicationrg_central.resource_group_name
  kind                = "Windows"
  reserved            = false

  sku {
    tier                     = var.asp_tier
    size                     = var.asp_size
    capacity                 = var.asp_capacity
  }

  tags                       = var.tags

}