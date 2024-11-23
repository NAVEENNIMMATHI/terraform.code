// Enable access to SQL Server from Azure services and resources.
module "sqlnetworkrule2" {
  source              = "../../modules/sql_virtual_network_rule"
  name                = "NetworkRule2"
  resource_group_name = module.apprg.resource_group_name
  server_name         = module.sqlserver.sql_server_name
  subnet_id           = data.azurerm_subnet.asesubnet.id
}

