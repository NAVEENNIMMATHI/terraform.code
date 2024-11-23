module "sqlserver" {
  source                           = "../../modules/sql_server"
  sql_server_name                  = "srv-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name              = module.applicationrg.resource_group_name
  resource_group_location          = module.applicationrg.resource_group_location
  sql_server_admin_username        = "${var.application_acronym}sqladmin01"
  sql_server_admin_password        = var.sqlserveradmin_password
  sqlserver_adgroup_name           = azuread_group.SQLAdmins.name
  tenant_id                        = data.azurerm_client_config.current.tenant_id
  sqlserver_adgroup_object_id      = azuread_group.SQLAdmins.object_id

  tags                             = var.tags
}

resource "azurerm_sql_database" "synapseanalyticsdev1" {
  name                             = var.environment == "production" ? "sql-use-kip-pd-synana1" : "sql-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name              = module.applicationrg.resource_group_name
  location                         = module.applicationrg.resource_group_location
  server_name                      = module.sqlserver.sql_server_name
  edition                          = "DataWarehouse"
  requested_service_objective_name = var.kip_sql_dwh_performance_level

  tags                             = var.tags

}

resource "azurerm_sql_database" "thirdpartydata_dwh" {
  count                            = var.environment == "development" ? "1" : "0"
  name                             = "sql-${var.location_acronym}-tpd-dwh"
  resource_group_name              = module.applicationrg.resource_group_name
  location                         = module.applicationrg.resource_group_location
  server_name                      = module.sqlserver.sql_server_name
  edition                          = "DataWarehouse"
  requested_service_objective_name = var.thirdpartydata_sql_dwh_performance_level

  tags                             = var.tags

}

resource "azurerm_sql_database" "CapIQLoaderTargetPanjiva" {
  name                             = "CapIQLoaderTargetPanjiva"
  resource_group_name              = module.applicationrg.resource_group_name
  location                         = module.applicationrg.resource_group_location
  server_name                      = module.sqlserver.sql_server_name
  edition                          = "Hyperscale"
  read_scale                       = false
  count                            = var.environment == "development" || var.environment == "production" ? "1" : "0"

  tags                             = var.tags
}

resource "azurerm_sql_virtual_network_rule" "sqlvnetrulewst1" {
  name                            = "sql-vnet-rule-wst1"
  resource_group_name             = module.applicationrg.resource_group_name
  server_name                     = module.sqlserver.sql_server_name
  subnet_id                       = module.wst1subnet.subnet_id
  depends_on                      = [module.wst1subnet,module.wst1_subnet_nsg_association,azurerm_subnet_route_table_association.kipwst1_subnet]
}

resource "azurerm_sql_virtual_network_rule" "sqlvnetrulease1" {
  name                            = "sql-vnet-rule-ase1"
  resource_group_name             = module.applicationrg.resource_group_name
  server_name                     = module.sqlserver.sql_server_name
  subnet_id                       = module.ase1subnet.subnet_id
  depends_on = [
    module.ase1subnet,
    azurerm_sql_virtual_network_rule.sqlvnetrulewst1,
  ]
}

resource "azurerm_sql_virtual_network_rule" "sqlvnetrulepbi1" {
  name                           = "sql-vnet-rule-pbi1"
  resource_group_name            = module.applicationrg.resource_group_name
  server_name                    = module.sqlserver.sql_server_name
  subnet_id                      = module.pbi1subnet.subnet_id
  depends_on = [
    module.pbi1subnet,
    azurerm_sql_virtual_network_rule.sqlvnetrulease1,
  ]
}

resource "azurerm_sql_virtual_network_rule" "sqlvnetruleapp1" {
  name                          = "sql-vnet-rule-app1"
  resource_group_name           = module.applicationrg.resource_group_name
  server_name                   = module.sqlserver.sql_server_name
  subnet_id                     = module.app1subnet.subnet_id
  depends_on  = [
    module.app1subnet,
    azurerm_sql_virtual_network_rule.sqlvnetrulepbi1,
  ]
}

resource "azurerm_sql_virtual_network_rule" "sqlvnetruleadx1" {
  name                          = "sql-vnet-rule-adx1"
  resource_group_name           = module.applicationrg.resource_group_name
  server_name                   = module.sqlserver.sql_server_name
  subnet_id                     = module.adxsubnet.subnet_id
  depends_on                    = [module.adxsubnet,azurerm_sql_virtual_network_rule.sqlvnetruleapp1]
}

resource "azurerm_sql_virtual_network_rule" "databricks_private_subnet" {
  name                          = "sql-vnet-rule-databricks-private-subnet"
  resource_group_name           = module.applicationrg.resource_group_name
  server_name                   = module.sqlserver.sql_server_name
  subnet_id                     = azurerm_subnet.databricks_private_subnet.id
  depends_on                    = [azurerm_sql_virtual_network_rule.sqlvnetruleadx1]
}

resource "azurerm_sql_virtual_network_rule" "kpimcapiqsubnet" {
  name                          = "sql-vnet-rule-kpimcapiqsubnet"
  resource_group_name           = module.applicationrg.resource_group_name
  server_name                   = module.sqlserver.sql_server_name
  subnet_id                     = module.kpimcapiqsubnet.subnet_id
  depends_on                    = [azurerm_sql_virtual_network_rule.databricks_private_subnet]
}

module "allowAzureservices" {
  source                        = "../../modules/sql_server_rules"
  name                          = "allow azure services"
  resource_group_name           = module.applicationrg.resource_group_name
  sql_server_name               = module.sqlserver.sql_server_name
  start_ip_address              = "0.0.0.0"
  end_ip_address                = "0.0.0.0"
}