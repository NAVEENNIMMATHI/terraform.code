module "application_insights_web" {
  source              = "../../modules/application_insights"
  name                = "ais-${var.location_acronym}-${var.application_acronym}-web-${var.environment_acronym}"
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location

  tags                = var.tags
}

module "application_insights_rest" {
  source              = "../../modules/application_insights"
  name                = "ais-${var.location_acronym}-${var.application_acronym}-rest-${var.environment_acronym}"
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location

  tags                = var.tags
}

module "application_insights_kpim" {
  source              = "../../modules/application_insights"
  name                = "ais-${var.location_acronym}-${var.application_acronym}-kpim-${var.environment_acronym}"
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location

  tags                = var.tags
}