module "availabilityset" {
  source                      = "../../modules/availability_set"
  availability_set_name       = var.environment == "production" ? "co-p-eastus-pbigtwy-as" : "avs-${var.location_acronym}-${var.application_acronym_spi}-pbigtwy-${var.environment_acronym}"
  resource_group_location     = module.applicationrg.resource_group_location
  resource_group_name         = module.applicationrg.resource_group_name
  platform_fault_domain_count = "2"

  tags                        = var.tags

}

module "availabilityset_wkst" {
  source                      = "../../modules/availability_set"
  availability_set_name       = var.environment == "production" ? "co-p-eastus-pbiwkst-as" : "avs-${var.location_acronym}-${var.application_acronym_spi}-pbiwkst-${var.environment_acronym}"
  resource_group_location     = module.applicationrg.resource_group_location
  resource_group_name         = module.applicationrg.resource_group_name
  platform_fault_domain_count = "2"

  tags                        = var.tags
  
}

