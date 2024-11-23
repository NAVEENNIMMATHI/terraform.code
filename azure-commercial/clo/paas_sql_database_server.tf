resource "azurerm_sql_server" "clo_sqlserver" {
  name                             = var.environment == "production" ? "clopsqlserver" : "srv-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name              = module.apprg.resource_group_name
  location                         = module.apprg.resource_group_location
  version                          = "12.0"
  administrator_login              = var.clo_sql_admin_login
  administrator_login_password     = var.clo_sql_admin_login_password
  tags                             = var.tags
}

resource "azurerm_sql_database" "clo_sqldatabase" {
  name                             = var.environment == "production" ? "CLO" : "sql-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name              = module.apprg.resource_group_name
  location                         = module.apprg.resource_group_location
  server_name                      = azurerm_sql_server.clo_sqlserver.name
  edition                          = var.clo_paas_sql_database_edition
  collation                        = var.clo_paas_sql_database_collation
  max_size_bytes                   = var.clo_paas_sql_database_max_size_bytes
  requested_service_objective_name = var.clo_paas_sql_database_requested_service_objective_name
  tags                             = var.tags
}

resource "azurerm_sql_firewall_rule" "clo_firewallrule1" {
  name                             = "${azurerm_sql_server.clo_sqlserver.name}-AllowAllWindowsAzureIps"
  resource_group_name              = module.apprg.resource_group_name
  server_name                      = azurerm_sql_server.clo_sqlserver.name
  start_ip_address                 = "0.0.0.0"
  end_ip_address                   = "0.0.0.0"
}

