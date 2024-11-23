module "sql_server" {
    source                             = "../../modules12/mssql_server"
    mssql_server_name                  = "srv-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
    resource_group_name                = azurerm_resource_group.ofr.name
    resource_group_location            = azurerm_resource_group.ofr.location
    administrator_login_username       = "${lower(var.application_acronym)}admin01"
    administrator_login_password       = var.sql_server_admin_password
    mssql_database_name                = "sql-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
    mssql_ad_group_name                = azuread_group.sql_server_admins.name
    mssql_ad_group_object_name         = azuread_group.sql_server_admins.object_id
    sql_database_count                 = 0
    sqlTostorage_assignment_name_guiid = var.unique_guid
    audit_log_storage_account_id       = azurerm_storage_account.ofr.id
    auditlog_storage_account_endpoint  = azurerm_storage_account.ofr.primary_blob_endpoint
    tls_version                        = "1.2"

    tags                               = var.tags

}

resource "azurerm_sql_virtual_network_rule" "sql_vnet_build_vm" {
  name                = "sql-vnet-rule-buildvm"
  resource_group_name = azurerm_resource_group.ofr.name
  server_name         = module.sql_server.sql_server_name
  subnet_id           = azurerm_subnet.build.id 
}


resource "azurerm_sql_virtual_network_rule" "sql_vnet_ase" {
  name                = "sql-vnet-rule-ase"
  resource_group_name = azurerm_resource_group.ofr.name
  server_name         = module.sql_server.sql_server_name
  subnet_id           = var.ase_subnet_id
  depends_on          = [azurerm_sql_virtual_network_rule.sql_vnet_build_vm]
}