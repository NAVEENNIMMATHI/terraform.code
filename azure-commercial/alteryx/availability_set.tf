module "availabilityset" {
  source                       = "../../modules/availability_set"
  availability_set_name        = "co-${var.deployment_environment}-${var.application_rg_location}-${var.application_name}-as"
  resource_group_location      = module.applicationrg.resource_group_location
  resource_group_name          = module.applicationrg.resource_group_name
  platform_fault_domain_count  = "2"
  tags                         = var.tags
}