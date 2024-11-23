resource "azurerm_monitor_diagnostic_setting" "az_acr_diag" {
  name                       = "kuseigniteacr${var.engagement_name}${var.environment_acronym}-diag"
  target_resource_id         = azurerm_container_registry.ignitecp_acr.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.log_analytics_workspace.id


   log {
    category = "ContainerRegistryRepositoryEvents"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  log {
    category = "ContainerRegistryLoginEvents"
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

resource "azurerm_monitor_diagnostic_setting" "kvl_diag" {
  name                       = "kvl-${var.location}-${var.project_acronym}-${var.engagement_name}${var.separator}${var.environment}-diag"
  target_resource_id         = azurerm_key_vault.ignite_key_vault.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.log_analytics_workspace.id
  log_analytics_destination_type = "AzureDiagnostics"

log {
    category = "AuditEvent"
    enabled  = true

    retention_policy {
      enabled = true
      days    = 365
    }
  }

log {
    category = "AzurePolicyEvaluationDetails" 
    enabled  = false 

    retention_policy {
        days    = 0 
        enabled = false
        }
  }


  metric {
    category = "AllMetrics"
    enabled  = false

    retention_policy {
      days    = 0
      enabled = false
    }
  }

}

resource "azurerm_monitor_diagnostic_setting" "stg_diag" {
  name                       = "sto${var.location}${var.project_acronym}${var.engagement_name}${var.environment}-diag"
  target_resource_id         = module.ignite_stg.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.log_analytics_workspace.id
 

   metric {
     category = "Transaction"

     retention_policy {
       enabled = false
     }
   }
    lifecycle {
     ignore_changes = [
       metric
     ]
   }

}


