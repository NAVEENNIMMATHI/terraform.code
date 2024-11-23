module "avset" {
source                         = "../../modules12/availability_set"
availability_set_name          = var.vm_avset_name
resource_group_name            = module.application-rg.resource_group_name
resource_group_location        = module.application-rg.resource_group_location
platform_update_domain_count   = "5"
platform_fault_domain_count    = "2"
tags                           = var.tags
}