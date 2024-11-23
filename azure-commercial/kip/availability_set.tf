locals {
  common_prefix               = "avs-${var.location_acronym}-${var.application_acronym}"
}
module "workstationas" {
  source                      = "../../modules/availability_set"
  availability_set_name       = var.environment == "production" ? "co-pd-eastus-kipworkstation-as" : "${local.common_prefix}-workstations-${var.environment_acronym}"
  resource_group_location     = module.applicationrg.resource_group_location
  resource_group_name         = module.applicationrg.resource_group_name
  platform_fault_domain_count = 2

  tags                        = var.tags
}

module "applicationas" {
  source                      = "../../modules/availability_set"
  availability_set_name       = var.environment == "production" ? "co-pd-eastus-kipapplication-as" : "${local.common_prefix}-applications-${var.environment_acronym}"
  resource_group_location     = module.applicationrg.resource_group_location
  resource_group_name         = module.applicationrg.resource_group_name
  platform_fault_domain_count = 2

  tags                        = var.tags
}

module "powerbigatewayas" {
  source                      = "../../modules/availability_set"
  availability_set_name       = var.environment == "production" ? "co-pd-eastus-kippowerbigateway-as" : "${local.common_prefix}-powerbigateways-${var.environment_acronym}"
  resource_group_location     = module.applicationrg.resource_group_location
  resource_group_name         = module.applicationrg.resource_group_name
  platform_fault_domain_count = 2

  tags                        = var.tags
}

module "kpimcapiqas" {
  source                      = "../../modules/availability_set"
  availability_set_name       = "${local.common_prefix}-kpim-${var.environment_acronym}"
  resource_group_location     = module.applicationrg.resource_group_location
  resource_group_name         = module.applicationrg.resource_group_name
  platform_fault_domain_count = 2

  tags                        = var.tags
}

module "analtics_as" {
  source                      = "../../modules/availability_set"
  availability_set_name       = "${local.common_prefix}-ana-${var.environment_acronym}"
  resource_group_location     = module.applicationrg.resource_group_location
  resource_group_name         = module.applicationrg.resource_group_name
  platform_fault_domain_count = 2

  tags                        = var.tags
}