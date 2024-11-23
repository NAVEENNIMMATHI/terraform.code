module "backuprecoveryrg" {
  source                  = "../../modules12/resource_group"
  resource_group_name     = var.backuprecovery_rg_name
  resource_group_location = var.backuprecovery_rg_location

  tags = var.tags
}

module "loganalyticsrg" {
  source                  = "../../modules12/resource_group"
  resource_group_name     = var.loganalytics_rg_name
  resource_group_location = var.loganalytics_rg_location
  tags                    = var.tags
}

module "applicationrg" {
  source                  = "../../modules12/resource_group"
  resource_group_name     = var.application_rg_name
  resource_group_location = var.application_rg_location
  tags                    = var.tags
}

