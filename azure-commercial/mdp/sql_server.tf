#SQL Server

resource "azurerm_mssql_server" "mdp_srv_mssql_server" {
  name                        = "srv-${var.location_acronym}-${var.application_acronym}-appintg-${var.environment_acronym}"
  resource_group_name         = module.mdp_rg_main.resource_group_name
  location                    = module.mdp_rg_main.resource_group_location
  version                     = "12.0"
  administrator_login         = "${var.application_acronym}sqladmin01"
  administrator_login_password= "${var.mdp_sql_admin_login_password}"
  minimum_tls_version         = "1.2"
  connection_policy           ="Default"
  #public_network_access_enabled = false
    azuread_administrator {
    login_username            = azuread_group.mdp_sql_appintg_admins.name
    object_id                 = azuread_group.mdp_sql_appintg_admins.object_id
  }

  identity {
      type = "SystemAssigned"
  }
    tags = var.tags
}

resource "azurerm_mssql_server_extended_auditing_policy" "srv_audit_policy" {
  server_id                 = azurerm_mssql_server.mdp_srv_mssql_server.id
  storage_endpoint          = module.mdpsa.primary_blob_endpoint
  retention_in_days         = 7
  depends_on                = [azurerm_role_assignment.sqlTostorage]#,azurerm_role_assignment.functionToSqlserver1,azurerm_role_assignment.functionToSqlserver2]
}

  resource "azurerm_mssql_database" "mdpsql_database" {
  name                 = "sql-${var.location_acronym}-${var.application_acronym}-appintg-${var.environment_acronym}"
  server_id            = azurerm_mssql_server.mdp_srv_mssql_server.id
  collation            = "SQL_Latin1_General_CP1_CI_AS"
  license_type         = "LicenseIncluded"
  max_size_gb          = "32"
  read_scale           = false
  sku_name             = "BC_Gen5_2"
  zone_redundant       = false
  storage_account_type = "GRS"

  threat_detection_policy {
    disabled_alerts            = []
    email_account_admins       = "Disabled"
    email_addresses            = []
    retention_days             = 0
    state                      = "Disabled"
  }

  tags = var.tags
}

resource "azurerm_sql_virtual_network_rule" "mdp_sql_vnet_appintg" {
  name                = "sql-vnet-appintg-rule"
  resource_group_name = module.mdp_rg_main.resource_group_name
  server_name         = azurerm_mssql_server.mdp_srv_mssql_server.name
  subnet_id           = module.appintgsubnet.subnet_id
}

resource "azurerm_sql_virtual_network_rule" "mdp_sql_vnet_pep" {
  name                = "sql-vnet-pep-rule"
  resource_group_name = module.mdp_rg_main.resource_group_name
  server_name         = azurerm_mssql_server.mdp_srv_mssql_server.name
  subnet_id           = module.mdp_subnet_pep.subnet_id
}


resource "azurerm_monitor_diagnostic_setting" "mdp_sqldb_diagnostics" {
  name                        = "mdp-sqldb-logs-${var.environment_acronym}"
  target_resource_id          = azurerm_mssql_database.mdpsql_database.id
  log_analytics_workspace_id  = data.azurerm_log_analytics_workspace.spoke_law.id

log {
    category = "Deadlocks"

    retention_policy {
      enabled = true
      days    = 0
    }
  }
  
  log {
    category = "Errors"

    retention_policy {
      enabled = true
      days    = 0
    }
  }

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
  category = "DevOpsOperationsAudit" 
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


  log {
    category = "SQLSecurityAuditEvents"

    retention_policy {
      enabled = true
      days    = 0
    }
  }

/*
  metric {
    category = "AllMetrics"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = true
    }
  }
*/

metric {
    category = "Basic"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = true
    }
  }
metric {
    category = "InstanceAndAppAdvanced"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = true
    }
  }  

metric {
    category = "WorkloadManagement"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = true
    }
  }  

}

/*
resource "azurerm_monitor_diagnostic_setting" "mdp_sqldb_CSM_Eventhub" {
    name                           = "mdp_sqldb_CSM_Eventhub-${var.environment_acronym}"
    target_resource_id             = azurerm_mssql_database.mdpsql_database.id
    eventhub_name                  = "insights-logs-paasdiag"
    eventhub_authorization_rule_id = "${var.DV_CSM_eventhub_authorization_rule_id}"

   log {
    category = "Deadlocks"

    retention_policy {
      enabled = true
      days    = 0
    }
  }

  log {
    category = "Errors"

    retention_policy {
      enabled = true
      days    = 0
    }
  }

  log {
    category = "SQLSecurityAuditEvents"

    retention_policy {
      enabled = true
      days    = 0
    }
  }


  metric {
    category = "AllMetrics"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = true
    }
  }
}
*/
