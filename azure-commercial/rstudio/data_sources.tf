data "azuread_service_principal" "backupmanagementservicesp" {
  display_name = var.backupmanagementservice_service_principal_name
}

data "azuread_service_principal" "encryptappsp" {
  display_name = var.encryptapp_service_principal_name
}
data "azuread_service_principal" "keyvaultsp" {
  display_name = var.keyvault_service_principal_name
}

data "azuread_group" "service_account_group" {
  name = "CO-ServiceAccounts"
}

data "azuread_group" "support_team_group" {  
  name = var.support_team_group
}

data "azurerm_client_config" "current" {
}

data "azurerm_key_vault" "spoke_da_common" {
  name                = var.spoke_da_keyvault_name
  resource_group_name = var.spoke_da_keyvault_resourcegroup
}

data "azurerm_virtual_machine" "spi_app_vm" {
  name                = var.spi_app_vm_name
  resource_group_name = var.spi_resourcegroup
}

data "azurerm_virtual_machine" "spi_user_vm" {
  name                = var.spi_user_vm_name
  resource_group_name = var.spi_resourcegroup
}

provider "azurerm" {
  alias           = "core"
  subscription_id = var.core_subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  features {}
}

data "azurerm_public_ip" "core_aks" {
  provider            = azurerm.core
  name                = var.core_aks_pip_name
  resource_group_name = var.core_aks_pip_resource_group_name
}
