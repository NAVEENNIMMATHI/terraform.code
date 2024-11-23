module "agw1nsg_central" {
  source              = "../../modules/network_security_group"
  name                = "nsg-${var.location_acronym}-${var.application_acronym}-${var.application_region}agw1-${var.environment_acronym}"
  location            = module.applicationrg_central.resource_group_location
  resource_group_name = module.applicationrg_central.resource_group_name

  tags                = var.tags
}

module "wst1nsg_central" {
  source              = "../../modules/network_security_group"
  name                = "nsg-${var.location_acronym}-${var.application_acronym}-${var.application_region}wst1-${var.environment_acronym}"
  location            = module.applicationrg_central.resource_group_location
  resource_group_name = module.applicationrg_central.resource_group_name

  tags                = var.tags
}

module "app1nsg_central" {
  source              = "../../modules/network_security_group"
  name                = "nsg-${var.location_acronym}-${var.application_acronym}-${var.application_region}app1-${var.environment_acronym}"
  location            = module.applicationrg_central.resource_group_location
  resource_group_name = module.applicationrg_central.resource_group_name

  tags                = var.tags
}

module "db1nsg_central" {
  source              = "../../modules/network_security_group"
  name                = "nsg-${var.location_acronym}-${var.application_acronym}-${var.application_region}db1-${var.environment_acronym}"
  location            = module.applicationrg_central.resource_group_location
  resource_group_name = module.applicationrg_central.resource_group_name

  tags                = var.tags
}
module "pep1nsg_central" {
  source              = "../../modules/network_security_group"
  name                = "nsg-${var.location_acronym}-${var.application_acronym}-${var.application_region}pep1-${var.environment_acronym}"
  location            = module.applicationrg_central.resource_group_location
  resource_group_name = module.applicationrg_central.resource_group_name

  tags                = var.tags
}

module "adf1nsg_central" {
  source              = "../../modules/network_security_group"
  name                = "nsg-${var.location_acronym}-${var.application_acronym}-${var.application_region}adf1-${var.environment_acronym}"
  location            = module.applicationrg_central.resource_group_location
  resource_group_name = module.applicationrg_central.resource_group_name

  tags                = var.tags
}
module "vnetint1nsg_central" {
  source              = "../../modules/network_security_group"
  name                = "nsg-${var.location_acronym}-${var.application_acronym}-${var.application_region}vnetint-${var.environment_acronym}"
  location            = module.applicationrg_central.resource_group_location
  resource_group_name = module.applicationrg_central.resource_group_name

  tags                = var.tags
}