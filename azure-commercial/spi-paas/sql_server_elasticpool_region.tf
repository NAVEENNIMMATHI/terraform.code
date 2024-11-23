module "sqlserverpool_prod" {
  source                             = "../../modules/sql_server_elastic_pool"
  for_each                           = var.sql_server_prod_elp
  name                               = "elp-${each.value.location_acronym}-${var.application_acronym}-${each.value.region}-prod-${var.environment_acronym}"
  resource_group_name              = module.applicationrg[each.key].resource_group_name
  resource_group_location          = module.applicationrg[each.key].resource_group_location
  server_name                        = module.sqlserverprod[each.key].sql_server_name
  max_size_gb                        = each.value.sql_elastic_pool_max_size
  sku_name                           = each.value.sqlelasticpool_sku_name
  sku_tier                           = each.value.sqlelasticpool_sku_tier
  sku_family                         = each.value.sqlelasticpool_sku_family
  sku_capacity                       = each.value.sqlelasticpool_sku_capacity
  per_database_settings_min_capacity = each.value.sqlelasticpool_min_capacity
  per_database_settings_max_capacity = each.value.sqlelasticpool_max_capacity
  tags                               = var.tags
}

module "sqlserverpool_stage" {
  source                             = "../../modules/sql_server_elastic_pool"
  for_each                         = var.sql_server_stage_elp
  name                               = "elp-${each.value.location_acronym}-${var.application_acronym}-${each.value.region}-stg-${var.environment_acronym}"
  resource_group_name              = module.applicationrg[each.key].resource_group_name
  resource_group_location          = module.applicationrg[each.key].resource_group_location
  server_name                        = module.sqlserverstage[each.key].sql_server_name
  max_size_gb                        = each.value.sql_elastic_pool_max_size
  sku_name                           = each.value.sqlelasticpool_sku_name
  sku_tier                           = each.value.sqlelasticpool_sku_tier
  sku_family                         = each.value.sqlelasticpool_sku_family
  sku_capacity                       = each.value.sqlelasticpool_sku_capacity
  per_database_settings_min_capacity = each.value.sqlelasticpool_min_capacity
  per_database_settings_max_capacity = each.value.sqlelasticpool_max_capacity
  tags                               = var.tags
}

module "sqlserverpool_app" {
  source                             = "../../modules/sql_server_elastic_pool"
  for_each                           = var.sql_server_app_elp
  name                               = "elp-${each.value.location_acronym}-${var.application_acronym}-${each.value.region}-app-${var.environment_acronym}"
  resource_group_name                = module.applicationrg[each.key].resource_group_name
  resource_group_location            = module.applicationrg[each.key].resource_group_location
  server_name                        = module.sqlserverapp[each.key].sql_server_name
  max_size_gb                        = each.value.sql_elastic_pool_max_size
  sku_name                           = each.value.sqlelasticpool_sku_name
  sku_tier                           = each.value.sqlelasticpool_sku_tier
  sku_family                         = each.value.sqlelasticpool_sku_family
  sku_capacity                       = each.value.sqlelasticpool_sku_capacity
  per_database_settings_min_capacity = each.value.sqlelasticpool_min_capacity
  per_database_settings_max_capacity = each.value.sqlelasticpool_max_capacity
  tags                               = var.tags
}