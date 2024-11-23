#Private Endpoint for Search Service
resource "azurerm_private_endpoint" "search_endpoint" {
  name                = lower("pe-search-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}")
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  subnet_id           = module.privatelinksubnet.subnet_id
  private_service_connection {
    name                           = lower("pe-search-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}")
    private_connection_resource_id = azurerm_search_service.kipcognitivesearch.id
    subresource_names              = ["searchService"]
    is_manual_connection           = false
  }
  tags               = var.tags
}


#Private Endpoint for SQL Server
resource "azurerm_private_endpoint" "sql_server_endpoint" {
  name                = lower("pe-sql-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}")
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  subnet_id           = module.privatelinksubnet.subnet_id

  private_dns_zone_group {
    name                 = "database"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.sql.id]
  }

  private_service_connection {
    name                           = lower("pe-sql-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}")
    private_connection_resource_id = module.sqlserver.sql_server_id
    subresource_names              = ["sqlServer"]
    is_manual_connection           = false
  }
  tags               = var.tags
}