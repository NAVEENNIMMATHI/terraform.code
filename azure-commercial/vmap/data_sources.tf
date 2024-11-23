data "azurerm_client_config" "current" {}

data "azurerm_subscription" "current" {}

data "azuread_service_principal" "backupmanagementservicesp" {
  display_name = "Backup Management Service"
}

data "azurerm_app_service_environment" "app_ase" {
  name                = var.ase_name
  resource_group_name = var.ase_resource_group_name
}

data "azurerm_storage_account" "shared_ras" {
  name                = var.shared_state_storage_account.name
  resource_group_name = var.shared_state_storage_account.resource_group_name
}

data "terraform_remote_state" "shared" {
  backend = "azurerm"

  config = {
    storage_account_name = var.shared_state_storage_account.name
    container_name       = var.shared_state_storage_account.container_name
    key                  = var.shared_state_storage_account.blob_key_name
    access_key           = data.azurerm_storage_account.shared_ras.primary_access_key
  }
}

