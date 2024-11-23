data "azurerm_client_config" "current" {}
data "azurerm_subscription" "current" {}

data "terraform_remote_state" "spi" {
  backend = "azurerm"

  config = {
    storage_account_name = var.shared_state_storage_account_name
    container_name       = var.shared_state_storage_account_container_name
    key                  = var.shared_state_storage_account_blob_key_name
    access_key           = var.shared_state_storage_account_access_key
  }
}

data "azuread_service_principal" "MicrosoftAzureFrontdoor" {
  display_name = "Microsoft.Azure.Frontdoor"
}
data "azuread_group" "AADDCAdministrators" {
  name = var.keyvault_admin_group_name
}