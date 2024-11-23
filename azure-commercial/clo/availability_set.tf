module "bstnhostsas" {
  source                      = "../../modules12/availability_set"
  availability_set_name       = var.environment == "production" ? "co-p-eastus-clobstnhosts-as" : "avs-${var.location_acronym}-${var.application_acronym}-bstnhost-${var.environment_acronym}"
  resource_group_location     = module.bstnhostsrg.resource_group_location
  resource_group_name         = module.bstnhostsrg.resource_group_name
  platform_fault_domain_count = 2

  tags                        = var.tags
}

module "appvmas" {
  source                      = "../../modules12/availability_set"
  availability_set_name       = var.environment == "production" ? "co-p-eastus-cloapp-as" : "avs-${var.location_acronym}-${var.application_acronym}-appvm-${var.environment_acronym}"
  resource_group_location     = module.apprg.resource_group_location
  resource_group_name         = module.apprg.resource_group_name
  platform_fault_domain_count = 2

  tags                        = var.tags
}