data "azurerm_subscription" "current" {
}

data "terraform_remote_state" "shared" {
  backend = "azurerm"

  config = {
    resource_group_name  = var.shared_state_resource_group_name
    storage_account_name = var.shared_state_storage_account_name
    container_name       = "terraformstatecontainer"
    key                  = var.shared_state_storage_account_blob_key_name
    access_key           = var.shared_state_storage_account_access_key
  }
}

data "azuread_group" "cloudops_keyvault_admin" {
  name = var.environment_acronym == "pd" || var.environment_acronym == "uat" ? "CO-TerraformStorage-Admin" : "CO-Certificate-KeyVault"
}

data "azuread_group" "client_keyvault_admin" {
  name = var.client_keyvault_admin_name
}

data "azuread_service_principal" "cmbsdataexport" {
  display_name = "Data Export Service for Microsoft Dynamics 365"
}

data "azuread_service_principal" "backupmanagementservicesp" {
  display_name = "Backup Management Service"
}

data "azuread_service_principal" "ama-use-automation-runbook" {
  display_name = var.automation_sp_name
}