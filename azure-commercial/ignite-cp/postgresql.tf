resource "azurerm_postgresql_server" "ignite_Postgresql_server" {
  name                  = "pgs-${var.location}-${var.project_acronym}-${var.engagement_name}${var.separator}${var.environment}"
  location              = module.ignite_rg.resource_group_location
  resource_group_name   = module.ignite_rg.resource_group_name
  sku_name              = var.ignite_postgresql_sku_name


  #storage_profile {
      storage_mb            = var.ignite_postgresql_storageprofile_storage_mb
      backup_retention_days = var.ignite_postgresql_storageprofile_backup_retention_days
      geo_redundant_backup_enabled  = var.ignite_postgresql_storageprofile_geo_redundant_backup
      auto_grow_enabled             = false
      public_network_access_enabled    = false
 # }

  threat_detection_policy {
        
        email_addresses      = ["go-fmmanagedservices@kpmg.com"]
        email_account_admins = false
        enabled              = true
        retention_days       = 0

  }

  administrator_login          = var.ignite_postgresql_adminname
  administrator_login_password = var.ignite_postgresql_adminpassword
  version                      = var.ignite_postgresql_PostGresVersion
  ssl_enforcement_enabled      = true
#  ssl_minimal_tls_version_enforced = "  TLS1_2"
  
  tags = var.tags
}
/*
resource "azurerm_postgresql_virtual_network_rule" "ignite_Postgresql_server" {
  name                                 = "postgresql-vnet-rule"
  resource_group_name                  = module.ignite_rg.resource_group_name
  server_name                          = azurerm_postgresql_server.ignite_Postgresql_server.name
  subnet_id                            = module.ignite_aks_subnet.subnet_id
  ignore_missing_vnet_service_endpoint = true
  depends_on                           = [module.ignite_aks_subnet.subnet_id]
}
*/

resource "azurerm_postgresql_database" "ignite_Connect_Postgresql_db" {
  name                = var.ignite_connect_postgresql_db_name
  resource_group_name = module.ignite_rg.resource_group_name
  server_name         = azurerm_postgresql_server.ignite_Postgresql_server.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}

resource "azurerm_postgresql_database" "ignite_Connect_Postgresql_db_api" {
  name                = var.ignite_connect_postgresql_db_api_name
  resource_group_name = module.ignite_rg.resource_group_name
  server_name         = azurerm_postgresql_server.ignite_Postgresql_server.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}

resource "azurerm_postgresql_database" "ignite_Connect_Postgresql_db_config" {
  name                = var.ignite_connect_postgresql_db_config_name
  resource_group_name = module.ignite_rg.resource_group_name
  server_name         = azurerm_postgresql_server.ignite_Postgresql_server.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}

resource "azurerm_postgresql_database" "ignite_connect_postgresql_db_ui" {
  name                = var.ignite_connect_postgresql_db_ui_name
  resource_group_name = module.ignite_rg.resource_group_name
  server_name         = azurerm_postgresql_server.ignite_Postgresql_server.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}
resource "azurerm_postgresql_database" "ignite_connect_postgresql_db_content" {
  name                = var.ignite_connect_postgresql_db_content_name
  resource_group_name = module.ignite_rg.resource_group_name
  server_name         = azurerm_postgresql_server.ignite_Postgresql_server.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}

resource "azurerm_postgresql_database" "drgs_connect_postgresql_db" {
  name                = var.drgs_connect_postgresql_db_name
  resource_group_name = module.ignite_rg.resource_group_name
  server_name         = azurerm_postgresql_server.ignite_Postgresql_server.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}

output "FQDN_Postgresql" {
  value = azurerm_postgresql_server.ignite_Postgresql_server.fqdn
}
output "Postgresql_DB_id" {
  value = azurerm_postgresql_database.ignite_Connect_Postgresql_db.id
}

resource "azurerm_monitor_diagnostic_setting" "az_postgresqlserver_diag" {
  name                       = "pgs-${var.location}-${var.project_acronym}-${var.engagement_name}${var.separator}${var.environment}-diag"
  target_resource_id         =  azurerm_postgresql_server.ignite_Postgresql_server.id
 log_analytics_workspace_id = data.azurerm_log_analytics_workspace.log_analytics_workspace.id
 
  log {
    category = "PostgreSQLLogs"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  log {
    category = "QueryStoreRuntimeStatistics"
    enabled  = true
    
    retention_policy {
      enabled = false
    }
  }



  log {
    category = "QueryStoreWaitStatistics"
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



resource "azurerm_postgresql_active_directory_administrator" "ignite_postgresql_active_directory_administrator" {
  server_name         = azurerm_postgresql_server.ignite_Postgresql_server.name
  resource_group_name = module.ignite_rg.resource_group_name
  tenant_id           = data.azurerm_client_config.current.tenant_id

  login = azuread_group.aks_cluster_admin_group.name
  object_id = azuread_group.aks_cluster_admin_group.object_id
}