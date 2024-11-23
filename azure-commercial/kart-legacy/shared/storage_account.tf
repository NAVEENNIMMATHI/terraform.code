module "storageaccount_preprocess" {
  source                            = "../../modules12/storage_account"
  storage_account_name              = "${var.preprocess_storage_account_name}${var.uniqueresourcesuffix}"
  resource_group_name               = data.azurerm_resource_group.sharedrg.name
  resource_group_location           = data.azurerm_resource_group.sharedrg.location
  account_tier                      = var.account_tier
  account_replication_type          = var.replication_type
  account_kind                      = var.account_type
  enable_https_traffic_only         = true
  enable_advanced_threat_protection = true
  network_rule_default_action       = "Deny"
  kpmg_nat_ip_list                  = var.pre_kpmg_nat_ip_list
  virtual_network_subnet_ids        = [var.coreinfrasubnetid, data.azurerm_subnet.agwsubnet.id, data.azurerm_subnet.appsubnet.id, data.azurerm_subnet.asesubnet.id, var.core_aks_subnet_id]
  tags                              = var.tags
}

module "preprocess_storageaccount_share" {
  source               = "../../modules12/storage_share"
  storage_share_name   = var.kartsharename
  storage_account_name = module.storageaccount_preprocess.storage_account_name
}

module "storageaccount_postprocess" {
  source                            = "../../modules12/storage_account"
  storage_account_name              = "${var.postprocess_storage_account_name}${var.uniqueresourcesuffix}"
  resource_group_name               = data.azurerm_resource_group.sharedrg.name
  resource_group_location           = data.azurerm_resource_group.sharedrg.location
  account_tier                      = var.account_tier
  account_replication_type          = var.replication_type
  account_kind                      = var.account_type
  enable_https_traffic_only         = true
  enable_advanced_threat_protection = true
  network_rule_default_action       = "Deny"
  kpmg_nat_ip_list                  = var.post_kpmg_nat_ip_list
  virtual_network_subnet_ids        = [data.azurerm_subnet.agwsubnet.id, data.azurerm_subnet.appsubnet.id, data.azurerm_subnet.asesubnet.id]
  tags                              = var.tags
}

module "storageaccount_archprocess" {
  source                            = "../../modules12/storage_account"
  storage_account_name              = "${var.arch_storage_account_name}${var.uniqueresourcesuffix}"
  resource_group_name               = data.azurerm_resource_group.sharedrg.name
  resource_group_location           = data.azurerm_resource_group.sharedrg.location
  account_tier                      = var.account_tier
  account_replication_type          = var.replication_type
  account_kind                      = var.account_type
  enable_https_traffic_only         = true
  enable_advanced_threat_protection = true
  network_rule_default_action       = "Deny"
  kpmg_nat_ip_list                  = var.arch_kpmg_nat_ip_list
  virtual_network_subnet_ids        = [data.azurerm_subnet.agwsubnet.id, data.azurerm_subnet.appsubnet.id, data.azurerm_subnet.asesubnet.id]
  tags                              = var.tags
}

