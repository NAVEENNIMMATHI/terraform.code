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

data "azurerm_subnet" "ignite_pep_subnet" {
  name                 = var.pep_subnet_name
  virtual_network_name = var.spoke_vnet_name
  resource_group_name  = var.spoke_vnet_rg_name
}


data "azurerm_private_dns_zone" "storage_blob" {
  name                = var.private_dns_zone_name_blob
  resource_group_name = var.private_dns_zone_resource_group_name
  provider            = azurerm.dns
}

data "azurerm_private_dns_zone" "postgresql_database" {
  name                = var.private_dns_zone_name_psql
  resource_group_name = var.private_dns_zone_resource_group_name
  provider            = azurerm.dns

}

# Ignite CP ACR DNS Zone
data "azurerm_private_dns_zone" "dns_zone_cp_acr" {
  provider            = azurerm.dns
  name                = var.private_dns_zone_name_cp_acr
  resource_group_name = var.private_dns_zone_resource_group_name

}

data "azurerm_private_dns_zone" "dns_zone_keyvault" {

name                = var.private_dns_zone_name_vaultcore
resource_group_name = var.private_dns_zone_resource_group_name
provider            = azurerm.dns
}

data "azurerm_private_dns_zone" "dns_zone_cognitive_account" {
name                = var.private_dns_zone_name_cognitive
resource_group_name = var.private_dns_zone_resource_group_name
provider            = azurerm.dns
}
