module "sql_server" {
    source                      = "../../modules/sql_server"
    sql_server_name             = "srv-${var.location_acronym}-${lower(var.application_acronym)}-${lower(var.environment_acronym)}"
    resource_group_name         = module.applicationrg.resource_group_name
    resource_group_location     = module.applicationrg.resource_group_location
    sql_server_admin_username   = "${lower(var.application_acronym)}admin01"
    sql_server_admin_password   = var.sql_server_admin_password
    tags                        = var.tags
    sqlserver_adgroup_name      = azuread_group.sql_server_admins.name
    tenant_id                   = data.azurerm_client_config.current.tenant_id
    sqlserver_adgroup_object_id = azuread_group.sql_server_admins.object_id
}

resource "azurerm_sql_virtual_network_rule" "sqlvnetbuildvm" {
  name                = "sql-vnet-rule-buildvm"
  resource_group_name = module.applicationrg.resource_group_name
  server_name         = module.sql_server.sql_server_name
  subnet_id           = data.terraform_remote_state.shared.outputs.build_subnet_id
}
resource "azurerm_sql_virtual_network_rule" "sqlvnetadminvm" {
  name                = "sql-vnet-rule-adminvm"
  resource_group_name = module.applicationrg.resource_group_name
  server_name         = module.sql_server.sql_server_name
  subnet_id           = data.terraform_remote_state.shared.outputs.mgmt_subnet_id
  depends_on          = [azurerm_sql_virtual_network_rule.sqlvnetbuildvm]
}
resource "azurerm_sql_virtual_network_rule" "sqlvnetase" {
  name                = "sql-vnet-rule-ase"
  resource_group_name = module.applicationrg.resource_group_name
  server_name         = module.sql_server.sql_server_name
  subnet_id           = data.terraform_remote_state.shared.outputs.ase_subnet_id
  depends_on          = [azurerm_sql_virtual_network_rule.sqlvnetadminvm]
}