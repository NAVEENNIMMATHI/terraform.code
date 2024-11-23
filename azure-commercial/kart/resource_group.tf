module "backuprecoveryrg" {
  source                  = "../../modules/resource_group"
  resource_group_name     = var.environment == "production" ? "co-p-eastus-krtbackuprecovery-rg" : upper("RGP-${var.location_acronym}-${var.application_acronym}-backuprecovery-${var.environment_acronym}")
  resource_group_location = var.location

  tags = var.tags
}

module "loganalyticsrg" {
  source                  = "../../modules/resource_group"
  resource_group_name     = var.environment == "production" ? "co-p-eastus-krtloganalytics-rg" : upper("RGP-${var.location_acronym}-${var.application_acronym}-loganalytics-${var.environment_acronym}")
  resource_group_location = var.location
  tags                    = var.tags
}

module "applicationrg" {
  source                  = "../../modules/resource_group"
  resource_group_name     = var.environment == "production" ? "co-p-eastus-krt-rg" : upper("RGP-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}")
  resource_group_location = var.location
  tags                    = var.tags
}

