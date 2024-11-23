data "azurerm_client_config" "current" {
}

data "azurerm_subscription" "current" {
}


data "azurerm_recovery_services_vault" "vault" {
  name                = var.recoveryServicesVaultName
  resource_group_name = var.recoveryServicesVaultResourceGroupName
}

#ArcGIS Private Endpoint Subnet
data "azurerm_subnet" "arcgis_pep_subnet" {
  name                 = var.pep_subnet_name
  virtual_network_name = var.gis_vnet_name
  resource_group_name  = var.gis_vnet_rg_name
}
