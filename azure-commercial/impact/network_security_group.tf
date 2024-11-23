
module "agw1nsg_impact" {
  source              = "../../modules/network_security_group"
  name                = "nsg-${var.location_acronym}-${var.application_acronym}-agw1-${var.environment_acronym}"
  location            = module.impact_rg.resource_group_location
  resource_group_name = module.impact_rg.resource_group_name

  tags                = var.tags
}

module "apimnsg_impact" {
  source              = "../../modules/network_security_group"
  name                = "nsg-${var.location_acronym}-${var.application_acronym}-apim-${var.environment_acronym}"
  location            = module.impact_rg.resource_group_location
  resource_group_name = module.impact_rg.resource_group_name

  tags                = var.tags
}
module "pepnsg_impact" {
  source              = "../../modules/network_security_group"
  name                = "nsg-${var.location_acronym}-${var.application_acronym}-pep-${var.environment_acronym}"
  location            = module.impact_rg.resource_group_location
  resource_group_name = module.impact_rg.resource_group_name

  tags                = var.tags
}
module "appnsg_impact" {
  source              = "../../modules/network_security_group"
  name                = "nsg-${var.location_acronym}-${var.application_acronym}-app-${var.environment_acronym}"
  location            = module.impact_rg.resource_group_location
  resource_group_name = module.impact_rg.resource_group_name

  tags                = var.tags
}
