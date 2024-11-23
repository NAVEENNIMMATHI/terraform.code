
module "mssql_server_abla" {
    source                              = "../../modules12/mssql_server"
    mssql_server_name                   = "mssqlsrv-${lower(var.location_acronym)}-${lower(var.application_acronym)}-${lower(var.environment_acronym)}"
    resource_group_name                 = module.applicationrg.resource_group_name
    resource_group_location             = module.applicationrg.resource_group_location
    administrator_login_username        = "${lower(var.application_acronym)}admin01"
    administrator_login_password        = var.sql_server_admin_password
    mssql_ad_group_name                 = azuread_group.sql_server_admins.name
    mssql_ad_group_object_name          = azuread_group.sql_server_admins.object_id
    audit_log_storage_account_id        = module.storage_account.id
    auditlog_storage_account_endpoint   = module.storage_account.primary_blob_endpoint
    mssql_database_name                 = "sql-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
    sql_database_count                  = 0
    sqlTostorage_assignment_name_guiid  = var.uniqueguid

    tags                                = var.tags
}


resource "azurerm_sql_virtual_network_rule" "sqlvnetbuildvm" {
  name                = "sql-vnet-rule-buildvm"
  resource_group_name = module.applicationrg.resource_group_name
  server_name         = module.mssql_server_abla.sql_server_name
  subnet_id           = data.terraform_remote_state.shared.outputs.build_subnet_id
}

resource "azurerm_sql_virtual_network_rule" "sqlvnetadminvm" {
  name                = "sql-vnet-rule-adminvm"
  resource_group_name = module.applicationrg.resource_group_name
  server_name         = module.mssql_server_abla.sql_server_name
  subnet_id           = data.terraform_remote_state.shared.outputs.mgmt_subnet_id
  depends_on          = [azurerm_sql_virtual_network_rule.sqlvnetbuildvm]
}

resource "azurerm_sql_virtual_network_rule" "sqlvnetase" {
  name                = "sql-vnet-rule-ase"
  resource_group_name = module.applicationrg.resource_group_name
  server_name         = module.mssql_server_abla.sql_server_name
  subnet_id           = data.terraform_remote_state.shared.outputs.ase_subnet_id
  depends_on          = [azurerm_sql_virtual_network_rule.sqlvnetadminvm]
}



resource "azurerm_mssql_elasticpool" "ablaelasticpool" {
  name                         = "${var.application_acronym}elasticpool${var.environment_acronym}"
  location                     = module.applicationrg.resource_group_location
  resource_group_name          = module.applicationrg.resource_group_name
  server_name                  = module.mssql_server_abla.sql_server_name
  license_type                 = "LicenseIncluded"
  
  max_size_gb                  = 500

  sku {
    name                       = "GP_Gen5"
    tier                       = "GeneralPurpose"
    family                     = "Gen5"
    capacity                   = 14
  }

  per_database_settings {
    min_capacity               = 0
    max_capacity               = 4
  }
  
  depends_on                   = [azurerm_app_service.appservice_web]
  tags                         = var.tags
}
