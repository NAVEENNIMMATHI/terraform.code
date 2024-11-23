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

resource "azurerm_sql_database" "sqldatabase" {
  name                              = "RRI_Master"
  resource_group_name               = module.applicationrg.resource_group_name
  location                          = module.applicationrg.resource_group_location
  server_name                       = module.mssql_server.sql_server_name
  edition                           = var.sql_edition
  requested_service_objective_name  = var.sql_size

  tags = var.tags
}

resource "azurerm_sql_database" "sqldatabase_engagement" {
  name                              = "RRI_Engagement"
  resource_group_name               = module.applicationrg.resource_group_name
  location                          = module.applicationrg.resource_group_location
  server_name                       = module.mssql_server.sql_server_name
  edition                           = var.sql_edition
  requested_service_objective_name  = var.sql_size

  tags = var.tags
}