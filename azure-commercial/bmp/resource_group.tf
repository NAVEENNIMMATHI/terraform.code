module "applicationrg" {
  source                  = "../../modules/resource_group"
  resource_group_name     = var.environment == "production" ? "co-p-eastus-co${var.application_acronym}-rg" : "RGP-${upper(var.location_acronym)}-${upper(var.application_acronym)}-${upper(var.environment_acronym)}"
  resource_group_location = var.environment == "production" ? "eastus" : var.location
  tags                    = var.tags
}

module "backuprecoveryrg" {
  source                  = "../../modules/resource_group"
  resource_group_name     = var.environment == "production" ? "co-p-eastus-${var.application_acronym}backuprecovery-rg" : "RGP-${upper(var.location_acronym)}-${upper(var.application_acronym)}-BACKUP-${upper(var.environment_acronym)}"
  resource_group_location = var.environment == "production" ? "eastus" : var.location
  tags                    = var.tags
}

module "loganalyticsrg" {
  source                  = "../../modules/resource_group"
  resource_group_name     = var.environment == "production" ? "co-p-eastus-${var.application_acronym}loganalytics-rg" : "RGP-${upper(var.location_acronym)}-${upper(var.application_acronym)}-LAW-${upper(var.environment_acronym)}"
  resource_group_location = var.environment == "production" ? "eastus" : var.location
  tags                    = var.tags
}