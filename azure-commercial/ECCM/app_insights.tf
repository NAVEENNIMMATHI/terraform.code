module "eccmappinsights" {
  source                = "../../modules/application_insights"
  name                  = "ais-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  location              = module.eccm_rg.resource_group_location
  resource_group_name   = module.eccm_rg.resource_group_name
  application_type      = "web"

  tags = var.tags
}