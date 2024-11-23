module "arcgisappinsights" {
  source              = "../../modules12/application_insights"
  name                = "ais-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  location            = module.geospatial_rg.resource_group_location
  resource_group_name = module.geospatial_rg.resource_group_name

  tags = var.tags
}