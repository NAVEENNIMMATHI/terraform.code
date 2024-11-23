module "availabilityset_connect" {
  source                      = "../../modules/availability_set"
  availability_set_name       = var.environment == "production" ? "${var.cloudops_global_prefix}-${var.environment_acronym}-${var.application_acronym}connect-as" : "avs-${var.location_acronym}-${var.application_acronym}-connect-${var.environment_acronym}"
  resource_group_location     = module.applicationrg.resource_group_location
  resource_group_name         = module.applicationrg.resource_group_name
  platform_fault_domain_count = "3"
  tags                        = var.tags
}

module "availabilityset_serverpro" {
  source                  = "../../modules/availability_set"
  availability_set_name   = var.environment == "production" ? "co-p-rstudioserverpro-as" : "avs-${var.location_acronym}-${var.application_acronym}-serverpro-${var.environment_acronym}"
  resource_group_location = module.applicationrg.resource_group_location
  resource_group_name     = module.applicationrg.resource_group_name
  tags                    = var.tags
}

module "availabilityset_pkgmgr" {
  source                  = "../../modules/availability_set"
  availability_set_name   = var.environment == "production" ? "${var.cloudops_global_prefix}-${var.environment_acronym}-${var.application_acronym}pkgmgr-as" : "avs-${var.location_acronym}-${var.application_acronym}-pkgmgr-${var.environment_acronym}"
  resource_group_location = module.applicationrg.resource_group_location
  resource_group_name     = module.applicationrg.resource_group_name
  tags                    = var.tags
}

module "availabilityset_gurobi" {
  source                      = "../../modules/availability_set"
  availability_set_name       = var.environment == "production" ? "${var.cloudops_global_prefix}-${var.environment_acronym}-${var.application_acronym}gurobi-as" : "avs-${var.location_acronym}-${var.application_acronym}-gurobi-${var.environment_acronym}"
  resource_group_location     = module.applicationrg.resource_group_location
  resource_group_name         = module.applicationrg.resource_group_name
  tags                        = var.tags
}


module "availabilityset_gurobirm" {
  source                      = "../../modules/availability_set"
  availability_set_name       = var.environment == "production" ? "${var.cloudops_global_prefix}-${var.environment_acronym}-${var.application_acronym}gurobirm-as" : "avs-${var.location_acronym}-${var.application_acronym}-gurobirm-${var.environment_acronym}"
  resource_group_location     = module.applicationrg.resource_group_location
  resource_group_name         = module.applicationrg.resource_group_name
  tags                        = var.tags
}
