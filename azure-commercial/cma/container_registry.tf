resource "azurerm_container_registry" "acr" {
  name                     = "crr${var.location_acronym}${var.application_acronym}${var.environment_acronym}"
  resource_group_name      = module.cmarg.resource_group_name
  location                 = module.cmarg.resource_group_location
  sku                      = "Premium"
  admin_enabled            = "true"
  tags                     = var.tags
  }