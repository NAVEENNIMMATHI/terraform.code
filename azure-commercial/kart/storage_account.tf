module "recoverysa" {
  source                            = "../../modules/storage_account"
  storage_account_name              = var.environment == "production" ? "copeuskrtrecover01sa" : "sto${var.location_acronym}${var.application_acronym}rsv${var.environment_acronym}"
  resource_group_name               = module.backuprecoveryrg.resource_group_name
  resource_group_location           = module.backuprecoveryrg.resource_group_location
  tags                              = var.tags
  account_kind                      = var.account_type
  account_tier                      = var.account_tier
  account_replication_type          = var.replication_type
  enable_advanced_threat_protection = true
  virtual_network_subnet_ids        = [module.krtagw1subnet.subnet_id, module.krtapp1subnet.subnet_id, module.krtase1subnet.subnet_id]
}

module "diagnosticslogssa" {
  source                            = "../../modules/storage_account"
  storage_account_name              = var.environment == "production" ? "copeuskrtdiaglog01sa" : "sto${var.location_acronym}${var.application_acronym}diag${var.environment_acronym}"
  resource_group_name               = module.loganalyticsrg.resource_group_name
  resource_group_location           = module.loganalyticsrg.resource_group_location
  tags                              = var.tags
  account_kind                      = var.account_type
  account_tier                      = var.account_tier
  account_replication_type          = var.replication_type
  enable_advanced_threat_protection = true
  kpmg_nat_ip_list                  = var.kpmg_nat_ip_list
  virtual_network_subnet_ids        = [module.krtagw1subnet.subnet_id, module.krtapp1subnet.subnet_id, module.krtase1subnet.subnet_id]
}

module "vmdiagnosticslogssa" {
  source                            = "../../modules/storage_account"
  storage_account_name              = var.environment == "production" ? "copeuskrtvmlog01sa" : "sto${var.location_acronym}${var.application_acronym}vmlog${var.environment_acronym}"
  resource_group_name               = module.loganalyticsrg.resource_group_name
  resource_group_location           = module.loganalyticsrg.resource_group_location
  tags                              = var.tags
  account_kind                      = var.account_type
  account_tier                      = var.account_tier
  account_replication_type          = var.replication_type
  enable_advanced_threat_protection = true
  virtual_network_subnet_ids        = [module.krtagw1subnet.subnet_id, module.krtapp1subnet.subnet_id, module.krtase1subnet.subnet_id]
}

module "webappbackupsa" {
  source                            = "../../modules/storage_account"
  storage_account_name              = var.environment == "production" ? "copeuskrtwebappbkp01sa" : "sto${var.location_acronym}${var.application_acronym}webappbkp${var.environment_acronym}"
  resource_group_name               = module.backuprecoveryrg.resource_group_name
  resource_group_location           = module.backuprecoveryrg.resource_group_location
  tags                              = var.tags
  account_kind                      = var.account_type
  account_tier                      = var.account_tier
  account_replication_type          = var.replication_type
  enable_advanced_threat_protection = true
  virtual_network_subnet_ids        = (var.environment == "production" || var.environment == "uat") ? [module.krtagw1subnet.subnet_id, module.krtapp1subnet.subnet_id, module.krtase1subnet.subnet_id, var.coreinfrasubnetid, var.core_aks_subnet_id] : [module.krtagw1subnet.subnet_id, module.krtapp1subnet.subnet_id, module.krtase1subnet.subnet_id, var.coreinfrasubnetid, var.wvd_subnet_id, var.core_aks_subnet_id]
  #"${var.target_deployment_environment == "prod" ? 1 : 0}"
  #virtual_network_subnet_ids        = "${var.target_deployment_environment == "prod"} ? ["${azurerm_subnet.krtagw1subnet.id}", "${azurerm_subnet.krtapp1subnet.id}", "${azurerm_subnet.krtase1subnet.id}", "${var.coreinfrasubnetid}","/subscriptions/37d718b4-71be-4555-bbcc-d275927e8b67/resourceGroups/RGP-USE-WVD-VNET-NP/providers/Microsoft.Network/virtualNetworks/vnet-use-wvd-np/subnets/sub-use-wvd-cope-np"] : 0}"
}

# module "functionappsa" {
#   source                            = "../../modules/storage_account"
#   storage_account_name              = "copeuskrtfctapp01sa"
#   resource_group_name               = "${module.applicationrg.resource_group_name}"
#   resource_group_location           = "${module.applicationrg.resource_group_location}"
#   tags                              = "${var.tags}"
#   account_kind                      = "${var.account_type}"
#   account_tier                      = "${var.account_tier}"
#   account_replication_type          = "${var.replication_type}"
#   enable_advanced_threat_protection = "true"
#   network_rule_default_action       = "Allow"
#   virtual_network_subnet_ids        = ["${azurerm_subnet.krtagw1subnet.id}", "${azurerm_subnet.krtapp1subnet.id}", "${azurerm_subnet.krtase1subnet.id}"]
# }

