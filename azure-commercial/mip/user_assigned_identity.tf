# User Assigned Identity
resource "azurerm_user_assigned_identity" "agwIdentity" {
  resource_group_name = module.mathworks_rg_shared.resource_group_name
  location            = module.mathworks_rg_shared.resource_group_location

  name = "mgi-${var.location_acronym}-${var.application_acronym}-agw-${var.environment_acronym}"

  tags = var.tags
}