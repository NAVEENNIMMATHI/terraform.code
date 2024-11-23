resource "azurerm_key_vault" "csp_key_vault" {
  
  name                        = "kvl-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  location                    = var.location
  resource_group_name         = upper("RGP-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}")
  enabled_for_disk_encryption = true

  sku_name            = "standard"
  tenant_id           = data.azurerm_client_config.current.tenant_id
  #enabled_for_disk_encryption = true
  enabled_for_template_deployment = true
  

  tags = var.tags

#  network_acls {
#    default_action = "Deny"
#    bypass         = "AzureServices"          
#  } 
}

resource "azurerm_monitor_diagnostic_setting" "csp_keyvault_diag" {
  name                       = "azurerm_key_vault.csp_key_vaul.name-diag"
  target_resource_id         = azurerm_key_vault.csp_key_vault.id
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
  key_vault_id = azurerm_key_vault.csp_key_vault.id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azuread_service_principal.defaultpipeline.object_id

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
}