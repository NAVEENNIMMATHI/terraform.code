// Enable access to SQL Server from Azure services and resources.
module "sqlfirewall" {
  source              = "../../modules/sql_server_rules"
  name                = "FirewallRule1"
  resource_group_name = module.timrg.resource_group_name
  sql_server_name     = module.sqlserver.sql_server_name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}

