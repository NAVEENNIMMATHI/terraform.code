# Create User Assigned Identity (Type of Managed Identity)
resource "azurerm_user_assigned_identity" "eccm_manageid" {
  name                = "mgi-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name = module.eccm_rg.resource_group_name
  location            = var.resource_location
  tags                = var.tags
}