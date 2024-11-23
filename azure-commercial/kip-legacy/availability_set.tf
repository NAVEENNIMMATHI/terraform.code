module "workstationas" {
  source                      = "../../modules12/availability_set"
  availability_set_name       = var.availability_set_name_workstation
  resource_group_location     = module.applicationrg.resource_group_location
  resource_group_name         = module.applicationrg.resource_group_name
  platform_fault_domain_count = 2
  tags                        = var.tags
}

module "applicationas" {
  source                      = "../../modules12/availability_set"
  availability_set_name       = var.availability_set_name_application
  resource_group_location     = module.applicationrg.resource_group_location
  resource_group_name         = module.applicationrg.resource_group_name
  platform_fault_domain_count = 2
  tags                        = var.tags
}

module "powerbigatewayas" {
  source                      = "../../modules12/availability_set"
  availability_set_name       = var.availability_set_name_powerbigateway
  resource_group_location     = module.applicationrg.resource_group_location
  resource_group_name         = module.applicationrg.resource_group_name
  platform_fault_domain_count = 2
  tags                        = var.tags
}

