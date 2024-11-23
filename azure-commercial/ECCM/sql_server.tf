resource "azurerm_mssql_server" "eccm_sqlserver" {
  name                             = "srv-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name              = module.eccm_rg.resource_group_name
  location                         = module.eccm_rg.resource_group_location
  version                          = "12.0"
  administrator_login              = "${var.application_acronym}admin"
  administrator_login_password     = "${var.eccm_sql_server_admin_password}"
  
  azuread_administrator {
    login_username = azuread_group.sql_contributors.name
    object_id      = azuread_group.sql_contributors.object_id
  }

  identity {
      type = "SystemAssigned"
  }
  minimum_tls_version           = "1.2"

  tags = var.tags
}

resource "azurerm_mssql_database" "eccm_sqldatabase" {
  name                        = "sql-${var.location_acronym}-${var.application_acronym}sqldb-${var.environment_acronym}"
  server_id                   = azurerm_mssql_server.eccm_sqlserver.id
  auto_pause_delay_in_minutes = 60
  max_size_gb                 = "32"
  min_capacity                = 0.5
  sku_name                    = "GP_S_Gen5_1"
  storage_account_type        = "Local"
  collation                   = "SQL_Latin1_General_CP1_CI_AS"
  zone_redundant              = false
  ledger_enabled              = false
  geo_backup_enabled          = false

  tags = var.tags
  lifecycle {
    ignore_changes = [
      geo_backup_enabled 
    ]
  }
}
