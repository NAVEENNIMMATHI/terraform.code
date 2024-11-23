data "azurerm_subscription" "current" {}

data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "hub" {
  provider = azurerm.hub
  name     = var.hub_vnet_resource_group_name
}

data "azurerm_virtual_network" "hub" {
  provider            = azurerm.hub
  name                = var.hub_vnet_name
  resource_group_name = data.azurerm_resource_group.hub.name
}

data "azurerm_resource_group" "transit" {
  provider = azurerm.transit
  name     = var.transit_vnet_resource_group_name
}

data "azurerm_virtual_network" "transit" {
  provider            = azurerm.transit
  name                = var.transit_vnet_name
  resource_group_name = data.azurerm_resource_group.transit.name
}

data "azurerm_private_dns_zone" "dns_zone_dfs" {
  name                = var.private_dns_zone_name_dfs
  resource_group_name = var.private_dns_zone_resource_group_name
  provider            = azurerm.dns
}

data "azurerm_private_dns_zone" "dns_zone_storage_file" {
  name                = var.private_dns_zone_name_file
  resource_group_name = var.private_dns_zone_resource_group_name
  provider            = azurerm.dns
}

data "azurerm_private_dns_zone" "dns_zone_keyvault" {
  name                = var.private_dns_zone_name_vaultcore
  resource_group_name = var.private_dns_zone_resource_group_name
  provider            = azurerm.dns
}

data "azurerm_private_dns_zone" "dns_zone_postgresql" {
  name                = var.private_dns_zone_name_psql
  resource_group_name = var.private_dns_zone_resource_group_name
  provider            = azurerm.dns
}

data "azurerm_log_analytics_workspace" "spoke_law" {
name                  = var.spoke_law_name 
  resource_group_name = var.spoke_law_rg_name
}


# Arcgis ACR DNS Zone
data "azurerm_private_dns_zone" "dns_zone_acr" {
  provider            = azurerm.dns
  name                = var.private_dns_zone_name_acr
  resource_group_name = var.private_dns_zone_resource_group_name

}

data "azurerm_private_dns_zone" "dns_zone_database" {
name                = var.private_dns_zone_name_database
resource_group_name = var.private_dns_zone_resource_group_name
provider            = azurerm.dns
}

/*
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
*/

data "azurerm_firewall" "firewall" {
  name                = var.firewall_network_name
  resource_group_name = var.firewall_network_rg_name
  provider            = azurerm.firewall
}
#Subnet for Sharedda
data "azurerm_subnet" "arcgis_pbi_subnet" {
  name                 = var.pbi_subnet_name
  virtual_network_name = var.spoke_vnet_name
  resource_group_name  = var.spoke_vnet_rg_name
}