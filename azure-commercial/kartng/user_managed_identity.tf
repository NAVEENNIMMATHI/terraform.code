resource "azurerm_user_assigned_identity" "kartngmgi" {
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location
  name                = "mgi-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  tags                = var.tags
}