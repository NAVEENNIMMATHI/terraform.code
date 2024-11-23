resource "azurerm_user_assigned_identity" "identity" {
  resource_group_name = data.azurerm_resource_group.sharedrg.name
  location            = data.azurerm_resource_group.sharedrg.location
  name                = var.managed_identity_name
  tags                = var.tags

  #count = "${var.target_deployment_environment == "prod" ? 0 : 1}"
}