resource "azurerm_storage_account" "webapplogsa" {
  name                = var.environment == "production" ? "copeuskrtwebapplog01sa" : "sto${var.location_acronym}${var.application_acronym}webapplog${var.environment_acronym}"
  resource_group_name = module.loganalyticsrg.resource_group_name
  location            = module.loganalyticsrg.resource_group_location

  account_kind             = var.account_type
  account_tier             = "Standard"
  account_replication_type = "RAGRS"

  #enable_blob_encryption   = "true"
  #enable_advanced_threat_protection="true"
  enable_https_traffic_only = true
  tags                      = var.tags
}

module "storageaccount_preprocess" {
  source                            = "../../modules/storage_account"
  storage_account_name              = var.environment == "production" ? "copeuskrtprepro01sa" : "sto${var.location_acronym}${var.application_acronym}prepro${var.environment_acronym}"
  resource_group_name               = module.applicationrg.resource_group_name
  resource_group_location           = module.applicationrg.resource_group_location
  account_tier                      = var.account_tier
  account_replication_type          = var.replication_type
  account_kind                      = var.account_type
  enable_https_traffic_only         = true
  enable_advanced_threat_protection = true
  allow_blob_public_access          = true
  network_rule_default_action       = "Deny"
  kpmg_nat_ip_list                  = var.pre_kpmg_nat_ip_list
  virtual_network_subnet_ids        = [var.coreinfrasubnetid, module.krtagw1subnet.subnet_id, module.krtapp1subnet.subnet_id, module.krtase1subnet.subnet_id, var.core_aks_subnet_id, var.squid_proxy_vm_subnet]
  tags                              = var.tags
}

module "preprocess_storageaccount_share" {
  source               = "../../modules12/storage_share"
  storage_share_name   = var.kartsharename
  storage_account_name = module.storageaccount_preprocess.storage_account_name
}

module "storageaccount_postprocess" {
  source                            = "../../modules/storage_account"
  storage_account_name              = var.environment == "production" ? "copeuskrtpostpro01sa" : "sto${var.location_acronym}${var.application_acronym}postpro${var.environment_acronym}"
  resource_group_name               = module.applicationrg.resource_group_name
  resource_group_location           = module.applicationrg.resource_group_location
  account_tier                      = var.account_tier
  account_replication_type          = var.replication_type
  account_kind                      = var.account_type
  enable_https_traffic_only         = true
  enable_advanced_threat_protection = true
  allow_blob_public_access          = true
  network_rule_default_action       = "Deny"
  kpmg_nat_ip_list                  = var.post_kpmg_nat_ip_list
  virtual_network_subnet_ids        = [module.krtagw1subnet.subnet_id, module.krtapp1subnet.subnet_id, module.krtase1subnet.subnet_id]
  tags                              = var.tags
}

module "storageaccount_archprocess" {
  source                            = "../../modules/storage_account"
  storage_account_name              = var.environment == "production" ? "copeuskrtarchive01sa" : "sto${var.location_acronym}${var.application_acronym}archive${var.environment_acronym}"
  resource_group_name               = module.applicationrg.resource_group_name
  resource_group_location           = module.applicationrg.resource_group_location
  account_tier                      = var.account_tier
  account_replication_type          = var.replication_type
  account_kind                      = var.account_type
  enable_https_traffic_only         = true
  enable_advanced_threat_protection = true
  allow_blob_public_access          = true
  network_rule_default_action       = "Deny"
  kpmg_nat_ip_list                  = var.arch_kpmg_nat_ip_list
  virtual_network_subnet_ids        = [module.krtagw1subnet.subnet_id, module.krtapp1subnet.subnet_id, module.krtase1subnet.subnet_id]
  tags                              = var.tags
}

module "functionappsa" {
  source                            = "../../modules/storage_account"
  storage_account_name              = "sto${var.location_acronym}${var.application_acronym}fctapp01sa${var.environment_acronym}"
  resource_group_name               = module.applicationrg.resource_group_name
  resource_group_location           = module.applicationrg.resource_group_location
  account_tier                      = var.account_tier
  account_replication_type          = var.replication_type
  enable_advanced_threat_protection = "true"
  virtual_network_subnet_ids        = [module.krtagw1subnet.subnet_id, module.krtapp1subnet.subnet_id, module.krtase1subnet.subnet_id]
  kpmg_nat_ip_list                  = var.arch_kpmg_nat_ip_list

  tags                              = var.tags
}