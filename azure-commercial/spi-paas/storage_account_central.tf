locals {
  common_prefix_sto                 = "sto${var.location_acronym}${var.application_acronym}"
}
/*module "diagnosticslogssa" {
  source                            = "./modules/storage_account"
  storage_account_name              = "sto${lower(var.location_acronym)}${lower(var.application_acronym)}dlog01sa${lower(var.Storage_environment_acronym)}"
  resource_group_name               = module.loganalyticsrg.resource_group_name
  resource_group_location           = module.loganalyticsrg.resource_group_location
  account_tier                      = var.account_tier
  account_replication_type          = var.replication_type
  enable_advanced_threat_protection = "true"
  virtual_network_subnet_ids        = []
  tags                              = var.tags

}

module "vmdiagnosticslogssa" {
  source                            = "./modules/storage_account"
  storage_account_name              = "sto${lower(var.location_acronym)}${lower(var.application_acronym)}vmlog01sa${lower(var.Storage_environment_acronym)}"
  resource_group_name               = module.loganalyticsrg.resource_group_name
  resource_group_location           = module.loganalyticsrg.resource_group_location
  account_tier                      = var.account_tier
  account_replication_type          = var.replication_type
  enable_advanced_threat_protection = "true"
  virtual_network_subnet_ids        = []

  tags                              = var.tags
}

module "webapplogsa" {
  source                            = "./modules/storage_account"
  storage_account_name              = "sto${lower(var.location_acronym)}${lower(var.application_acronym)}applog01sa${lower(var.Storage_environment_acronym)}"
  resource_group_name               = module.loganalyticsrg.resource_group_name
  resource_group_location           = module.loganalyticsrg.resource_group_location
  account_tier                      = var.account_tier
  account_replication_type          = var.replication_type
  enable_advanced_threat_protection = "true"
  virtual_network_subnet_ids        = []

  tags                              = var.tags
}

## Storage Accounts Related to Backup

module "webappbackupsa" {
  source                            = "./modules/storage_account"
  storage_account_name              = "sto${lower(var.location_acronym)}${lower(var.application_acronym)}abkuplg01sa${lower(var.Storage_environment_acronym)}"
  resource_group_name               = module.backuprecoveryrg.resource_group_name
  resource_group_location           = module.backuprecoveryrg.resource_group_location
  account_tier                      = var.account_tier
  account_replication_type          = var.replication_type
  enable_advanced_threat_protection = "true"
  virtual_network_subnet_ids        = []

  tags                              = var.tags
}

module "recoverysa" {
  source                            = "./modules/storage_account"
  storage_account_name              = "sto${lower(var.location_acronym)}${lower(var.application_acronym)}rcr01sa${lower(var.Storage_environment_acronym)}"
  resource_group_name               = module.backuprecoveryrg.resource_group_name
  resource_group_location           = module.backuprecoveryrg.resource_group_location
  account_tier                      = var.account_tier
  account_replication_type          = var.replication_type
  enable_advanced_threat_protection = "true"
  virtual_network_subnet_ids        = []

  tags                              = var.tags
}

module "functionappsa" {
  source                            = "./modules/storage_account"
  storage_account_name              = "sto${lower(var.location_acronym)}${lower(var.application_acronym)}fapp01sa${lower(var.Storage_environment_acronym)}"
  resource_group_name               = module.applicationrg.resource_group_name
  resource_group_location           = module.applicationrg.resource_group_location
  account_tier                      = var.account_tier
  account_replication_type          = var.replication_type
  enable_advanced_threat_protection = "true"
  virtual_network_subnet_ids        = []
  #kpmg_nat_ip_list                  = var.environment=="production" ? [] : ["199.207.253.101/30","199.206.0.5/30","103.133.112.80/28","103.58.118.80/28","103.216.201.96/28"]
  kpmg_nat_ip_list                  = []
  tags                              = var.tags
}
*/
#SPI PAAS HUB App Data storage account
module "spipaascentralappdata01sa" {
  source                                    = "../../modules/storage_account"
  storage_account_name                      = "sto${lower(var.location_acronym)}${lower(var.application_acronym)}cendt01sa${lower(var.Storage_environment_acronym)}"
  resource_group_name                       = module.applicationrg_central.resource_group_name
  resource_group_location                   = module.applicationrg_central.resource_group_location
  account_tier                              = var.account_tier
  account_replication_type                  = var.replication_type
  enable_advanced_threat_protection         = "true"
  virtual_network_subnet_ids              = [data.azurerm_subnet.spiappsubnet.id,azurerm_subnet.spipaasappgw_subnet_central.id,azurerm_subnet.spiwst1_subnet_central.id,azurerm_subnet.spipaasdb_subnet_central.id,azurerm_subnet.spipaasappsrv_subnet_central.id,var.coreinfrasubnetid,var.core_aks_subnet_id]
  #kpmg_nat_ip_list                          = var.environment=="production" ? [] : ["199.207.253.101/30","199.206.0.5/30","103.133.112.80/28","103.58.118.80/28","103.216.201.96/28"]
  azure_files_authentication_directory_type = "AADDS"
  kpmg_nat_ip_list                  = []
  tags                                      = var.tags
}
module "spipaascentralappdata02sa" {
  source                                    = "../../modules/storage_account"
  storage_account_name                      = "sto${lower(var.location_acronym)}${lower(var.application_acronym)}cendt02sa${lower(var.Storage_environment_acronym)}"
  resource_group_name                       = module.applicationrg_central.resource_group_name
  resource_group_location                   = module.applicationrg_central.resource_group_location
  account_tier                              = var.account_tier
  account_replication_type                  = var.replication_type
  enable_advanced_threat_protection         = "true"
  virtual_network_subnet_ids                =   [data.azurerm_subnet.spiappsubnet.id,azurerm_subnet.spipaasappgw_subnet_central.id,azurerm_subnet.spiwst1_subnet_central.id,azurerm_subnet.spipaasdb_subnet_central.id,azurerm_subnet.spipaasappsrv_subnet_central.id,var.coreinfrasubnetid,var.core_aks_subnet_id]
  #kpmg_nat_ip_list                          = var.environment=="production" ? [] : ["199.207.253.101/30","199.206.0.5/30","103.133.112.80/28","103.58.118.80/28","103.216.201.96/28"]
  azure_files_authentication_directory_type = "AADDS"
  kpmg_nat_ip_list                  = []
  tags                                      = var.tags
}
module "spipaascentralwebappbackup01sa" {
  source                            = "../../modules/storage_account"
  storage_account_name              = "sto${lower(var.location_acronym)}${lower(var.application_acronym)}bkuplgsa${lower(var.Storage_environment_acronym)}"
  resource_group_name               = module.applicationrg_central.resource_group_name
  resource_group_location           = module.applicationrg_central.resource_group_location
  account_tier                      = var.account_tier
  account_replication_type          = var.replication_type
  enable_advanced_threat_protection = "true"
  virtual_network_subnet_ids        = [data.azurerm_subnet.spiappsubnet.id,azurerm_subnet.spipaasappgw_subnet_central.id,azurerm_subnet.spiwst1_subnet_central.id,azurerm_subnet.spipaasdb_subnet_central.id,azurerm_subnet.spipaasappsrv_subnet_central.id,var.coreinfrasubnetid,var.core_aks_subnet_id]
  kpmg_nat_ip_list                  = []
  tags                              = var.tags
}

module "spipaascentralvmdiagnosticslogssa" {
  source                            = "../../modules/storage_account"
  storage_account_name              = "sto${lower(var.location_acronym)}${lower(var.application_acronym)}vmlog01sa${lower(var.Storage_environment_acronym)}"
  resource_group_name               = module.applicationrg_central.resource_group_name
  resource_group_location           = module.applicationrg_central.resource_group_location
  account_tier                      = var.account_tier
  network_rule_default_action       = "Allow"
  account_replication_type          = var.replication_type
  enable_advanced_threat_protection = "true"
  virtual_network_subnet_ids        = []

  tags                              = var.tags
}
