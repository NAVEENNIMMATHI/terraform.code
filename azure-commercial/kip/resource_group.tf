module "backuprecoveryrg" {
  source                  = "../../modules/resource_group"
  resource_group_name     = var.environment == "production" ? "co-pd-eastus-kipbackuprecovery-rg" : "RGP-${upper(var.location_acronym)}-${upper(var.application_acronym)}-KIPBACKUPRECOVERY-${upper(var.environment_acronym)}"
  resource_group_location = var.location

  tags                    = var.tags
}

module "loganalyticsrg" {
  source                  = "../../modules/resource_group"
  resource_group_name     = var.environment == "production" ? "co-pd-eastus-kiploganalytics-rg" : "RGP-${upper(var.location_acronym)}-${upper(var.application_acronym)}-LOGANALYTICS-${upper(var.environment_acronym)}"
  resource_group_location = var.location

  tags                    = var.tags
}

module "applicationrg" {
  source                  = "../../modules/resource_group"
  resource_group_name     = var.environment == "production" ? "co-pd-eastus-kip-rg" : "RGP-${upper(var.location_acronym)}-${upper(var.application_acronym)}-${upper(var.environment_acronym)}"
  resource_group_location = var.location
  
  tags                    = var.tags
}

