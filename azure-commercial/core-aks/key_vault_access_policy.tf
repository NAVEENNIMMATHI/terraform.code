resource "azurerm_key_vault_access_policy" "artifactory" {
  count        = 1
  key_vault_id = data.azurerm_key_vault.core.id
  tenant_id    = var.tenant_id
  object_id    = azurerm_user_assigned_identity.artifactory[0].principal_id

  certificate_permissions = [
    "Get",
  ]

  secret_permissions = [
    "Get",
  ]
}

resource "azurerm_key_vault_access_policy" "cloudockit" {
  count        = 1
  key_vault_id = data.azurerm_key_vault.core.id
  tenant_id    = var.tenant_id
  object_id    = azurerm_user_assigned_identity.cloudockit[0].principal_id

  certificate_permissions = [
    "Get",
  ]

  secret_permissions = [
    "Get",
  ]
}

resource "azurerm_key_vault_access_policy" "devopsagent" {
  count = 1
  key_vault_id = data.azurerm_key_vault.core.id
  tenant_id    = var.tenant_id
  object_id    = azurerm_user_assigned_identity.devopsagent[0].principal_id

  secret_permissions = [
    "Get",
  ]
}