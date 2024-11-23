locals {
  common_prefix_sto            = "sto${var.location_acronym}${var.application_acronym}"
}
module "recoverysa" {
  source                       = "../../modules12/storage_account"
  storage_account_name         = var.environment == "production" ? "copeusclorecover01sa" : "${local.common_prefix_sto}recovery${var.environment_acronym}"
  resource_group_location      = module.backuprecoveryrg.resource_group_location
  resource_group_name          = module.backuprecoveryrg.resource_group_name
  account_replication_type     = "RAGRS"
  network_rule_default_action  = "Allow"

  tags                         = var.tags
}

module "diagnosticslogssa" {
  source                       = "../../modules12/storage_account"
  storage_account_name         = var.environment == "production" ? "copeusclodiaglog01sa" : "${local.common_prefix_sto}diaglog${var.environment_acronym}"
  resource_group_location      = module.loganalyticsrg.resource_group_location
  resource_group_name          = module.loganalyticsrg.resource_group_name
  account_replication_type     = "RAGRS"
  network_rule_default_action  = "Allow"

  tags                         = var.tags
}

module "vmdiagnosticslogssa" {
  source                       = "../../modules12/storage_account"
  storage_account_name         = var.environment == "production" ? "copeusclovmlog01sa" : "${local.common_prefix_sto}vmdiaglog${var.environment_acronym}"
  resource_group_location      = module.loganalyticsrg.resource_group_location
  resource_group_name          = module.loganalyticsrg.resource_group_name
  account_replication_type     = "RAGRS"
  network_rule_default_action  = "Allow"

  tags                         = var.tags
}

module "kdrsa" {
  source                       = "../../modules12/storage_account"
  storage_account_name         = var.environment == "production" ? "copeusclokdr01sa" : "${local.common_prefix_sto}kdr${var.environment_acronym}"
  resource_group_location      = module.kdrrg.resource_group_location
  resource_group_name          = module.kdrrg.resource_group_name
  account_replication_type     = "RAGRS"
  network_rule_default_action  = "Allow"

  tags                         = var.tags
}

module "activitylogssa" {
  source                       = "../../modules12/storage_account"
  storage_account_name         = var.environment == "production" ? "copeuscloactivlog01sa" : "${local.common_prefix_sto}activitylog${var.environment_acronym}"
  resource_group_location      = module.loganalyticsrg.resource_group_location
  resource_group_name          = module.loganalyticsrg.resource_group_name
  account_replication_type     = "RAGRS"
  network_rule_default_action  = "Allow"

  tags                         = var.tags
}

module "vmimagesa" {
  source                       = "../../modules12/storage_account"
  storage_account_name         = var.environment == "production" ? "copeuscloimage01sa" : "${local.common_prefix_sto}vmimage${var.environment_acronym}"
  resource_group_location      = module.vmimagerg.resource_group_location
  resource_group_name          = module.vmimagerg.resource_group_name
  account_replication_type     = "RAGRS"
  network_rule_default_action  = "Allow"
  
  tags                         = var.tags
}

