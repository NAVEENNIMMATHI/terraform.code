
resource "azurerm_key_vault" "eccm_key_vault" {

  name                        = "kvl-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  location                    = module.eccm_rg.resource_group_location
  resource_group_name         = module.eccm_rg.resource_group_name
  enabled_for_disk_encryption = false

  sku_name                        = "standard"
  tenant_id                       = data.azurerm_client_config.current.tenant_id
  enabled_for_template_deployment = true
  #soft_delete_enabled             = true
  soft_delete_retention_days      = 90
  purge_protection_enabled        = false

  tags = var.tags
}

resource "azurerm_key_vault_access_policy" "eccm_lap-kvl-access" {
  key_vault_id = azurerm_key_vault.eccm_key_vault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_logic_app_standard.eccm_logic_app.identity.0.principal_id

  certificate_permissions = [
    "Get",
    "List",
    "Update",
    "Create",
    "Import",
    "Delete",
    "Recover",
    "Backup",
    "Restore",
    "ManageContacts",
    "ManageIssuers",
    "GetIssuers",
    "ListIssuers",
    "SetIssuers",
    "DeleteIssuers",
  ]

  key_permissions = [
    "Get",
    "List",
    "Update",
    "Create",
    "Import",
    "Delete",
    "Recover",
    "Backup",
    "Restore",
    "Purge"
  ]

  secret_permissions = [
    "Get",
    "List",
    "Set",
    "Delete",
    "Recover",
    "Backup",
    "Restore",
  ]
}

resource "azurerm_monitor_diagnostic_setting" "eccm_keyvault_diagnostic" {
  name                       = "azurerm_key_vault.eccm_key_vaul.name-diag"
  target_resource_id         = azurerm_key_vault.eccm_key_vault.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.spoke_law.id

  log {
    category = "AuditEvent"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = true
    }
  }
}

resource "azurerm_key_vault_access_policy" "sql" {
  key_vault_id = azurerm_key_vault.eccm_key_vault.id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = azurerm_mssql_server.eccm_sqlserver.identity.0.principal_id

  key_permissions = []

  secret_permissions = [
    "Get",
    "List",
  ]
}


resource "azurerm_key_vault_access_policy" "dev_spn" {
  key_vault_id = azurerm_key_vault.eccm_key_vault.id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = var.dev_spn

  key_permissions = []

  secret_permissions = [
    "Get",
    "List",
    "Set",
    "Delete",
    "Recover",
    "Backup",
    "Restore",
  ]
}