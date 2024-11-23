#SQL Server
/*
resource "azurerm_mssql_server" "geospatial_mssql_server" {
  name                          = "srv-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name           = module.geospatial_rg.resource_group_name
  location                      = module.geospatial_rg.resource_group_location
  version                       = "12.0"
  administrator_login           = "${lower(var.application_acronym)}admin01"
  administrator_login_password  = var.sql_server_admin_password
  minimum_tls_version           = "1.2"
  connection_policy             = "Default"
  #public_network_access_enabled = false
  azuread_administrator {
    login_username = azuread_group.sql_admins.display_name
    object_id      = azuread_group.sql_admins.object_id
  }
  identity {
    type = "SystemAssigned"
  }
  tags = var.tags
}
resource "azurerm_mssql_server_extended_auditing_policy" "srv_audit_policy" {
  server_id                 = azurerm_mssql_server.geospatial_mssql_server.id
  storage_endpoint          = data.azurerm_storage_account.sql_policy.primary_blob_endpoint
  retention_in_days         = 7
  depends_on                = [azurerm_role_assignment.sqlTostorage]#,azurerm_role_assignment.functionToSqlserver1,azurerm_role_assignment.functionToSqlserver2]
}

resource "azurerm_mssql_database" "geosql_database" {
  name      = "sql-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  server_id = azurerm_mssql_server.geospatial_mssql_server.id
  collation = "SQL_Latin1_General_CP1_CI_AS"
  #license_type         = "LicenseIncluded"
  max_size_gb                 = "32"
  read_scale                  = false
  min_capacity                = "1"
  auto_pause_delay_in_minutes = "-1"
  sku_name                    = "GP_S_Gen5_2"
  zone_redundant              = false
  storage_account_type        = "Geo"
  threat_detection_policy {
    disabled_alerts      = []
    email_account_admins = "Disabled"
    email_addresses      = []
    retention_days       = 1
    state                = "Disabled"
  }

  tags = var.tags
}

resource "azurerm_mssql_virtual_network_rule" "arcgis_db_vnet_aks" {
  name                = "sql-vnet-aks-rule"
  server_id           = azurerm_mssql_server.geospatial_mssql_server.id
  subnet_id           = module.geospatial_aks_subnet.subnet_id
}

resource "azurerm_mssql_virtual_network_rule" "arcgis_db_vnet_pep" {
  name                = "sql-vnet-pep-rule"
  server_id           = azurerm_mssql_server.geospatial_mssql_server.id
  subnet_id           = module.geospatial_pep_subnet.subnet_id
}

resource "azurerm_mssql_virtual_network_rule" "arcgis_db_vnet_sharedda" {
  name                = "sql-vnet-sharedda-rule"
  server_id           = azurerm_mssql_server.geospatial_mssql_server.id
  subnet_id           = data.azurerm_subnet.arcgis_pbi_subnet.id
}


resource "azurerm_monitor_diagnostic_setting" "arcgis_sqldb_diagnostics" {
  name                        = "sql-${var.location_acronym}-${var.application_acronym}-diag-${var.environment_acronym}"
  target_resource_id          = azurerm_mssql_database.geosql_database.id
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
*/