## Storage Accounts Related to Data Lake

module "rawandcuratedsa" {
  source                            = "../../modules12/storage_account"
  storage_account_name              = var.storage_account_name_data_lake_1
  resource_group_name               = module.applicationrg.resource_group_name
  resource_group_location           = module.applicationrg.resource_group_location
  tags                              = var.tags
  account_kind                      = var.account_type_2
  account_tier                      = var.account_tier
  account_replication_type          = var.replication_type
  enable_advanced_threat_protection = "true"
  is_hns_enabled                    = var.is_hns_enabled
  virtual_network_subnet_ids        = [var.kme_appsubnet,var.kme_mgmtsubnet, var.spi_appsubnet,module.wst1subnet.subnet_id, module.app1subnet.subnet_id, module.pbi1subnet.subnet_id, module.ase1subnet.subnet_id, var.spidb1subnetid, module.adxsubnet.subnet_id]
  kpmg_nat_ip_list                  = [var.ip_rules]
}

module "datavaultsa" {
  source                            = "../../modules12/storage_account"
  storage_account_name              = var.storage_account_name_data_lake_2
  resource_group_name               = module.applicationrg.resource_group_name
  resource_group_location           = module.applicationrg.resource_group_location
  tags                              = var.tags
  account_kind                      = var.account_type_2
  account_tier                      = var.account_tier
  account_replication_type          = var.replication_type
  enable_advanced_threat_protection = "true"
  is_hns_enabled                    = var.is_hns_enabled
  virtual_network_subnet_ids        = [var.kme_appsubnet,var.kme_mgmtsubnet, var.kme_buildsubnet, var.spi_appsubnet,module.wst1subnet.subnet_id, module.app1subnet.subnet_id, module.pbi1subnet.subnet_id, module.ase1subnet.subnet_id, module.adxsubnet.subnet_id]
}

