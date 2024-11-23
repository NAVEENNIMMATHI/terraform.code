module "applicationrg" {
  source                  = "../../modules/resource_group"
  resource_group_name     = var.environment == "production" ? "${var.cloudops_global_prefix}-${var.environment_acronym}-${var.location}-${var.application_acronym}-rg" : upper("rgp-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}")
  resource_group_location = var.location
  tags                    = var.tags
}

module "backuprecoveryrg" {
  source                  = "../../modules/resource_group"
  resource_group_name     = var.environment == "production" ? "co-p-eastus-rstdbackuprecovery-rg" : upper("rgp-${var.location_acronym}-rstu-backuprecovery-${var.environment_acronym}")
  resource_group_location = var.location
  tags                    = var.tags
}

module "loganalyticsrg" {
  source                  = "../../modules/resource_group"
  resource_group_name     = var.environment == "production" ? "co-p-eastus-rstdloganalytics-rg" : upper("rgp-${var.location_acronym}-rstu-loganalytics-${var.environment_acronym}")
  resource_group_location = var.location
  tags                    = var.tags
}