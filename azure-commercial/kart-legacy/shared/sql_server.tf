module "sqlserver" {
  source                      = "../../modules12/sql_server"
  sql_server_name             = "${var.sql_server_name}${var.uniqueresourcesuffix}"
  resource_group_name         = data.azurerm_resource_group.sharedrg.name
  resource_group_location     = data.azurerm_resource_group.sharedrg.location
  sql_server_admin_username   = var.sql_server_admin_username
  sql_server_admin_password   = var.sqlserveradmin_password
  sqlserver_adgroup_name      = azuread_group.sqlserveradgroupdev.name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sqlserver_adgroup_object_id = azuread_group.sqlserveradgroupdev.object_id
  tags                        = var.tags
}

resource "azurerm_sql_virtual_network_rule" "sqlvnetruleapp" {
  name                = "sql-vnet-rule-app1"
  resource_group_name = data.azurerm_resource_group.sharedrg.name
  server_name         = module.sqlserver.sql_server_name
  subnet_id           = data.azurerm_subnet.appsubnet.id

  #count = "${var.target_deployment_environment == "prod" ? 1 : 0}"
  depends_on = [azurerm_sql_virtual_network_rule.sqlvnetrulease]
}

resource "azurerm_sql_virtual_network_rule" "sqlvnetrulease" {
  name                = "sql-vnet-rule-ase1"
  resource_group_name = data.azurerm_resource_group.sharedrg.name
  server_name         = module.sqlserver.sql_server_name
  subnet_id           = data.azurerm_subnet.asesubnet.id
  #count = "${var.target_deployment_environment == "prod" ? 1 : 0}"
}

resource "azurerm_sql_virtual_network_rule" "sqlvnetrulespisubnet1" {
  name                = "newVnetRule1"
  resource_group_name = data.azurerm_resource_group.sharedrg.name
  server_name         = module.sqlserver.sql_server_name
  subnet_id           = var.spiappsubnetid
  #count = "${var.target_deployment_environment == "prod" ?  1 : 0}"
}

