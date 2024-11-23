#Storage usage for postgresql
module "storage_used_percent-postgresql" {
  source                                  = "../../modules12/monitor_metric_alert"
  name                                    = "storageused-${module.postgresql_server.postgresql_server_name}-${lower(var.environment_acronym)}"
  scopes                                  = ["${data.azurerm_subscription.current.id}/resourceGroups/${module.cmarg.resource_group_name}/providers/Microsoft.DBforPostgreSQL/servers/${module.postgresql_server.postgresql_server_name}"]
  resource_group_name                     = module.cmarg.resource_group_name
  description 		                        = "storage used by postgresql during monitoring period."
  metric_alert_criteria_metric_namespace  = "Microsoft.DBforPostgreSQL/servers"
  metric_alert_criteria_metric_name 	    = "storage_percent"
  metric_alert_criteria_operator 		      = "GreaterThan"
  metric_alert_criteria_threshold 		    = 95
  metric_alert_criteria_aggregation 	    = "Average"
  action_group_id                         = azurerm_monitor_action_group.action_group_alert.id
  frequency                               = "PT1M"
}

#Memory usage for postgresql
module "memory_used_percent-postgresql" {
  source                                  = "../../modules12/monitor_metric_alert"
  name                                    = "memoryused-${module.postgresql_server.postgresql_server_name}-${lower(var.environment_acronym)}"
  scopes                                  = ["${data.azurerm_subscription.current.id}/resourceGroups/${module.cmarg.resource_group_name}/providers/Microsoft.DBforPostgreSQL/servers/${module.postgresql_server.postgresql_server_name}"]
  resource_group_name                     = "${module.cmarg.resource_group_name}"
  description 		                        = "memory utilized by postgresql during monitoring period."
  metric_alert_criteria_metric_namespace  = "Microsoft.DBforPostgreSQL/servers"
  metric_alert_criteria_metric_name 	    = "memory_percent"
  metric_alert_criteria_operator 		      = "GreaterThan"
  metric_alert_criteria_threshold 		    = 95
  metric_alert_criteria_aggregation 	    = "Average"
  action_group_id                         = "${azurerm_monitor_action_group.action_group_alert.id}"
  frequency                               = "PT1M"
}

#Memory usage for postgresql
module "cpu_used_percent-postgresql" {
  source                                  = "../../modules12/monitor_metric_alert"
  name                                    = "cpuused-${module.postgresql_server.postgresql_server_name}-${lower(var.environment_acronym)}"
  scopes                                  = ["${data.azurerm_subscription.current.id}/resourceGroups/${module.cmarg.resource_group_name}/providers/Microsoft.DBforPostgreSQL/servers/${module.postgresql_server.postgresql_server_name}"]
  resource_group_name                     = "${module.cmarg.resource_group_name}"
  description 		                        = "CPU utilized by postgresql during monitoring period."
  metric_alert_criteria_metric_namespace  = "Microsoft.DBforPostgreSQL/servers"
  metric_alert_criteria_metric_name 	    = "cpu_percent"
  metric_alert_criteria_operator 		      = "GreaterThan"
  metric_alert_criteria_threshold 		    = 95
  metric_alert_criteria_aggregation 	    = "Average"
  action_group_id                         = "${azurerm_monitor_action_group.action_group_alert.id}"
  frequency                               = "PT1M"
}