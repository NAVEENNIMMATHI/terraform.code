resource "azurerm_postgresql_server" "mathworks_Postgresql_server" {
  name                         = "pgs-${var.location}-${var.application_acronym}-${var.client}-${var.environment_acronym}"
  location                     = module.mathworks_rg_client.resource_group_location
  resource_group_name          = module.mathworks_rg_client.resource_group_name
  sku_name                     = var.mathworks_postgresql_sku_name
  storage_mb                   = var.mathworks_postgresql_storageprofile_storage_mb
  backup_retention_days        = var.mathworks_postgresql_storageprofile_backup_retention_days
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true
  administrator_login          = var.mathworks_postgresql_adminname
  administrator_login_password = var.mathworks_postgresql_adminpassword
  version                      = var.mathworks_postgresql_PostGresVersion
  ssl_enforcement_enabled      = false
  tags                         = var.tags
}

resource "azurerm_postgresql_database" "mathworks_Connect_Postgresql_db" {
  name                = "${var.mathworks_connect_postgresql_db_name}-${var.client}"
  resource_group_name = module.mathworks_rg_client.resource_group_name
  server_name         = azurerm_postgresql_server.mathworks_Postgresql_server.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}

resource "azurerm_postgresql_database" "mathworks_Connect_Postgresql_db_api" {
  name                = "${var.mathworks_connect_postgresql_db_api_name}-${var.client}"
  resource_group_name = module.mathworks_rg_client.resource_group_name
  server_name         = azurerm_postgresql_server.mathworks_Postgresql_server.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}

resource "azurerm_postgresql_database" "mathworks_Connect_Postgresql_db_config" {
  name                = "${var.mathworks_connect_postgresql_db_config_name}-${var.client}"
  resource_group_name = module.mathworks_rg_client.resource_group_name
  server_name         = azurerm_postgresql_server.mathworks_Postgresql_server.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}

resource "azurerm_postgresql_database" "mathworks_connect_postgresql_db_ui" {
  name                = "${var.mathworks_connect_postgresql_db_ui_name}-${var.client}"
  resource_group_name = module.mathworks_rg_client.resource_group_name
  server_name         = azurerm_postgresql_server.mathworks_Postgresql_server.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}
resource "azurerm_postgresql_database" "mathworks_connect_postgresql_db_content" {
  name                = "${var.mathworks_connect_postgresql_db_content_name}-${var.client}"
  resource_group_name = module.mathworks_rg_client.resource_group_name
  server_name         = azurerm_postgresql_server.mathworks_Postgresql_server.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}

output "FQDN_Postgresql" {
  value = azurerm_postgresql_server.mathworks_Postgresql_server.fqdn
}
output "Postgresql_DB_id" {
  value = azurerm_postgresql_database.mathworks_Connect_Postgresql_db.id
}

resource "azurerm_postgresql_virtual_network_rule" "mip_Postgresql_lms" {
  name                                 = "lms-vnet-rule"
  resource_group_name                  = module.mathworks_rg_client.resource_group_name
  server_name                          = azurerm_postgresql_server.mathworks_Postgresql_server.name
  subnet_id                            = module.subnet_license_manager.subnet_id
  ignore_missing_vnet_service_endpoint = true
}

resource "azurerm_postgresql_virtual_network_rule" "mip_Postgresql_aks" {
  name                                 = "aks-vnet-rule"
  resource_group_name                  = module.mathworks_rg_client.resource_group_name
  server_name                          = azurerm_postgresql_server.mathworks_Postgresql_server.name
  subnet_id                            = module.subnet_aks.subnet_id
  ignore_missing_vnet_service_endpoint = true
}


resource "azurerm_monitor_diagnostic_setting" "az_mip_postgresqlserver_diag" {
  name                       = "pgs-${var.location}-${var.application_acronym}-${var.client}-${var.environment_acronym}-diag"
  target_resource_id         =  azurerm_postgresql_server.mathworks_Postgresql_server.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.spoke_law.id
 
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
