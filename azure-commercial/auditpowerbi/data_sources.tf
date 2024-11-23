data "azurerm_client_config" "current" {
}

data "azurerm_subscription" "current" {
}

data "azurerm_resource_group" "disk_encrypt" {
  name = var.diskencryptvault_rg_name
}

data "azurerm_route_table" "routetable" {
  name                = var.routetable_name
  resource_group_name = var.routetable_resource_group_name
}

data "template_file" "ps1" {
  template = "${file("win_initialise_data_disk.ps1")}"
}

data "template_file" "xml" {
  template = "${file("windows-config.xml.tpl")}"
}

data "azurerm_storage_account" "vmdiagnosticslogs" {
  name                = var.vmdiagnosticslogs_name
  resource_group_name = var.vmdiagnosticslogs_resource_group_name
}

data "azurerm_log_analytics_workspace" "loganalyticsworkspace" {
  name                = var.loganalyticsworkspace_name
  resource_group_name = var.loganalyticsworkspace_resource_group_name
}

data "azuread_service_principal" "encryptApp" {
  display_name = var.encryptapp_sp_name
}

data "azurerm_key_vault" "keyvault" {
  name                = var.keyvault_name
  resource_group_name = var.keyvault_resource_group_name
}