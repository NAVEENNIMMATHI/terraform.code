resource "azurerm_mssql_elasticpool" "fpi-sql-pool" {
  name                = var.environment == "production" ? "fpi-sql-pool" : "elp-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name = module.rgfpi.resource_group_name
  location            = module.rgfpi.resource_group_location
  server_name         = azurerm_sql_server.FPI-SQL.name
  max_size_gb         = var.ep_max_size_gb
  license_type        = "LicenseIncluded"
  tags                = var.tags

  sku {
    name              = var.ep_sku_name
    tier              = var.ep_sku_tier
    family            = var.ep_sku_family
    capacity          = var.ep_sku_capacity
  }

  per_database_settings {
    min_capacity      = var.ep_per_database_settings_min_capacity
    max_capacity      = var.ep_per_database_settings_max_capacity
  }

  depends_on          = [azurerm_sql_virtual_network_rule.sqlvnetrule]
}

resource "azurerm_mssql_elasticpool" "fpi_sql_pool_reserved" {
  name                = var.environment == "production" ? "fpi-sql-pool2" : "elp-${var.location_acronym}-${var.application_acronym}-pool2-${var.environment_acronym}"
  resource_group_name = module.rgfpi.resource_group_name
  location            = module.rgfpi.resource_group_location
  server_name         = azurerm_sql_server.FPI-SQL.name
  max_size_gb         = var.ep_max_size_gb2
  license_type        = "LicenseIncluded"
  count               = var.sql_serverPool2_count
  tags                = var.tags

  sku {
    name              = var.ep_sku_name
    tier              = var.ep_sku_tier
    family            = var.ep_sku_family
    capacity          = var.ep_sku_capacity2
  }

  per_database_settings {
    min_capacity      = var.ep_per_database_settings_min_capacity
    max_capacity      = var.ep_per_database_settings_max_capacity2
  }

  depends_on          = [azurerm_mssql_elasticpool.fpi-sql-pool]
}

resource "azurerm_mssql_elasticpool" "fpi_sql_pool_reserved_lower_capacity" {
  name                = var.environment == "production" ? "fpi-sql-pool${count.index + 3}" : "elp-${var.location_acronym}-${var.application_acronym}-pool${count.index + 3}-${var.environment_acronym}"
  resource_group_name = module.rgfpi.resource_group_name
  location            = module.rgfpi.resource_group_location
  server_name         = azurerm_sql_server.FPI-SQL.name
  max_size_gb         = "512"
  license_type        = "LicenseIncluded"
  count               = var.sql_serverPool_count
  tags                = var.tags

  sku {
    name              = var.ep_sku_name
    tier              = var.ep_sku_tier
    family            = var.ep_sku_family
    capacity          = var.ep_sku_capacity3
  }

  per_database_settings {
    min_capacity      = var.ep_per_database_settings_min_capacity
    max_capacity      = var.ep_per_database_settings_max_capacity3
  }

  depends_on          = [azurerm_mssql_elasticpool.fpi_sql_pool_reserved]
}

#############################################
# Capturing Elastic Pools that were created #
# manually in Production. Naming starts at  #
# 6 since "fpi-sql-pool5" did not exist in  #
# Production at the time of this activity.  #
#############################################

resource "azurerm_mssql_elasticpool" "fpi_sql_pool_reserved_expansion" {
  name                = var.environment == "production" ? "fpi-sql-pool${count.index + 6}" : "elp-${var.location_acronym}-${var.application_acronym}-pool${count.index + 6}-${var.environment_acronym}"
  resource_group_name = module.rgfpi.resource_group_name
  location            = module.rgfpi.resource_group_location
  server_name         = azurerm_sql_server.FPI-SQL.name
  max_size_gb         = var.ep_max_size_gb2
  license_type        = "LicenseIncluded"
  count               = var.sql_serverPool_expansion_count
  tags                = var.tags

  sku {
    name              = var.ep_sku_name
    tier              = var.ep_sku_tier
    family            = var.ep_sku_family
    capacity          = var.ep_sku_capacity2
  }

  per_database_settings {
    min_capacity      = var.ep_per_database_settings_min_capacity
    max_capacity      = var.ep_per_database_settings_max_capacity2
  }

  depends_on          = [azurerm_mssql_elasticpool.fpi_sql_pool_reserved_lower_capacity]
}