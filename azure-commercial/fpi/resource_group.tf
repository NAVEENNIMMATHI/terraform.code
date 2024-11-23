locals {
  common_prefix_rg        = "RGP-${upper(var.location_acronym)}-${upper(var.application_acronym)}"
}

module "rgfpi" {
  source                  = "../../modules12/resource_group"
  resource_group_name     = var.environment=="production" ? "co-p-spi-fpi-rg" : "${local.common_prefix_rg}-${upper(var.environment_acronym)}"
  resource_group_location = var.location
  tags                    = var.tags
}

module "backuprecoveryrg" {
  source                  = "../../modules12/resource_group"
  resource_group_name     = var.environment=="production" ? "co-p-spi-fpi-backuprecovery-rg" : "${local.common_prefix_rg}-BACKUPRECOVERY-${upper(var.environment_acronym)}"
  resource_group_location = var.location
  tags                    = var.tags
}

module "loganalyticsrg" {
  source                  = "../../modules12/resource_group"
  resource_group_name     = var.environment=="production" ? "co-p-spi-fpi-loganalytics-rg" : "${local.common_prefix_rg}-LOGANALYTICS-${upper(var.environment_acronym)}"
  resource_group_location = var.location
  tags                    = var.tags
}