module "aset_iics" {
  source                       = "../../modules/availability_set"
  availability_set_name        = "avs-use-iics-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name          = module.mdp_rg_main.resource_group_name
  resource_group_location      = module.mdp_rg_main.resource_group_location
  platform_fault_domain_count  = "2"
  
  tags                         = var.tags
}
module "aset_avscan" {
  source                       = "../../modules/availability_set"
  availability_set_name        = "avs-use-avscan-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name          = module.mdp_rg_main.resource_group_name
  resource_group_location      = module.mdp_rg_main.resource_group_location
  platform_fault_domain_count  = "2"

  tags                         = var.tags
}
