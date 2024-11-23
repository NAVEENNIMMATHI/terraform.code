data "azurerm_client_config" "current" {}
data "azurerm_subscription" "current" {}

data "terraform_remote_state" "shared" {
  backend = "azurerm"

  config = {
    resource_group_name  = var.shared_state_resource_group_name
    storage_account_name = var.shared_state_storage_account_name
    container_name       = var.shared_state_storage_account_container_name
    key                  = var.shared_state_storage_account_blob_key_name
    access_key           = var.shared_state_storage_account_access_key
  }
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
data "azuread_service_principal" "fun_usc_cfr_dv_slot_qa" {
  count = var.restrict_gateway_endpoint == "true" ? 0 : 1

  display_name = var.fun_usc_cfr_dv_slot_qa
}
data "azuread_service_principal" "spn_devops_change_frame_app_service" {
  count = var.restrict_gateway_endpoint == "true" ? 0 : 1

  display_name = var.spn_devops_change_frame_app_service
}



