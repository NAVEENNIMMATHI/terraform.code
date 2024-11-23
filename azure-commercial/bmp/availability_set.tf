module "bmpapp1as" {
  source                      = "../../modules/availability_set"
  availability_set_name       = var.environment == "production" ? "co-p-eastus-bmpapp1-as" : "avs-${var.location_acronym}-${var.application_acronym}-app-${var.environment_acronym}"
  resource_group_location     = module.applicationrg.resource_group_location
  resource_group_name         = module.applicationrg.resource_group_name
  platform_fault_domain_count = var.platform_fault_domain_count
  tags                        = var.tags
}

module "bmprest1as" {
  source                      = "../../modules/availability_set"
  availability_set_name       = var.environment == "production" ? "co-p-eastus-bmprest1-as" : "avs-${var.location_acronym}-${var.application_acronym}-rest-${var.environment_acronym}"
  resource_group_location     = module.applicationrg.resource_group_location
  resource_group_name         = module.applicationrg.resource_group_name
  platform_fault_domain_count = var.platform_fault_domain_count
  tags                        = var.tags
}

module "bmpinfo1as" {
  source                      = "../../modules/availability_set"
  availability_set_name       = var.environment == "production" ? "co-p-eastus-bmpinfo1-as" : "avs-${var.location_acronym}-${var.application_acronym}-info-${var.environment_acronym}"
  resource_group_location     = module.applicationrg.resource_group_location
  resource_group_name         = module.applicationrg.resource_group_name
  platform_fault_domain_count = var.platform_fault_domain_count
  tags                        = var.tags
}

module "bmpkpim1as" {
  source                      = "../../modules/availability_set"
  availability_set_name       = var.environment == "production" ? "co-p-eastus-bmpkpim1-as" : "avs-${var.location_acronym}-${var.application_acronym}-kpim-${var.environment_acronym}"
  resource_group_location     = module.applicationrg.resource_group_location
  resource_group_name         = module.applicationrg.resource_group_name
  platform_fault_domain_count = var.platform_fault_domain_count
  tags                        = var.tags
}
