module "midserver-nsg" {
  source              = "../../modules/network_security_group"
  name                = "nsg-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  location            = module.midserver-rg.resource_group_location
  resource_group_name = module.midserver-rg.resource_group_name
  tags                = var.tags
}