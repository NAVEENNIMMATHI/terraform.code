resource "azurerm_user_assigned_identity" "identity" {
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location
  name                = var.environment == "production" ? "azuser-svcKRT" : "mgi-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  tags                = var.tags

  #count = "${var.target_deployment_environment == "prod" ? 0 : 1}"
}

