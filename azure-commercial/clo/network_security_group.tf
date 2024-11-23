locals {
  common_prefix_nsg       = "nsg-${var.location_acronym}-${var.application_acronym}"
}
module "cloappgwnsg" {
  source                      = "../../modules12/network_security_group"
  name                        = var.environment == "production" ? "co-p-eastus-cloappgwsub-nsg" : "${local.common_prefix_nsg}-appgw-${var.environment_acronym}"
  location                    = module.vnetrg.resource_group_location
  resource_group_name         = module.vnetrg.resource_group_name

  tags                        = var.tags
}

module "clomgmtnsg" {
  source                      = "../../modules12/network_security_group"
  name                        = var.environment == "production" ? "co-p-eastus-clomgmtsub-nsg" : "${local.common_prefix_nsg}-mgmt-${var.environment_acronym}"
  location                    = module.vnetrg.resource_group_location
  resource_group_name         = module.vnetrg.resource_group_name

  tags                        = var.tags
}

module "clowebnsg" {
  source                      = "../../modules12/network_security_group"
  name                        = var.environment == "production" ? "co-p-eastus-clowebsub-nsg" : "${local.common_prefix_nsg}-web-${var.environment_acronym}"
  location                    = module.vnetrg.resource_group_location
  resource_group_name         = module.vnetrg.resource_group_name

  tags                        = var.tags
}

