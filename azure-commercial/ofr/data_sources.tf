data "azurerm_client_config" "current" {
}

data "azurerm_subscription" "current" {
}

output "subscription_id" {
  value = data.azurerm_subscription.current.subscription_id
}

data "azuread_service_principal" "backup_management_service" {
  display_name = "Backup Management Service"
}

data "azuread_service_principal" "ato_ofr" {
  display_name = "ATO OFR"
}

data "azuread_service_principal" "build_agent" {
  display_name = var.build_agent_spn
}

data "azuread_group" "ofr_users" {
  name = "CO-OFRUsers"
}

data "azuread_group" "all_admins" {
  name = var.environment_acronym == "dev" ? "All Admins" : "AAD DC Administrators"
}

# Data sources being removed until the certificate items can be fixed for the app service.

# data "azurerm_key_vault" "core" {
#   name                = "kvl-use-core-c72acede"
#   resource_group_name = "RGP-USE-CORE-DEV"
# }

# data "azurerm_key_vault_secret" "core" {
#   name         = "ofrdev-kpmgcloudops-com-pfx"
#   key_vault_id = data.azurerm_key_vault.core.id
# }