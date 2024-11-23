resource "azurerm_mssql_elasticpool" "elasticpool" {
  name                = "elp-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  server_name         = module.sql_server.sql_server_name
  max_size_gb         = 100
  
  sku {
    name     = "StandardPool"
    tier     = "Standard"
    capacity = 300
  }

  per_database_settings {
    min_capacity = 0
    max_capacity = 100
  }

  tags                = var.tags
}