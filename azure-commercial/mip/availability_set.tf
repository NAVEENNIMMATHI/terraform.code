module "aset_license_manager" {
  source                      = "../../modules/availability_set"
  availability_set_name       = "avs-use-iics-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name         = module.mathworks_rg_shared.resource_group_name
  resource_group_location     = module.mathworks_rg_shared.resource_group_location
  platform_fault_domain_count = "2"

  tags = var.tags
}

module "availabilityset_linuxvm" {
  source                      = "../../modules/availability_set"
  availability_set_name       = lower("avs-use-iics-${var.application_acronym}-${var.mip_linuxvm_name_prefix1}-${var.environment_acronym}")
  resource_group_name         = module.mathworks_rg_shared.resource_group_name
  resource_group_location     = module.mathworks_rg_shared.resource_group_location
  platform_fault_domain_count = "2"

  tags = var.tags
}

