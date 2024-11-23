module "sqlserverprod" {
  source                           = "../../modules/sql_server"
  for_each                         = var.sql_server_prod
  sql_server_name                  = "srv-${each.value.location_acronym}-${var.application_acronym}-${each.value.region}-prod-${var.environment_acronym}"
  resource_group_name              = module.applicationrg[each.key].resource_group_name
  resource_group_location          = module.applicationrg[each.key].resource_group_location
  sql_server_admin_username        = "${var.application_acronym}sqladmin01"
  sql_server_admin_password        = var.sqlserveradmin_password
  sqlserver_adgroup_name           = azuread_group.sql_server_admins.name
  tenant_id                        = data.azurerm_client_config.current.tenant_id
  sqlserver_adgroup_object_id      = azuread_group.sql_server_admins.object_id
  storage_account_info = null   

  tags                             = var.tags
}
module "sqlserverstage" {
  source                           = "../../modules/sql_server"
  for_each                         = var.sql_server_stage
  sql_server_name                  = "srv-${each.value.location_acronym}-${var.application_acronym}-${each.value.region}-stg-${var.environment_acronym}"
  resource_group_name              = module.applicationrg[each.key].resource_group_name
  resource_group_location          = module.applicationrg[each.key].resource_group_location
  sql_server_admin_username        = "${var.application_acronym}sqladmin01"
  sql_server_admin_password        = var.sqlserveradmin_password
  sqlserver_adgroup_name           = azuread_group.sql_server_admins.name
  tenant_id                        = data.azurerm_client_config.current.tenant_id
  sqlserver_adgroup_object_id      = azuread_group.sql_server_admins.object_id
 storage_account_info = null 

  tags                             = var.tags
}
module "sqlserverapp" {
  source                           = "../../modules/sql_server"
  for_each                         = var.sql_server_app
  sql_server_name                  = "srv-${each.value.location_acronym}-${var.application_acronym}-${each.value.region}-app-${var.environment_acronym}"
  resource_group_name              =  module.applicationrg[each.key].resource_group_name
  resource_group_location          = module.applicationrg[each.key].resource_group_location
  sql_server_admin_username        = "${var.application_acronym}sqladmin01"
  sql_server_admin_password        = var.sqlserveradmin_password
  sqlserver_adgroup_name           = azuread_group.sql_server_admins.name
  tenant_id                        = data.azurerm_client_config.current.tenant_id
  sqlserver_adgroup_object_id      = azuread_group.sql_server_admins.object_id
  storage_account_info = null 

  tags                             = var.tags
}

resource "azurerm_sql_virtual_network_rule" "sqlvnetruleprodspivm" {
  name                            = "sql-vnet-rule-spi-app1"
  resource_group_name             = module.applicationrg["us"].resource_group_name
  server_name                     = module.sqlserverprod["us"].sql_server_name
  subnet_id                       = data.azurerm_subnet.spiappsubnet.id
}
resource "azurerm_sql_virtual_network_rule" "sqlvnetruleappspivm" {
  name                            = "sql-vnet-rule-spi-app1"
  resource_group_name             = module.applicationrg["us"].resource_group_name
  server_name                     = module.sqlserverapp["us"].sql_server_name
  subnet_id                       = data.azurerm_subnet.spiappsubnet.id
}
resource "azurerm_sql_virtual_network_rule" "sqlvnetrulestagespivm" {
  name                            = "sql-vnet-rule-spi-app1"
  resource_group_name             = module.applicationrg["us"].resource_group_name
  server_name                     = module.sqlserverstage["us"].sql_server_name
  subnet_id                       = data.azurerm_subnet.spiappsubnet.id
}