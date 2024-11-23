data "azurerm_client_config" "current" {}
data "azurerm_subscription" "current" {}

data "azuread_group" "ServiceAccounts" {
  name = var.ServiceAccounts
}
data "azuread_group" "ServiceAccountskpmgllp" {

count = var.restrict_gateway_endpoint == "true" ? 1 : 0
name = var.ServiceAccountsllp
}

data "azuread_service_principal" "backupmanagementservicesp" {
  display_name = "Backup Management Service"
}
data "azuread_service_principal" "encryptApp" {
  display_name = var.encryptapp_sp_name
}
data "azuread_group" "cloudops_keyvault_admin" {
  name = var.cloudops_keyvault_admin_group_name
}

data "azuread_group" "client_keyvault_admin" {
  name = var.client_keyvault_admin_group_name
}

# Special built-in application that exists in all Azure tenants
data "azuread_service_principal" "key_vault" {
  application_id = "cfa8b339-82a2-471a-a3c9-0fc0be7a4093"
}
