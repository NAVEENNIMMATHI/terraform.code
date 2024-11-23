/*
module "sqlserver" {
  source                      = "../../modules/sql_server"
  sql_server_name             = "srv-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name         = module.cmbsrg.resource_group_name
  resource_group_location     = module.cmbsrg.resource_group_location
  sql_server_admin_username   = "${var.application_acronym}sqladmin01"
  sql_server_admin_password   = var.sqlserveradmin_password
  sqlserver_adgroup_name      = azuread_group.SQLAdmins.name
  tenant_id                   = var.tenant_id
  sqlserver_adgroup_object_id = azuread_group.SQLAdmins.object_id
  storage_account_info = {
         storage_endpoint = module.cmbssa.primary_blob_endpoint
         storage_account_access_key = module.cmbssa.primary_access_key
    }

  tags = var.tags
}
*/

resource "azurerm_mssql_server" "cmbs_srv_mssql_server" {
  name = "srv-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name         = module.cmbsrg.resource_group_name
  location     = module.cmbsrg.resource_group_location
  version = "12.0"
  administrator_login   = "${var.application_acronym}sqladmin01"
  administrator_login_password   = var.sqlserveradmin_password
    azuread_administrator {
    login_username = azuread_group.SQLAdmins.name
    object_id      = azuread_group.SQLAdmins.object_id
  }

  identity {
      type = "SystemAssigned"
  }
    tags = var.tags
}

resource "azurerm_mssql_server_extended_auditing_policy" "srv_audit_policy" {
  server_id = azurerm_mssql_server.cmbs_srv_mssql_server.id
  storage_endpoint = module.cmbssa.primary_blob_endpoint
  retention_in_days = 7
  depends_on = [azurerm_role_assignment.sqlTostorage]#,azurerm_role_assignment.functionToSqlserver1,azurerm_role_assignment.functionToSqlserver2]
}


resource "azurerm_sql_database" "cmbssql_database" {
  name                             = "sql-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name              = module.cmbsrg.resource_group_name
  location                         = module.cmbsrg.resource_group_location
  server_name                      = azurerm_mssql_server.cmbs_srv_mssql_server.name
  edition                          = var.dbedition
  requested_service_objective_name = var.requested_service_objective_name

  threat_detection_policy {
    disabled_alerts      = []
    email_account_admins = "Disabled"
    email_addresses      = []
    retention_days       = 0
    state                = "Enabled"
    use_server_default   = "Disabled"
  }

  tags = var.tags
}