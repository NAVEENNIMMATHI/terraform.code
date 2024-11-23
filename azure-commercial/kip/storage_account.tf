## Storage Accounts Related to Logging

locals {
  common_prefix_sto                 = "sto${var.location_acronym}${var.application_acronym}"
}
module "diagnosticslogssa" {
  source                            = "../../modules/storage_account"
  storage_account_name              = var.environment=="production" ? "copdeuskipdiaglog01sa" : "${local.common_prefix_sto}diaglog01sa${var.environment_acronym}"
  resource_group_name               = module.loganalyticsrg.resource_group_name
  resource_group_location           = module.loganalyticsrg.resource_group_location
  account_tier                      = var.account_tier
  account_replication_type          = var.replication_type
  enable_advanced_threat_protection = "true"
  virtual_network_subnet_ids        = [module.wst1subnet.subnet_id, module.app1subnet.subnet_id, module.pbi1subnet.subnet_id, module.agw1subnet.subnet_id, module.ase1subnet.subnet_id]

  tags                              = var.tags

}

module "vmdiagnosticslogssa" {
  source                            = "../../modules/storage_account"
  storage_account_name              = var.environment=="production" ? "copdeuskipvmlog01sa" : "${local.common_prefix_sto}vmlog01sa${var.environment_acronym}"
  resource_group_name               = module.loganalyticsrg.resource_group_name
  resource_group_location           = module.loganalyticsrg.resource_group_location
  account_tier                      = var.account_tier
  account_replication_type          = var.replication_type
  enable_advanced_threat_protection = "true"
  virtual_network_subnet_ids        = [module.wst1subnet.subnet_id, module.app1subnet.subnet_id, module.pbi1subnet.subnet_id]

  tags                              = var.tags
}

module "webapplogsa" {
  source                            = "../../modules/storage_account"
  storage_account_name              = var.environment=="production" ? "copdeuskipwebapplog01sa" : "${local.common_prefix_sto}webapplog1sa${var.environment_acronym}"
  resource_group_name               = module.loganalyticsrg.resource_group_name
  resource_group_location           = module.loganalyticsrg.resource_group_location
  account_tier                      = var.account_tier
  account_replication_type          = var.replication_type
  enable_advanced_threat_protection = "true"
  virtual_network_subnet_ids        = [module.wst1subnet.subnet_id, module.app1subnet.subnet_id, module.pbi1subnet.subnet_id, module.ase1subnet.subnet_id]

  tags                              = var.tags
}

## Storage Accounts Related to Backup

module "webappbackupsa" {
  source                            = "../../modules/storage_account"
  storage_account_name              = var.environment=="production" ? "copdeuskipwebappbkp01sa" : "${local.common_prefix_sto}webappbkp1sa${var.environment_acronym}"
  resource_group_name               = module.backuprecoveryrg.resource_group_name
  resource_group_location           = module.backuprecoveryrg.resource_group_location
  account_tier                      = var.account_tier
  account_replication_type          = var.replication_type
  enable_advanced_threat_protection = "true"
  virtual_network_subnet_ids        = var.environment == "development" ? [module.wst1subnet.subnet_id, module.app1subnet.subnet_id, module.pbi1subnet.subnet_id, module.ase1subnet.subnet_id, var.coreinfrasubnetid,var.wvd_subnet_id,var.core_aks_subnet_id] : [module.wst1subnet.subnet_id, module.app1subnet.subnet_id, module.pbi1subnet.subnet_id, module.ase1subnet.subnet_id, var.coreinfrasubnetid, var.core_aks_subnet_id]

  tags                              = var.tags
}

module "recoverysa" {
  source                            = "../../modules/storage_account"
  storage_account_name              = var.environment=="production" ? "copdeuskiprecover01sa" : "${local.common_prefix_sto}recover01sa${var.environment_acronym}"
  resource_group_name               = module.backuprecoveryrg.resource_group_name
  resource_group_location           = module.backuprecoveryrg.resource_group_location
  account_tier                      = var.account_tier
  account_replication_type          = var.replication_type
  enable_advanced_threat_protection = "true"
  virtual_network_subnet_ids        = [module.wst1subnet.subnet_id, module.app1subnet.subnet_id, module.pbi1subnet.subnet_id]

  tags                              = var.tags
}

module "functionappsa" {
  source                            = "../../modules/storage_account"
  storage_account_name              = var.environment=="production" ? "copdeuskipfctapp01sa" : "${local.common_prefix_sto}fctapp01sa${var.environment_acronym}"
  resource_group_name               = module.applicationrg.resource_group_name
  resource_group_location           = module.applicationrg.resource_group_location
  account_tier                      = var.account_tier
  account_replication_type          = var.replication_type
  enable_advanced_threat_protection = "true"
  virtual_network_subnet_ids        = [module.ase1subnet.subnet_id,azurerm_subnet.databricks_private_subnet.id]
  kpmg_nat_ip_list                  = var.environment=="production" ? [] : ["199.207.253.101/30","199.206.0.5/30","103.133.112.80/28","103.58.118.80/28","103.216.201.96/28"]

  tags                              = var.tags
}

#KIP App Data storage account
module "kipappdatasa" {
  source                                    = "../../modules/storage_account"
  storage_account_name                      = var.environment=="production" ? "copdeuskipappdata01sa" : "${local.common_prefix_sto}appdata01sa${var.environment_acronym}"
  resource_group_name                       = module.applicationrg.resource_group_name
  resource_group_location                   = module.applicationrg.resource_group_location
  account_tier                              = var.account_tier2
  account_kind                              = var.account_kind
  account_replication_type                  = var.replication_type2
  enable_advanced_threat_protection         = "true"
  virtual_network_subnet_ids                = [module.ase1subnet.subnet_id,module.app1subnet.subnet_id,module.pbi1subnet.subnet_id,module.adf1subnet.subnet_id,module.adf1subnet.subnet_id,module.wst1subnet.subnet_id,var.squid_proxy_vm_subnet_id]
  kpmg_nat_ip_list                          = var.environment=="production" ? [] : ["199.207.253.101/30","199.206.0.5/30","103.133.112.80/28","103.58.118.80/28","103.216.201.96/28"]
  azure_files_authentication_directory_type = "AADDS"

  tags                                      = var.tags
}