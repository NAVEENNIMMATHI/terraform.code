output "key_vault_id" {
  value = azurerm_key_vault.this.id
}
output "key_vault_key_id" {
  value = azurerm_key_vault_key.diskencrypt.id
}