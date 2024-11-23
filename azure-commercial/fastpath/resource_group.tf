module "apprg" {
  source                  = "../../modules/resource_group"
  resource_group_name     = "RGP-${upper(var.location_acronym)}-${upper(var.application_name)}-${upper(var.environment_acronym)}"
  resource_group_location = var.location
  tags                    = var.tags
}

module "backuprecoveryrg" {
  source                  = "../../modules/resource_group"
  resource_group_name     = "RGP-${upper(var.location_acronym)}-${upper(var.application_name)}-DR-${upper(var.environment_acronym)}"
  resource_group_location = var.location
  tags                    = var.tags
}

