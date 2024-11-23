resource "random_password" "sql_admin" {
  length           = 16
  special          = true
  override_special = "_%@"
}

resource "random_uuid" "sql_assignment_guid" {
}

module "sqlserver" {
  source                             = "../../modules12/mssql_server"
  mssql_server_name                  = lower("mssqlsrv-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}")
  resource_group_name                = module.vmap_resource_group.resource_group_name
  resource_group_location            = module.vmap_resource_group.resource_group_location
  administrator_login_username       = lower("${var.application_acronym}sqladmin01")
  administrator_login_password       = random_password.sql_admin.result
  mssql_ad_group_name                = azuread_group.sql_admins.name
  mssql_ad_group_object_name         = azuread_group.sql_admins.object_id
  audit_log_storage_account_id       = module.storage_account.id
  auditlog_storage_account_endpoint  = module.storage_account.primary_blob_endpoint
  mssql_database_name                = "sql-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  sql_database_count                 = 0
  sqlTostorage_assignment_name_guiid = random_uuid.sql_assignment_guid.result
  tags                               = var.tags
}