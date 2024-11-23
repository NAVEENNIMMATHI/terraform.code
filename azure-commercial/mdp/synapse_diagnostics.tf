
resource "azurerm_monitor_diagnostic_setting" "mdp_synapse_logging" {
  name                       = "synapse-logs"
  target_resource_id         = azurerm_synapse_workspace.mdpsynapse.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.spoke_law.id

  log {
    category = "GatewayApiRequests"                                
    enabled  = false

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  log {
    category = "SynapseRbacOperations"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = true
    }
  }
  log {
    category = "BuiltinSqlReqsEnded"
    enabled  = true

    retention_policy {
      days = 0
      enabled = true
    }
  }
  log {
    category = "IntegrationPipelineRuns"
    enabled  = true
  
  retention_policy {
    days    =  0
    enabled = false 
  }
}


log {
    category = "IntegrationActivityRuns"
    enabled  = true

    retention_policy {
      days = 0
      enabled = true
    }
  }

log {
    category = "IntegrationTriggerRuns"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = true
    }
  }

  log {
     category = "SQLSecurityAuditEvents" 
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
