resource "azurerm_automation_variable_string" "StorageAccountSubscriptionId" {
  name                    = "StorageAccountSubscriptionId"
  resource_group_name     = var.automation_account_resource_group_name
  automation_account_name = azurerm_automation_account.ama-use-dsc.name
  value                   = var.subscription_id
}

resource "azurerm_automation_variable_string" "StorageAccountRG" {
  name                    = "StorageAccountRG"
  resource_group_name     = var.automation_account_resource_group_name
  automation_account_name = azurerm_automation_account.ama-use-dsc.name
  value                   = var.automation_account_resource_group_name
}

resource "azurerm_automation_variable_string" "StorageAccountName" {
  name                    = "StorageAccountName"
  resource_group_name     = var.automation_account_resource_group_name
  automation_account_name = azurerm_automation_account.ama-use-dsc.name
  value                   = var.core_binary_storage_account_name
}