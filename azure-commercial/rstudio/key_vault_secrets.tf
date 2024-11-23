module "gurobi_mongodb_password" {
  source = "../../modules/key_vault_secret"

  name        = "gurobi-mongodb-database-user-password"
  keyvault_id = azurerm_key_vault.rstudio_key_vault_local.id
  value       = var.mongodb_user_password
  tags        = var.tags
}
