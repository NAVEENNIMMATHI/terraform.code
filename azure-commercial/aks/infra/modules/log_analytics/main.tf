resource "azurerm_log_analytics_workspace" "law" {
  name                = var.log_analytics_workspace
  location            = var.location
  resource_group_name = var.resource_group
  # sku                 = var.sku
  # retention_in_days   = var.retention_in_days
}

resource "azurerm_storage_account" "storage" {
    name = var.storage_name
    resource_group_name = var.resource_group
    location = var.location
    account_kind = var.account_kind
    account_tier = var.account_tier
    account_replication_type = var.account_replication_type
}

resource "azurerm_log_analytics_linked_storage_account" "law_storage" {
  data_source_type      = var.data_source_type 
  resource_group_name   = var.resource_group
  workspace_resource_id = azurerm_log_analytics_workspace.law.id
  storage_account_ids   = [azurerm_storage_account.storage.id]

  depends_on = [
    azurerm_storage_account.storage,
    azurerm_log_analytics_workspace.law
  ]
}