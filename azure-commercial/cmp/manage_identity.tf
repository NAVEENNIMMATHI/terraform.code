resource "azurerm_user_assigned_identity" "cmp_agw_mi" {
  name                = "mgi-${var.location_acronym}-${var.application_acronym}-agw-${var.environment_acronym}"
  resource_group_name = module.cmp_rg_shared.resource_group_name
  location            = module.cmp_rg_shared.resource_group_location
}