module "fpias" {
  source                  = "../../modules12/availability_set"
  availability_set_name   = var.environment=="production" ? "co-p-fpi-as" : "avs-${var.location_acronym}-${var.application_acronym}-app-${var.environment_acronym}"
  resource_group_location = module.rgfpi.resource_group_location
  resource_group_name     = module.rgfpi.resource_group_name
  tags                    = var.tags
}