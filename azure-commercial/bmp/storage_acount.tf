locals {
  common_prefix_sto                 = "sto${var.location_acronym}${var.application_acronym}"
}

module "recoverysa" {
  source                      = "../../modules/storage_account"
  storage_account_name        = var.environment == "production" ? "copeusbmprecover01sa" : "sto${var.location_acronym}${var.application_acronym}recover${var.environment_acronym}"
  resource_group_location     = module.backuprecoveryrg.resource_group_location
  resource_group_name         = module.backuprecoveryrg.resource_group_name
  network_rule_default_action = var.network_rule_default_action
  account_replication_type    = "RAGRS"
  tags                        = var.tags
}

module "diagnosticslogssa" {
  source                      = "../../modules/storage_account"
  storage_account_name        = var.environment == "production" ? "copeusbmpdiaglog01sa" : "sto${var.location_acronym}${var.application_acronym}diag${var.environment_acronym}"
  resource_group_location     = module.loganalyticsrg.resource_group_location
  resource_group_name         = module.loganalyticsrg.resource_group_name
  network_rule_default_action = var.network_rule_default_action
  account_replication_type    = "RAGRS"

  tags = var.tags
}

module "vmdiagnosticslogssa" {
  source                      = "../../modules/storage_account"
  storage_account_name        = var.environment == "production" ? "copeusbmpvmlog01sa" : "sto${var.location_acronym}${var.application_acronym}vmdiag${var.environment_acronym}"
  resource_group_location     = module.loganalyticsrg.resource_group_location
  resource_group_name         = module.loganalyticsrg.resource_group_name
  network_rule_default_action = var.network_rule_default_action
  account_replication_type    = "LRS"

  tags = var.tags
}

module "diagnosticslogseus2sa" {
  source                      = "../../modules/storage_account"
  storage_account_name        = var.environment == "production" ? "copeus2bmpdiaglog01sa" : "stouse2${var.application_acronym}diag${var.environment_acronym}"
  resource_group_location     = var.environment == "production" ? "eastus2" : "eastus"
  resource_group_name         = module.loganalyticsrg.resource_group_name
  network_rule_default_action = var.network_rule_default_action
  account_replication_type    = "RAGRS"

  tags = var.tags
}

module "bmpadlseus2sa" {
  source                      = "../../modules/storage_account"
  storage_account_name        = "stouse2${var.application_acronym}adls${var.environment_acronym}"
  resource_group_location     = module.applicationrg.resource_group_location
  resource_group_name         = module.applicationrg.resource_group_name
  network_rule_default_action = "Deny"
  account_replication_type    = "RAGRS"
  virtual_network_subnet_ids = [
    azurerm_subnet.bmpdb1subnet.id,
    azurerm_subnet.bmpinformaticasubnet.id,
    azurerm_subnet.bmprest1subnet.id,
    azurerm_subnet.kpimcapiqsubnet.id,
    azurerm_subnet.bmpapp1subnet.id,
    azurerm_subnet.bmpagw1subnet.id
  ]

  tags = var.tags
}

module "functionappsa" {
  source                            = "../../modules/storage_account"
  storage_account_name              = "${local.common_prefix_sto}fctapp01sa${var.environment_acronym}"
  resource_group_name               = module.applicationrg.resource_group_name
  resource_group_location           = module.applicationrg.resource_group_location
  account_tier                      = "Standard"
  account_replication_type          = "RAGRS"
  enable_advanced_threat_protection = "true"
  virtual_network_subnet_ids = [
    azurerm_subnet.bmpdb1subnet.id,
    azurerm_subnet.bmpinformaticasubnet.id,
    azurerm_subnet.bmprest1subnet.id,
    azurerm_subnet.kpimcapiqsubnet.id,
    azurerm_subnet.bmpapp1subnet.id,
    azurerm_subnet.bmpagw1subnet.id,
    azurerm_subnet.bmpasesubnet.id,
    azurerm_subnet.bmppesubnet.id
  ]
  tags                              = var.tags
}