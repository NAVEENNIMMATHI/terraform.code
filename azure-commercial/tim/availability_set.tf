module "availabilityset" {
  source                       = "../../modules/availability_set"
  availability_set_name        = "avs-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_location      = module.timrg.resource_group_location
  resource_group_name          = module.timrg.resource_group_name
  platform_update_domain_count = "5"
  platform_fault_domain_count  = "2"
  tags                         = var.tags
}

