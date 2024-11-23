
resource "azurerm_key_vault" "impact_key_vault" {

  name                        = "kvl-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  location                    = module.impact_rg.resource_group_location
  resource_group_name         = module.impact_rg.resource_group_name
  enabled_for_disk_encryption = true

  sku_name                        = "standard"
  tenant_id                       = data.azurerm_client_config.current.tenant_id
  enabled_for_template_deployment = true
  # soft_delete_enabled             = true
  purge_protection_enabled        = true



  tags = var.tags

  network_acls {
    default_action             = "Deny"
    bypass                     = "AzureServices"
    ip_rules                   = []
    virtual_network_subnet_ids = [module.impact_pep_subnet.subnet_id]
  }
}


resource "azurerm_monitor_diagnostic_setting" "impact_keyvault_diag" {
  name                       = "azurerm_key_vault.impact_key_vaul.name-diag"
  target_resource_id         = azurerm_key_vault.impact_key_vault.id
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
      enabled = false
    }
  }
}

resource "azurerm_key_vault_access_policy" "spn_access" {
  key_vault_id = azurerm_key_vault.impact_key_vault.id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azuread_service_principal.defaultpipeline.object_id

  key_permissions = [
    "Get",
    "List",
    # "Update",
    # "Create",
    # "Import",
    # "Delete",
    # "Recover",
    # "Backup",
    # "Restore",
  ]

  secret_permissions = [
    "Get",
    "List",
    # "Set",
    # "Delete",
    # "Recover",
    # "Backup",
    # "Restore",
  ]

  certificate_permissions = [
    "Get",
    "List",
    # "Update",
    # "Create",
    # "Import",
    # "Delete",
    # "Recover",
    # "Backup",
    # "Restore",
    # "ManageContacts",
    # "ManageIssuers",
    # "GetIssuers",
    # "ListIssuers",
    # "SetIssuers",
    # "DeleteIssuers",
  ]
}

resource "azurerm_key_vault_access_policy" "synapse" {
  key_vault_id = azurerm_key_vault.impact_key_vault.id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = azurerm_synapse_workspace.impact_synapse.identity.0.principal_id

  key_permissions = []

  secret_permissions = [
    "Get",
    "List",
  ]
}

resource "azurerm_key_vault_access_policy" "sql" {
  key_vault_id = azurerm_key_vault.impact_key_vault.id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = azurerm_mssql_server.impact_srv_mssql_server.identity.0.principal_id

  key_permissions = [
    "Get",
    "List",
  ]

  secret_permissions = [
    "Get",
    "List",
  ]
}
