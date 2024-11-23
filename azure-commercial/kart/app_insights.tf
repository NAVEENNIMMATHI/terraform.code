module "appinsights" {
  source              = "../../modules/application_insights"
  name                = var.environment == "production" ? "co-p-eastus-krt-appinsights" : "ais-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location
  sampling_percentage = 0
  tags                = var.tags
}

module "appinsights-fun" {
  source              = "../../modules/application_insights"
  name                = "ais-${var.location_acronym}-${var.application_acronym}-fun-${var.environment_acronym}"
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location
  sampling_percentage = 0
  tags                = var.tags
}