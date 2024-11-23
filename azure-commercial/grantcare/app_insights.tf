module "gcappinsights" {
  source              = "../../modules/application_insights"
  name                = "ais-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name = module.grantcarerg.resource_group_name
  location            = module.grantcarerg.resource_group_location

  tags = var.tags
}
