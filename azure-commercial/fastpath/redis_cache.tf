module "rediscache" {
  source                  = "../../modules/redis_cache"
  redis_cache_name        = "rdc-${var.location_acronym}-${var.application_name}-${var.environment_acronym}"
  resource_group_name     = module.apprg.resource_group_name
  resource_group_location = module.apprg.resource_group_location
  capacity                = var.redis_capacity
  family                  = var.redis_family
  sku_name                = var.redis_sku_name
  subnet_id               = module.redissubnet.subnet_id
  tags                    = var.tags
}

