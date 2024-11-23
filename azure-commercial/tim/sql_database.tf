resource "azurerm_sql_database" "this" {
  name                = "sql-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name = module.timrg.resource_group_name
  location            = module.timrg.resource_group_location
  server_name         = module.sqlserver.sql_server_name
  tags                = var.tags
}