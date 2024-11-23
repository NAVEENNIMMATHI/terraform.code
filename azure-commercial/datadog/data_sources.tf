data "azurerm_client_config" "current" {
}

data "azurerm_subscription" "current" {
}

output "subscription_id" {
  value = data.azurerm_subscription.current.subscription_id
}

data "azuread_service_principal" "backup_management_service" {
  display_name = "Backup Management Service"
}

data "azuread_service_principal" "ato_ofr" {
  display_name = "ATO OFR"
}

data "azuread_group" "all_admins" {
  name = var.environment_acronym == "dev" ? "All Admins" : "AAD DC Administrators"
}

data "azurerm_resource_group" "ofr_rg" {
   name     = "RGP-${upper(var.location_acronym)}-OFR-${upper(var.environment_acronym)}"
}

data "azurerm_virtual_network" "ofr_vnet" {
  name                = "vnt-${var.location_acronym}-ofr-${var.environment_acronym}"
  resource_group_name = data.azurerm_resource_group.ofr_rg.name
}

data "azurerm_subnet" "build" {
  name                 = "sub-${var.location_acronym}-build-${var.environment_acronym}"
  virtual_network_name = data.azurerm_virtual_network.ofr_vnet.name
  resource_group_name  = data.azurerm_resource_group.ofr_rg.name
}

data "azurerm_subnet" "app" {
  name                 = "sub-${var.location_acronym}-app-${var.environment_acronym}"
  virtual_network_name = data.azurerm_virtual_network.ofr_vnet.name
  resource_group_name  = data.azurerm_resource_group.ofr_rg.name
}