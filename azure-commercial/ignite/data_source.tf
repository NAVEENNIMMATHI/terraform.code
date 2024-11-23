data "azurerm_subscription" "current" {}

data "azurerm_client_config" "current" {}

data "azurerm_virtual_network" "spoke_vnet" {
  name                = var.spoke_vnet_name
  resource_group_name = var.spoke_vnet_rg_name
}

data "azurerm_log_analytics_workspace" "log_analytics_workspace" {
  name                = var.spoke_law_name
  resource_group_name = var.spoke_law_rg_name
}

data "azuread_service_principal" "devopsspn" {
  display_name = var.devopsspn_service_principal_name
}