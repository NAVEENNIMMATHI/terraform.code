module "sqlserver01_central" {
  source                           = "../../modules/sql_server"
  sql_server_name                  = "srv-${var.location_acronym}-${var.application_acronym}-${var.application_region}-${var.environment_acronym}"
  resource_group_name              = module.applicationrg_central.resource_group_name
  resource_group_location          = module.applicationrg_central.resource_group_location
  sql_server_admin_username        = "${var.application_acronym}sqladmin01"
  sql_server_admin_password        = var.sqlserveradmin_password
  sqlserver_adgroup_name           = azuread_group.sql_server_admins.name
  tenant_id                        = data.azurerm_client_config.current.tenant_id
  sqlserver_adgroup_object_id      = azuread_group.sql_server_admins.object_id
  storage_account_info = null 
  tags                             = var.tags
}
/*
resource "azurerm_sql_virtual_network_rule" "sqlvnetrulecentralwst1" {
  name                            = "sql-vnet-rule-central-wst1"
  resource_group_name             = module.applicationrg_central.resource_group_name
  server_name                     = module.sqlserver01_central.sql_server_name
  subnet_id                       = azurerm_subnet.spiwst1_subnet_central.id
  depends_on                      = [azurerm_subnet.spiwst1_subnet_central]
}

resource "azurerm_sql_virtual_network_rule" "sqlvnetrulecentralagw1" {
  name                            = "sql-vnet-rule-central-agw1"
  resource_group_name             = module.applicationrg_central.resource_group_name
  server_name                     = module.sqlserver01_central.sql_server_name
  subnet_id                       = azurerm_subnet.spipaasappgw_subnet_central.id
  depends_on                      = [azurerm_subnet.spipaasappgw_subnet_central]
}

resource "azurerm_sql_virtual_network_rule" "sqlvnetrulecentraldb1" {
  name                            = "sql-vnet-rule-central-db1"
  resource_group_name             = module.applicationrg_central.resource_group_name
  server_name                     = module.sqlserver01_central.sql_server_name
  subnet_id                       = azurerm_subnet.spipaasdb_subnet_central.id
  depends_on                      = [azurerm_subnet.spipaasdb_subnet_central]
}
resource "azurerm_sql_virtual_network_rule" "sqlvnetrulecentralapp1" {
  name                            = "sql-vnet-rule-central-app1"
  resource_group_name             = module.applicationrg_central.resource_group_name
  server_name                     = module.sqlserver01_central.sql_server_name
  subnet_id                       = azurerm_subnet.spipaasappsrv_subnet_central.id
  depends_on                      = [azurerm_subnet.spipaasappsrv_subnet_central]
}
resource "azurerm_sql_virtual_network_rule" "sqlvnetrulespiapp1" {
  name                            = "sql-vnet-rule-spi-app1"
  resource_group_name             = module.applicationrg_central.resource_group_name
  server_name                     = module.sqlserver01_central.sql_server_name
  subnet_id                       = data.azurerm_subnet.spiappsubnet.id
  depends_on                      = [azurerm_subnet.spipaasappsrv_subnet_central]
}
*/
resource "azurerm_sql_virtual_network_rule" "sqlvnetrulespiapp1" {
  name                            = "sql-vnet-rule-spi-app1"
  resource_group_name             = module.applicationrg_central.resource_group_name
  server_name                     = module.sqlserver01_central.sql_server_name
  subnet_id                       = data.azurerm_subnet.spiappsubnet.id
}