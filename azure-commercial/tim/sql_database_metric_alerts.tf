//Alert rule to monitor sql db
module "cpu-percentage-sql-db" {
  source                                 = "../../modules/monitor_metric_alert"
  name                                   = "cpualertrule-sql-${azurerm_sql_database.this.name}"
  scopes                                 = [azurerm_sql_database.this.id]
  resource_group_name                    = module.timrg.resource_group_name
  description                            = "CPU credits consumed by VM during monitoring period."
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
  name                                   = "storagealertrule-sql-${azurerm_sql_database.this.name}"
  scopes                                 = [azurerm_sql_database.this.id]
  resource_group_name                    = module.timrg.resource_group_name
  description                            = "Storage percentage used."
  metric_alert_criteria_metric_namespace = "Microsoft.Sql/servers/databases"
  metric_alert_criteria_metric_name      = "storage_percent"
  metric_alert_criteria_operator         = "GreaterThan"
  metric_alert_criteria_threshold        = 95
  metric_alert_criteria_aggregation      = "Average"
  action_group_id                        = azurerm_monitor_action_group.action_group_alert.id
  frequency                              = "PT1M"
}

