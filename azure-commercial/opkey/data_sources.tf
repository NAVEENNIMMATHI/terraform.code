data "azurerm_subscription" "current" {}

data "azurerm_client_config" "current" {}

data "azuread_client_config" "current" {}

data "azurerm_virtual_network" "spoke_vnet" {
  name                = var.spoke_vnet_name
  resource_group_name = var.spoke_vnet_rg_name
}

data "azurerm_firewall" "firewall" {
  name                = var.firewall_network_name
  resource_group_name = var.firewall_network_rg_name
  provider            = azurerm.firewall
}

#data "template_file" "ps1" {
#  template = "${file("win_initialise_data_disk.ps1")}"
#}

data "azurerm_log_analytics_workspace" "spoke_law" {
  name                = var.spoke_law_name
  resource_group_name = var.spoke_law_rg_name
}

data "azurerm_private_dns_zone" "dns_zone_registry" {
  name                = var.private_dns_zone_name_azurecr
  resource_group_name = var.private_dns_zone_resource_group_name
  provider            = azurerm.dns
}

data "azurerm_private_dns_zone" "dns_zone_keyvault" {

name                = var.private_dns_zone_name_vaultcore
resource_group_name = var.private_dns_zone_resource_group_name
provider            = azurerm.dns
}
