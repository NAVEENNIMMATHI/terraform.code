module "sqlserver" {
  source                        = "../../modules/sql_server"
  sql_server_name               = var.environment_acronym ==  "pd" ? "rrisqlserverp01" : "srv-${var.location_acronym}-rri-${var.application_name}-${var.environment_acronym}"  
  resource_group_name           = module.applicationrg.resource_group_name
  resource_group_location       = module.applicationrg.resource_group_location
  sql_server_admin_username     = var.sql_server_admin_username
  sql_server_admin_password     = var.sqlserveradmin_password
  sqlserver_adgroup_name        = azuread_group.rrisqladmin.name
  tenant_id                     = data.azurerm_client_config.current.tenant_id
  sqlserver_adgroup_object_id   = azuread_group.rrisqladmin.object_id
  tags                          = var.tags
}
resource "azurerm_sql_virtual_network_rule" "sqlrule1" {
  name                = "accesss-from-spi"
  resource_group_name = module.applicationrg.resource_group_name
  server_name         = module.sqlserver.sql_server_name
  subnet_id           = data.terraform_remote_state.spi.outputs.powerbi_subnet_id
}

resource "azurerm_sql_virtual_network_rule" "sqlrule2" {
  name                = "access-from-alteryx"
  resource_group_name = module.applicationrg.resource_group_name
  server_name         = module.sqlserver.sql_server_name
  subnet_id           = module.subnet.subnet_id
  depends_on          = [azurerm_sql_virtual_network_rule.sqlrule1]
}