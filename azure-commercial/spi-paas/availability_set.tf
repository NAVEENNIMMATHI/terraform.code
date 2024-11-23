module "centralworkstationas" {
  source                      = "../../modules/availability_set"
  availability_set_name       = "avs-${var.location_acronym}-${var.application_acronym}-${var.application_region}-${var.environment_acronym}"
  resource_group_location     = module.applicationrg_central.resource_group_location
  resource_group_name         = module.applicationrg_central.resource_group_name
  platform_fault_domain_count = 2

  tags                        = var.tags
}