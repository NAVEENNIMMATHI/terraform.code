module "recoverysa" {
  source                            = "../../modules12/storage_account"
  storage_account_name              = "${var.storage_account_name_recovery}${var.uniqueresourcesuffix}"
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
  source                            = "../../modules12/storage_account"
  storage_account_name              = "${var.storage_account_name_dialog}${var.uniqueresourcesuffix}"
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
  source                            = "../../modules12/storage_account"
  storage_account_name              = "${var.storage_account_name_vmdialog}${var.uniqueresourcesuffix}"
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
  source                            = "../../modules12/storage_account"
  storage_account_name              = "${var.storage_account_name_webapp_backup}${var.uniqueresourcesuffix}"
  resource_group_name               = module.backuprecoveryrg.resource_group_name
  resource_group_location           = module.backuprecoveryrg.resource_group_location
  tags                              = var.tags
  account_kind                      = var.account_type
  account_tier                      = var.account_tier
  account_replication_type          = var.replication_type
  enable_advanced_threat_protection = true
  virtual_network_subnet_ids        = var.target_deployment_environment == "prod" ? [module.krtagw1subnet.subnet_id, module.krtapp1subnet.subnet_id, module.krtase1subnet.subnet_id, var.coreinfrasubnetid, var.core_aks_subnet_id] : [module.krtagw1subnet.subnet_id, module.krtapp1subnet.subnet_id, module.krtase1subnet.subnet_id, var.coreinfrasubnetid, var.wvd_subnet_id, var.core_aks_subnet_id]
  #"${var.target_deployment_environment == "prod" ? 1 : 0}"
  #virtual_network_subnet_ids        = "${var.target_deployment_environment == "prod"} ? ["${azurerm_subnet.krtagw1subnet.id}", "${azurerm_subnet.krtapp1subnet.id}", "${azurerm_subnet.krtase1subnet.id}", "${var.coreinfrasubnetid}","/subscriptions/37d718b4-71be-4555-bbcc-d275927e8b67/resourceGroups/RGP-USE-WVD-VNET-NP/providers/Microsoft.Network/virtualNetworks/vnet-use-wvd-np/subnets/sub-use-wvd-cope-np"] : 0}"
}

# module "functionappsa" {
#   source                            = "../../modules/storage_account"
#   storage_account_name              = "${var.storage_account_name_app}${var.uniqueresourcesuffix}"
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
  name                = "${var.storage_account_name_app_log}${var.uniqueresourcesuffix}"
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

