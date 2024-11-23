## Storage Accounts Related to Logging

module "diagnosticslogssa" {
  source                            = "../../modules12/storage_account"
  storage_account_name              = var.storage_account_name_dialog
  resource_group_name               = module.loganalyticsrg.resource_group_name
  resource_group_location           = module.loganalyticsrg.resource_group_location
  tags                              = var.tags
  account_tier                      = var.account_tier
  account_replication_type          = var.replication_type
  enable_advanced_threat_protection = "true"
  virtual_network_subnet_ids        = [module.wst1subnet.subnet_id, module.app1subnet.subnet_id, module.pbi1subnet.subnet_id, module.agw1subnet.subnet_id, module.ase1subnet.subnet_id]
}

module "vmdiagnosticslogssa" {
  source                            = "../../modules12/storage_account"
  storage_account_name              = var.storage_account_name_vmdialog
  resource_group_name               = module.loganalyticsrg.resource_group_name
  resource_group_location           = module.loganalyticsrg.resource_group_location
  tags                              = var.tags
  account_tier                      = var.account_tier
  account_replication_type          = var.replication_type
  enable_advanced_threat_protection = "true"
  virtual_network_subnet_ids        = [module.wst1subnet.subnet_id, module.app1subnet.subnet_id, module.pbi1subnet.subnet_id]
}

module "webapplogsa" {
  source                            = "../../modules12/storage_account"
  storage_account_name              = var.storage_account_name_app_log
  resource_group_name               = module.loganalyticsrg.resource_group_name
  resource_group_location           = module.loganalyticsrg.resource_group_location
  tags                              = var.tags
  account_tier                      = var.account_tier
  account_replication_type          = var.replication_type
  enable_advanced_threat_protection = "true"
  virtual_network_subnet_ids        = [module.wst1subnet.subnet_id, module.app1subnet.subnet_id, module.pbi1subnet.subnet_id, module.ase1subnet.subnet_id]
}

## Storage Accounts Related to Backup

module "webappbackupsa" {
  source                            = "../../modules12/storage_account"
  storage_account_name              = var.storage_account_name_webapp_backup
  resource_group_name               = module.backuprecoveryrg.resource_group_name
  resource_group_location           = module.backuprecoveryrg.resource_group_location
  tags                              = var.tags
  account_tier                      = var.account_tier
  account_replication_type          = var.replication_type
  enable_advanced_threat_protection = "true"
  virtual_network_subnet_ids        = [module.wst1subnet.subnet_id, module.app1subnet.subnet_id, module.pbi1subnet.subnet_id, module.ase1subnet.subnet_id, var.coreinfrasubnetid, var.core_aks_subnet_id]
}

module "recoverysa" {
  source                            = "../../modules12/storage_account"
  storage_account_name              = var.storage_account_name_recovery
  resource_group_name               = module.backuprecoveryrg.resource_group_name
  resource_group_location           = module.backuprecoveryrg.resource_group_location
  tags                              = var.tags
  account_tier                      = var.account_tier
  account_replication_type          = var.replication_type
  enable_advanced_threat_protection = "true"
  virtual_network_subnet_ids        = [module.wst1subnet.subnet_id, module.app1subnet.subnet_id, module.pbi1subnet.subnet_id]
}

module "functionappsa" {
  source                            = "../../modules12/storage_account"
  storage_account_name              = var.storage_account_name_app
  resource_group_name               = module.applicationrg.resource_group_name
  resource_group_location           = module.applicationrg.resource_group_location
  tags                              = var.tags
  account_tier                      = var.account_tier
  account_replication_type          = var.replication_type
  enable_advanced_threat_protection = "true"
  virtual_network_subnet_ids        = [module.ase1subnet.subnet_id]
}

