module "datalakestore" {
  source                     = "../../modules12/storage_account"
  resource_group_name        = module.application-rg.resource_group_name
  resource_group_location    = module.application-rg.resource_group_location
  storage_account_name       = var.dls_name
  account_replication_type   = "LRS"
  virtual_network_subnet_ids = [module.hdinsight.subnet_id]
  kpmg_nat_ip_list           = var.kpmg_nat_ip_list
  tags                       = var.tags
}