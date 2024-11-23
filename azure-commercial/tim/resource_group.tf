module "timrg" {
  source                  = "../../modules/resource_group"
  resource_group_name     = "RGP-${upper(var.location_acronym)}-${upper(var.application_acronym)}-${upper(var.environment_acronym)}"
  resource_group_location = var.location
  tags                    = var.tags
}

module "backuprecoveryrg" {
  source                  = "../../modules/resource_group"
  resource_group_name     = "RGP-${upper(var.location_acronym)}-${upper(var.application_acronym)}-DR-${upper(var.environment_acronym)}"
  resource_group_location = var.location
  tags                    = var.tags
}

module "loganalyticsrg" {
  source                  = "../../modules/resource_group"
  resource_group_name     = "RGP-${upper(var.location_acronym)}-${upper(var.application_acronym)}-LGA-${upper(var.environment_acronym)}"
  resource_group_location = var.location
  tags                    = var.tags
}

