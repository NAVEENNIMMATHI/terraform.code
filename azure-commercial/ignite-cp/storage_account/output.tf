output "storage_account_name" {
  value = azurerm_storage_account.storage_account.name
}

output "primary_access_key" {
  value = azurerm_storage_account.storage_account.primary_access_key
}

output "primary_blob_endpoint" {
  value = azurerm_storage_account.storage_account.primary_blob_endpoint
}

output "id" {
  value = azurerm_storage_account.storage_account.id
}

output "primary_connection_string" {
  value = azurerm_storage_account.storage_account.primary_connection_string
}
output "secondary_connection_string" {
  value = azurerm_storage_account.storage_account.secondary_connection_string
}