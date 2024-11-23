module "appnsg" {
  source              = "../../modules/network_security_group"
  name                = "nsg-${var.location_acronym}-app-${var.environment_acronym}"
  location            = module.apprg.resource_group_location
  resource_group_name = module.apprg.resource_group_name
  tags                = var.tags
}

module "redisnsg" {
  source              = "../../modules/network_security_group"
  name                = "nsg-${var.location_acronym}-redis-${var.environment_acronym}"
  location            = module.apprg.resource_group_location
  resource_group_name = module.apprg.resource_group_name
  tags                = var.tags
}