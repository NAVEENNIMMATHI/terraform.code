module "projectops_ai" {
  source              = "../../modules/application_insights"
  name                = "ais-${var.location_acronym}-${var.application_acronym}-1-${var.environment_acronym}"
  resource_group_name = module.projectops_rg.resource_group_name
  location            = module.projectops_rg.resource_group_location

  tags = var.tags
}