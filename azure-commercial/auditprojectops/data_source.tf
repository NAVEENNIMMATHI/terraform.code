data "azurerm_subscription" "current" {}

data "azurerm_client_config" "current" {}

data "azuread_group" "co_service_accounts_group" {
  name = var.co_service_accounts_group_name
}
