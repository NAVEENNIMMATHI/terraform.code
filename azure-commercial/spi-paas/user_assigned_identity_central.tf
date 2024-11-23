resource "azurerm_user_assigned_identity" "spipaascentraluai" {
  name                = "uai-${var.location_acronym}-${var.application_acronym}-${var.application_region}-${var.environment_acronym}"
  location                      = module.applicationrg_central.resource_group_location
  resource_group_name           = module.applicationrg_central.resource_group_name
  tags                = var.tags
}