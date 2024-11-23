module "sqlfirewall" {
  source              = "../../modules/sql_server_rules"
  name                = "Data Export Service"
  resource_group_name = module.cmbsrg.resource_group_name
  sql_server_name     = azurerm_mssql_server.cmbs_srv_mssql_server.name
  start_ip_address    = "23.96.92.86"
  end_ip_address      = "23.96.92.86"
}

module "allowAzureservices" {
  source              = "../../modules/sql_server_rules"
  name                = "allow azure services"
  resource_group_name = module.cmbsrg.resource_group_name
  sql_server_name     = azurerm_mssql_server.cmbs_srv_mssql_server.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}

