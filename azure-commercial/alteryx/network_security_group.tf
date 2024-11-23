module "alteryxnsg" {
  source              = "../../modules/network_security_group"
  name                = var.environment_acronym ==  "pd" ? "co-${var.deployment_environment}-spi-${var.application_name}-nsg" : "nsg-${var.location_acronym}-${var.application_acronym}-${var.application_name}-${var.environment_acronym}"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  tags                = var.tags
}