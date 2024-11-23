module "midserver-as" {
  source                      = "../../modules/availability_set"
  availability_set_name       = "avs-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_location     = module.midserver-rg.resource_group_location
  resource_group_name         = module.midserver-rg.resource_group_name
  platform_fault_domain_count = 2

  tags                        = var.tags
}