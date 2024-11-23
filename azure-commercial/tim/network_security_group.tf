module "networksecuritygroup" {
  source              = "../../modules/network_security_group"
  name                = "nsg-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  location            = module.timrg.resource_group_location
  resource_group_name = module.timrg.resource_group_name
  tags                = var.tags
}

