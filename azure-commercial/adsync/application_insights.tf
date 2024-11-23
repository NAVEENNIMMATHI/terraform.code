module "application_insights" {
  source              = "../../modules/application_insights"
  name                = "ais-${lower(var.location_acronym)}-${lower(var.application_acronym)}-${lower(var.environment_acronym)}"
  resource_group_name = module.adsyncrg.resource_group_name
  location            = module.adsyncrg.resource_group_location
  tags                = var.tags
}