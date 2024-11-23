data "azurerm_client_config" "current" {}
data "azurerm_subscription" "current" {}
data "azuread_service_principal" "backupmanagementservicesp" {
  display_name = "Backup Management Service"
}
data "azuread_service_principal" "azuredatabricks" {
  display_name = "AzureDatabricks"
}
