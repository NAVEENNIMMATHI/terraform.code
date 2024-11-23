module "sqlserverpool" {
  source                             = "../../modules/sql_server_elastic_pool"
  name                               ="elp-${var.location_acronym}-${var.application_name}-${var.environment_acronym}"
  resource_group_location            = module.apprg.resource_group_location
  resource_group_name                = module.apprg.resource_group_name
  server_name                        = module.sqlserver.sql_server_name
  max_size_gb                        = var.sql_elastic_pool_max_size
  sku_name                           = var.sqlelasticpool_sku_name
  sku_tier                           = var.sqlelasticpool_sku_tier
  sku_family                         = var.sqlelasticpool_sku_family
  sku_capacity                       = var.sqlelasticpool_sku_capacity
  per_database_settings_min_capacity = var.sqlelasticpool_min_capacity
  per_database_settings_max_capacity = var.sqlelasticpool_max_capacity
  tags                               = var.tags
}

