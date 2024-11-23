module "sqldatabase" {
  source                         = "../../modules/sql_database"
  sql_server_name                = module.sqlserver.sql_server_name
  resource_group_name            = module.apprg.resource_group_name
  resource_group_location        = module.apprg.resource_group_location
  sql_database_name              = "sql-${var.location_acronym}-${var.application_name}-${var.environment_acronym}"
  sql_database_edition           = var.sql_database_edition
  sql_database_performance_level = var.sql_database_performance_level
  tags                           = var.tags
  threat_detection_policy_state             = "Enabled"
  threat_detection_policy_storage_endpoint  = module.appsa.primary_blob_endpoint
  threat_detection_policy_access_key        = module.appsa.primary_access_key
  extended_auditing_policy_storage_endpoint = module.appsa.primary_blob_endpoint
  extended_auditing_policy_access_key       = module.appsa.primary_access_key
}

resource "azurerm_monitor_diagnostic_setting" "fpsqldatabase_diagnostics" {
  name               = "fastpathsqldb-logs"
  target_resource_id = module.sqldatabase.sql_database_id
  log_analytics_workspace_id  = data.azurerm_log_analytics_workspace.law.id

  log {
    category = "AutomaticTuning"
    enabled  = false

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  log {
    category = "Blocks"
    enabled  = false

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  log {
    category = "DatabaseWaitStatistics"
    enabled  = false

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  log {
    category = "Deadlocks"
    enabled  = false

  retention_policy {
    days    = 0
    enabled = false
  }
  }

  log {
    category = "DevOpsOperationsAudit"
    enabled  = false
    retention_policy {
      days    = 0
      enabled = false
    }
  }

  log {
    category = "Errors"
    enabled  = false

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  log {
    category = "QueryStoreRuntimeStatistics"
    enabled  = false

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  log {
    category = "QueryStoreWaitStatistics"
    enabled  = false

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  log {
    category = "SQLInsights"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = false
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

  log {
    category = "Timeouts"
    enabled  = false

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  metric {
    category = "Basic"
    enabled  = false

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  metric {
    category = "InstanceAndAppAdvanced"
    enabled  = false

    retention_policy {
      days    = 0
      enabled = false
    }
  }
  
  metric {
    category = "WorkloadManagement"
    enabled  = false

    retention_policy {
      days    = 0
      enabled = false
    }
  }

}