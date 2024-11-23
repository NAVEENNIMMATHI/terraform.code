data "azurerm_client_config" "current" {
}

data "azurerm_subscription" "current" {
}

provider "azurerm" {
  alias           = "shared"
  subscription_id = var.vmimagesubscriptionid
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  features {}
}

data "azurerm_route_table" "spi_route_table" {
  name                = var.spi_route_table_name
  resource_group_name = var.spi_route_table_resource_group_name
}

data "azurerm_log_analytics_workspace" "cospi" {
  provider            = azurerm.shared
  name                = var.cospi_log_analytics_workspace_name
  resource_group_name = var.cospi_log_analytics_workspace_resource_group_name
}

data "azurerm_image" "app1_vm_image" {
  provider            = azurerm.shared
  name                = var.app1_vm_image_name
  resource_group_name = var.app1_vm_image_resource_group_name
}

data "template_file" "ps1" {
  template = file("win_initialise_data_disk.ps1")
}

data "template_file" "xml" {
  template = file("windows-config.xml.tpl")
}

data "azuread_service_principal" "encryptappsp" {
  display_name = var.encryptapp_service_principal_name
}

data "azuread_service_principal" "backupmanagementservicesp" {
  display_name = "Backup Management Service"
}

data "azuread_group" "cloudops_keyvault_admin" {
  name = var.cloudops_keyvault_admin
}

data "azuread_group" "client_keyvault_admin" {
  name = var.client_keyvault_admin
}