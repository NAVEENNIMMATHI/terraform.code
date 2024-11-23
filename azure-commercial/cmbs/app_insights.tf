module "cmbsappinsights" {
  source              = "../../modules/application_insights"
  name                = "ais-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name = module.cmbsrg.resource_group_name
  location            = module.cmbsrg.resource_group_location

  tags = var.tags
}
