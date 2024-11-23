module "appinsights" {
  source              = "../../modules/application_insights"
  name                = "ais-${var.location_acronym}-${var.application_name}-${var.environment_acronym}"
  resource_group_name = module.apprg.resource_group_name
  location            = module.apprg.resource_group_location
  sampling_percentage = 0
  tags                = var.tags
}