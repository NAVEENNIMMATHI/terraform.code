resource "azurerm_sql_server" "FPI-SQL" {
  name                         = var.environment=="production" ? "co-p-fpi-kpmg-sql" : "srv-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name          = module.rgfpi.resource_group_name
  location                     = module.rgfpi.resource_group_location
  version                      = "12.0"
  administrator_login          = "fpisqladmin"
  administrator_login_password = var.sqlserver_password
  tags                         = var.tags
}

resource "azurerm_sql_virtual_network_rule" "sqlvnetrule" {
  name                         = "sql-vnet-rule"
  resource_group_name          = module.rgfpi.resource_group_name
  server_name                  = azurerm_sql_server.FPI-SQL.name
  subnet_id                    = azurerm_subnet.backend.id
}

resource "azurerm_sql_active_directory_administrator" "fpisqlserveractivedirectory" {
  server_name                  = azurerm_sql_server.FPI-SQL.name
  resource_group_name          = module.rgfpi.resource_group_name
  login                        = azuread_group.fpisqladmin.name
  tenant_id                    = data.azurerm_client_config.current.tenant_id
  object_id                    = azuread_group.fpisqladmin.object_id
}