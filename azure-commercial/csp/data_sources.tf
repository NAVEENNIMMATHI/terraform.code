data "azurerm_subscription" "current" {}

data "azurerm_client_config" "current" {}

data "azurerm_virtual_network" "spoke_vnet" {
  name                = var.spoke_vnet_name
  resource_group_name = var.spoke_vnet_rg_name
}

data "azurerm_firewall" "firewall" {
  name                = var.firewall_network_name
  resource_group_name = var.firewall_network_rg_name
  provider            = azurerm.firewall
}

data "azurerm_log_analytics_workspace" "spoke_law" {
  name                = var.spoke_law_name
  resource_group_name = var.spoke_law_rg_name
}

data "azuread_service_principal" "defaultpipeline" {
  display_name = var.pipeline_service_principal_name
}

data "azuread_group" "service_account_group" {
  display_name = "CO-ServiceAccounts"
}
