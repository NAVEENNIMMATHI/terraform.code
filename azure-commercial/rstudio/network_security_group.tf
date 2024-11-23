module "rstudionsg" {
  source              = "../../modules/network_security_group"
  name                = var.environment == "production" ? "${var.cloudops_global_prefix}-${var.environment_acronym}-${var.location}-${var.application_acronym}-nsg" : "nsg-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  location            = module.applicationrg.resource_group_location
  resource_group_name = "${lower(module.applicationrg.resource_group_name)}"
  tags                = var.tags
}

module "gurobinsg" {
  source              = "../../modules/network_security_group"
  name                = var.environment == "production" ? "${var.cloudops_global_prefix}-${var.environment_acronym}-${var.location}-${var.application_acronym}-gurobi-nsg" : "nsg-${var.location_acronym}-${var.application_acronym}-gurobi-${var.environment_acronym}"
  location            = module.applicationrg.resource_group_location
  resource_group_name = "${lower(module.applicationrg.resource_group_name)}"
  tags                = var.tags
}

module "windowsnsg" {
  source              = "../../modules/network_security_group"
  name                = var.environment == "production" ? "${var.cloudops_global_prefix}-${var.environment_acronym}-${var.location}-${var.application_acronym}-windows-nsg" : "nsg-${var.location_acronym}-${var.application_acronym}-windows-${var.environment_acronym}"
  location            = module.applicationrg.resource_group_location
  resource_group_name = "${lower(module.applicationrg.resource_group_name)}"
  tags                = var.tags
}

module "mongonsg" {
  source              = "../../modules/network_security_group"
  name                = var.environment == "production" ? "${var.cloudops_global_prefix}-${var.environment_acronym}-${var.location}-${var.application_acronym}-mongo-nsg" : "nsg-${var.location_acronym}-${var.application_acronym}-mongo-${var.environment_acronym}"
  location            = module.applicationrg.resource_group_location
  resource_group_name = "${lower(module.applicationrg.resource_group_name)}"
  tags                = var.tags
}