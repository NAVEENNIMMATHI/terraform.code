data "azurerm_subscription" "current" {}

data "azurerm_client_config" "current" {}

#query to shared services
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

data "azurerm_firewall" "firewall" {
  name                = var.firewall_network_name
  resource_group_name = var.firewall_network_rg_name
  provider            = azurerm.firewall
}