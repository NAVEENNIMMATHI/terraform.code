module "krtagw1nsg" {
  source              = "../../modules/network_security_group"
  name                = var.environment == "production" ? "co-p-eastus-krtagw1-nsg" : "nsg-${var.location_acronym}-${var.application_acronym}-agw-${var.environment_acronym}"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  tags                = var.tags
}

module "krtapp1nsg" {
  source              = "../../modules/network_security_group"
  name                = var.environment == "production" ? "co-p-eastus-krtapp1-nsg" : "nsg-${var.location_acronym}-${var.application_acronym}-app-${var.environment_acronym}"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  tags                = var.tags
}

module "krtase1nsg" {
  source              = "../../modules/network_security_group"
  name                = var.environment == "production" ? "co-p-eastus-krtase1-nsg" : "nsg-${var.location_acronym}-${var.application_acronym}-ase-${var.environment_acronym}"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  tags                = var.tags
}
