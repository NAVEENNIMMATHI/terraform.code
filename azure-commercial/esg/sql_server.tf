resource "random_uuid" "sql_assignment_guid" {
}

module "mssql_server" {
  source = "../../modules/mssql_server"

  mssql_server_name                  = "mssqlsrv-${lower(var.location_acronym)}-${lower(var.application_acronym)}-${lower(var.environment_acronym)}"
  resource_group_name                = module.applicationrg.resource_group_name
  resource_group_location            = module.applicationrg.resource_group_location
  administrator_login_username       = "${lower(var.application_acronym)}admin01"
  administrator_login_password       = var.sql_server_admin_password
  mssql_ad_group_name                = azuread_group.sql_server_admins.name
  mssql_ad_group_object_name         = azuread_group.sql_server_admins.object_id
  audit_log_storage_account_id       = module.storage_account.id
  auditlog_storage_account_endpoint  = module.storage_account.primary_blob_endpoint
  mssql_database_name                = "sql-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  sql_database_count                 = 0
  sqlTostorage_assignment_name_guiid = random_uuid.sql_assignment_guid.result

  tags = var.tags
}

/*
resource "azurerm_mssql_elasticpool" "elasticpool" {
  name                = "${var.application_acronym}elasticpool${var.environment_acronym}"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  server_name         = module.mssql_server.sql_server_name

  max_size_gb = 244

  sku {
    name     = "GP_Gen5"
    tier     = "GeneralPurpose"
    family   = "Gen5"
    capacity = 24
  }

  per_database_settings {
    min_capacity = 0.25
    max_capacity = 4
  }
  depends_on = [azurerm_app_service.appservice_web]

  tags = var.tags
}
*/

resource "azurerm_sql_database" "sqldatabase" {
  name                = "ESG"
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location
  server_name         = module.mssql_server.sql_server_name
  #elastic_pool_name   = azurerm_mssql_elasticpool.elasticpool.name

  tags = var.tags
}