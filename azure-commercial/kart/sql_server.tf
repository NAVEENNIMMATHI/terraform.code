module "sqlserver" {
  source                      = "../../modules/sql_server"
  sql_server_name             = var.environment == "production" ? "copeuskrtsqlserver1" : "srv-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name         = module.applicationrg.resource_group_name
  resource_group_location     = module.applicationrg.resource_group_location
  sql_server_admin_username   = var.sql_server_admin_username
  sql_server_admin_password   = var.sqlserveradmin_password
  sqlserver_adgroup_name      = azuread_group.sqlserveradgroupdev.name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sqlserver_adgroup_object_id = azuread_group.sqlserveradgroupdev.object_id
  tags                        = var.tags
}

resource "azurerm_sql_virtual_network_rule" "sqlvnetruleapp" {
  name                = "sql-vnet-rule-app1"
  resource_group_name = module.applicationrg.resource_group_name
  server_name         = module.sqlserver.sql_server_name
  subnet_id           = module.krtapp1subnet.subnet_id  
}

resource "azurerm_sql_virtual_network_rule" "sqlvnetrulease" {
  name                = "sql-vnet-rule-ase1"
  resource_group_name = module.applicationrg.resource_group_name
  server_name         = module.sqlserver.sql_server_name
  subnet_id           = module.krtase1subnet.subnet_id
  depends_on          = [azurerm_sql_virtual_network_rule.sqlvnetruleapp]
}

resource "azurerm_sql_virtual_network_rule" "sqlvnetrulespisubnet1" {
  count = var.environment == "uat" ? 0 : 1 
  name                = "newVnetRule1"
  resource_group_name = module.applicationrg.resource_group_name
  server_name         = module.sqlserver.sql_server_name
  subnet_id           = var.spiappsubnetid
  depends_on          = [azurerm_sql_virtual_network_rule.sqlvnetrulease]
}

