#SQL Server

resource "azurerm_mssql_server" "impact_srv_mssql_server" {
  name                          = "srv-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name           = module.impact_rg.resource_group_name
  location                      = module.impact_rg.resource_group_location
  version                       = "12.0"
  administrator_login           = "${lower(var.application_acronym)}admin01"
  administrator_login_password  = var.sql_server_admin_password
  minimum_tls_version           = "1.2"
  connection_policy             = "Default"
  public_network_access_enabled = false

  azuread_administrator {
    login_username = azuread_group.sql_admins.name
    object_id      = azuread_group.sql_admins.object_id
  }

  identity {
    type = "SystemAssigned"
  }
  tags = var.tags
}

resource "azurerm_mssql_elasticpool" "impact_db_elasticpool" {
  name                = "dbep-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name = module.impact_rg.resource_group_name
  location            = module.impact_rg.resource_group_location
  server_name         = azurerm_mssql_server.impact_srv_mssql_server.name
  license_type        = "LicenseIncluded"
  max_size_gb         = 5

  sku {
    name     = "GP_Gen5"
    tier     = "GeneralPurpose"
    family   = "Gen5"
    capacity = 4
  }

  per_database_settings {
    min_capacity = 0
    max_capacity = 4
  }
}

resource "azurerm_mssql_database" "mdpsql_database" {
  name      = "sql-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  server_id = azurerm_mssql_server.impact_srv_mssql_server.id
  collation = "SQL_Latin1_General_CP1_CI_AS"
  max_size_gb                 = "32"
  read_scale                  = false
  min_capacity                = "1"
  auto_pause_delay_in_minutes = "-1"
  sku_name                    = "GP_S_Gen5_1"
  zone_redundant              = false
  storage_account_type        = "GRS"

  threat_detection_policy {
    disabled_alerts      = []
    email_account_admins = "Disabled"
    email_addresses      = []
    retention_days       = 1
    state                = "Disabled"
  }

  tags = var.tags
}

# Clients SQL DB
resource "azurerm_mssql_database" "mdpsql_app_database" {
  for_each                    = toset(var.impact_multi_tenant_clients.clients)
  name                        = "${var.application_acronym}-${lower(each.key)}-app-db"
  server_id                   = azurerm_mssql_server.impact_srv_mssql_server.id
  elastic_pool_id             = azurerm_mssql_elasticpool.impact_db_elasticpool.id
  collation                   = "SQL_Latin1_General_CP1_CI_AS"
  max_size_gb                 = "5"
  read_scale                  = false
  min_capacity                = "1"
  auto_pause_delay_in_minutes = "-1"
  sku_name                    = "ElasticPool"
  zone_redundant              = false
  storage_account_type        = "GRS"

  threat_detection_policy {
    disabled_alerts      = []
    email_account_admins = "Disabled"
    email_addresses      = []
    retention_days       = 1
    state                = "Disabled"
  }

  tags = var.tags
}
