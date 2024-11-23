//Alert rule to monitor sql db
module "cpu-percentage-sql-db" {
  source                                 = "../../modules/monitor_metric_alert"
  name                                   = "cpualertrule-sql-${module.sqldatabase.sql_database_name}"
  scopes                                 = ["${data.azurerm_subscription.current.id}/resourceGroups/${module.apprg.resource_group_name}/providers/Microsoft.Sql/servers/${module.sqlserver.sql_server_name}/databases/${module.sqldatabase.sql_database_name}"]
  resource_group_name                    = module.apprg.resource_group_name
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
  name                                   = "storagealertrule-sql-${module.sqldatabase.sql_database_name}"
  scopes                                 = ["${data.azurerm_subscription.current.id}/resourceGroups/${module.apprg.resource_group_name}/providers/Microsoft.Sql/servers/${module.sqlserver.sql_server_name}/databases/${module.sqldatabase.sql_database_name}"]
  resource_group_name                    = module.apprg.resource_group_name
  description                            = "Storage percentage used during monitoring period."
  metric_alert_criteria_metric_namespace = "Microsoft.Sql/servers/databases"
  metric_alert_criteria_metric_name      = "storage_percent"
  metric_alert_criteria_operator         = "GreaterThan"
  metric_alert_criteria_threshold        = 95
  metric_alert_criteria_aggregation      = "Average"
  action_group_id                        = azurerm_monitor_action_group.action_group_alert.id
  frequency                              = "PT1M"
}

#Elastic Pool CPU Percentage
module "cpu-percentage-sql-elasticpool" {
  source                                 = "../../modules/monitor_metric_alert"
  name                                   = "cpualertrule-${module.sqlserverpool.sql_elastic_pool_name}"
  scopes                                 = ["${data.azurerm_subscription.current.id}/resourceGroups/${module.apprg.resource_group_name}/providers/Microsoft.Sql/servers/${module.sqlserver.sql_server_name}/elasticpools/${module.sqlserverpool.sql_elastic_pool_name}"]
  resource_group_name                    = module.apprg.resource_group_name
  description                            = "CPU consumed by Elastic Pool during monitoring period."
  metric_alert_criteria_metric_namespace = "Microsoft.Sql/servers/elasticPools"
  metric_alert_criteria_metric_name      = "cpu_percent"
  metric_alert_criteria_operator         = "GreaterThan"
  metric_alert_criteria_threshold        = 95
  metric_alert_criteria_aggregation      = "Average"
  action_group_id                        = azurerm_monitor_action_group.action_group_alert.id
  frequency                              = "PT1M"
}

#Elastic Pool Allocated Data Percentage 
module "allocated_data_storage_percent-elasticpool" {
  source                                 = "../../modules/monitor_metric_alert"
  name                                   = "allocateddatastoragerule-${module.sqlserverpool.sql_elastic_pool_name}"
  scopes                                 = ["${data.azurerm_subscription.current.id}/resourceGroups/${module.apprg.resource_group_name}/providers/Microsoft.Sql/servers/${module.sqlserver.sql_server_name}/elasticpools/${module.sqlserverpool.sql_elastic_pool_name}"]
  resource_group_name                    = module.apprg.resource_group_name
  description                            = "data storage allocated during monitoring period."
  metric_alert_criteria_metric_namespace = "Microsoft.Sql/servers/elasticPools"
  metric_alert_criteria_metric_name      = "allocated_data_storage_percent"
  metric_alert_criteria_operator         = "GreaterThan"
  metric_alert_criteria_threshold        = 95
  metric_alert_criteria_aggregation      = "Average"
  action_group_id                        = azurerm_monitor_action_group.action_group_alert.id
  frequency                              = "PT1M"
}

#Redis 

module "memory_used_percent-redis" {
  source                                 = "../../modules/monitor_metric_alert"
  name                                   = "memoryused-${module.rediscache.redis_cache_name}"
  scopes                                 = ["${data.azurerm_subscription.current.id}/resourceGroups/${module.apprg.resource_group_name}/providers/Microsoft.Cache/Redis/${module.rediscache.redis_cache_name}"]
  resource_group_name                    = module.apprg.resource_group_name
  description                            = "memory utilized by redis during monitoring period."
  metric_alert_criteria_metric_namespace = "Microsoft.Cache/redis"
  metric_alert_criteria_metric_name      = "usedmemorypercentage"
  metric_alert_criteria_operator         = "GreaterThan"
  metric_alert_criteria_threshold        = 95
  metric_alert_criteria_aggregation      = "Average"
  action_group_id                        = azurerm_monitor_action_group.action_group_alert.id
  frequency                              = "PT1M"
}

module "cache_missrate-redis" {
  source                                 = "../../modules/monitor_metric_alert"
  name                                   = "cachemissrate-${module.rediscache.redis_cache_name}"
  scopes                                 = ["${data.azurerm_subscription.current.id}/resourceGroups/${module.apprg.resource_group_name}/providers/Microsoft.Cache/Redis/${module.rediscache.redis_cache_name}"]
  resource_group_name                    = module.apprg.resource_group_name
  description                            = "cache missrate during monitoring period."
  metric_alert_criteria_metric_namespace = "Microsoft.Cache/redis"
  metric_alert_criteria_metric_name      = "cachemissrate"
  metric_alert_criteria_operator         = "GreaterThan"
  metric_alert_criteria_threshold        = 95
  metric_alert_criteria_aggregation      = "Average"
  action_group_id                        = azurerm_monitor_action_group.action_group_alert.id
  frequency                              = "PT1M"
}

