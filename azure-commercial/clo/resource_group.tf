locals {
  legacy_prefix_rg        = "co-${var.environment_acronym}-${var.location}-${var.application_acronym}"
  common_prefix_rg        = "RGP-${upper(var.location_acronym)}-${upper(var.application_acronym)}"
}

module "backuprecoveryrg" {
  source                  = "../../modules12/resource_group"
  resource_group_name     = var.environment == "production" ? "${local.legacy_prefix_rg}backuprecovery-rg" : "${local.common_prefix_rg}-BACKUPRECOVERY-${upper(var.environment_acronym)}" 
  resource_group_location = var.location

  tags                    = var.tags
}

module "vnetrg" {
  source                  = "../../modules12/resource_group"
  resource_group_name     = var.environment == "production" ? "${local.legacy_prefix_rg}vnet-rg" : "${local.common_prefix_rg}-VNET-${upper(var.environment_acronym)}"
  resource_group_location = var.location

  tags                    = var.tags
}

module "vmimagerg" {
  source                  = "../../modules12/resource_group"
  resource_group_name     = var.environment == "production" ? "${local.legacy_prefix_rg}vmimage-rg" : "${local.common_prefix_rg}-VMIMAGE-${upper(var.environment_acronym)}"
  resource_group_location = var.location

  tags                    = var.tags
}

module "bstnhostsrg" {
  source                  = "../../modules12/resource_group"
  resource_group_name     = var.environment == "production" ? "${local.legacy_prefix_rg}bstnhosts-rg" : "${local.common_prefix_rg}-BSTNHOSTS-${upper(var.environment_acronym)}"
  resource_group_location = var.location

  tags                    = var.tags
}

module "kdrrg" {
  source                  = "../../modules12/resource_group"
  resource_group_name     = var.environment == "production" ? "${local.legacy_prefix_rg}kdr-rg" : "${local.common_prefix_rg}-KDR-${upper(var.environment_acronym)}"
  resource_group_location = var.location

  tags                    = var.tags
}

module "loganalyticsrg" {
  source                  = "../../modules12/resource_group"
  resource_group_name     = var.environment == "production" ? "co-p-eastus-rcdloganalytics-rg" : "${local.common_prefix_rg}-LOGANALYTICS-${upper(var.environment_acronym)}"
  resource_group_location = var.location

  tags                    = var.tags
}

module "networkwatcherrg" {
  source                  = "../../modules12/resource_group"
  resource_group_name     = var.environment == "production" ? "NetworkWatcherRG" : "${local.common_prefix_rg}-NETWORKWATCH-${upper(var.environment_acronym)}"
  resource_group_location = var.location

  tags                    = var.tags
}

module "apprg" {
  source                  = "../../modules12/resource_group"
  resource_group_name     = var.environment == "production" ? "${local.legacy_prefix_rg}app-rg" : "${local.common_prefix_rg}-APP-${upper(var.environment_acronym)}"
  resource_group_location = var.location

  tags                    = var.tags
}