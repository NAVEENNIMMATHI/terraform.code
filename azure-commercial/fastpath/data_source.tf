data "azurerm_subscription" "current" {
}

data "azuread_service_principal" "fastpathsp" {
  display_name = var.encryptapp_service_principal_name
}

data "azurerm_storage_account" "vmdiagnosticslogs" {
  name                = var.diagnostic_storage_account_name
  resource_group_name = var.diagnostic_storage_account_resourcegroup_name
}

data "template_file" "ps1" {
  template = file("win_initialise_data_disk.ps1")
}

data "template_file" "xml" {
  template = file("windows-config.xml.tpl")
}

data "azurerm_key_vault" "keyvault" {
  name                = var.keyvault_name
  resource_group_name = var.keyvault_resource_group_name
}

#query to shared services
data "azurerm_log_analytics_workspace" "law" {
  name                = var.log_analytics_workspace_name
  resource_group_name = var.sharedrg_resource_group_name
}

data "azurerm_subnet" "asesubnet" {
  name                 = var.ase_subnet_name
  virtual_network_name = var.sharedvnet_virtual_network_name
  resource_group_name  = var.sharedrg_resource_group_name
}

data "azurerm_subnet" "appgatewaysubnet" {
  name                 = var.appgateway_subnet_name
  virtual_network_name = var.sharedvnet_virtual_network_name
  resource_group_name  = var.sharedrg_resource_group_name
}

