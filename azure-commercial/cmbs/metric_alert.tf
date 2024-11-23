module "cpu-percentage-sql-db" {
  source                                 = "../../modules/monitor_metric_alert"
  name                                   = "cpualertrule-sql-${azurerm_mssql_server.cmbs_srv_mssql_server.name}"
  scopes                                 = ["${data.azurerm_subscription.current.id}/resourceGroups/${module.cmbsrg.resource_group_name}/providers/Microsoft.Sql/servers/${azurerm_mssql_server.cmbs_srv_mssql_server.name}/databases/${azurerm_sql_database.cmbssql_database.name}"]
  resource_group_name                    = module.cmbsrg.resource_group_name
  description                            = "CPU credits consumed by SQL Database during monitoring period."
  metric_alert_criteria_metric_namespace = "Microsoft.Sql/servers/databases"
  metric_alert_criteria_metric_name      = "cpu_percent"
  metric_alert_criteria_operator         = "GreaterThan"
  metric_alert_criteria_threshold        = 95
  metric_alert_criteria_aggregation      = "Average"
  action_group_id                        = azurerm_monitor_action_group.action_group_alert.id
  frequency                              = "PT1M"
}

module "storage-percentage-used-sql-db" {
  source                                 = "../../modules/monitor_metric_alert"
  name                                   = "storagealertrule-sql-${azurerm_mssql_server.cmbs_srv_mssql_server.name}"
  scopes                                 = ["${data.azurerm_subscription.current.id}/resourceGroups/${module.cmbsrg.resource_group_name}/providers/Microsoft.Sql/servers/${azurerm_mssql_server.cmbs_srv_mssql_server.name}/databases/${azurerm_sql_database.cmbssql_database.name}"]
  resource_group_name                    = module.cmbsrg.resource_group_name
  description                            = "Storage percentage used during monitoring period."
  metric_alert_criteria_metric_namespace = "Microsoft.Sql/servers/databases"
  metric_alert_criteria_metric_name      = "storage_percent"
  metric_alert_criteria_operator         = "GreaterThan"
  metric_alert_criteria_threshold        = 95
  metric_alert_criteria_aggregation      = "Average"
  action_group_id                        = azurerm_monitor_action_group.action_group_alert.id
  frequency                              = "PT1M"
}
