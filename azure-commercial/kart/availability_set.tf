module "availabilityset" {
  source                      = "../../modules/availability_set"
  availability_set_name       = var.environment == "production" ? "co-p-eastus-krtapp1-as" : "avs-${var.location_acronym}-${var.application_acronym}-app-${var.environment_acronym}"
  resource_group_location     = module.applicationrg.resource_group_location
  resource_group_name         = module.applicationrg.resource_group_name
  platform_fault_domain_count = 2
  tags                        = var.tags
}

module "workstationas" {
  source                      = "../../modules/availability_set"
  availability_set_name       = var.environment == "production" ? "co-p-eastus-krtworkstation-as" : "avs-${var.location_acronym}-${var.application_acronym}-workstation-${var.environment_acronym}"
  resource_group_location     = module.applicationrg.resource_group_location
  resource_group_name         = module.applicationrg.resource_group_name
  platform_fault_domain_count = 2
  tags                        = var.tags
}

