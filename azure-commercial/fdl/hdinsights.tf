module "hdinsightstr" {
  source                       = "../../modules12/storage_account"
  resource_group_name          = module.application-rg.resource_group_name
  resource_group_location      = module.application-rg.resource_group_location
  storage_account_name         = var.hd_insights_str_name
  account_replication_type     = "LRS"
  #virtual_network_subnet_ids = [module.hdinsight.subnet_id]
  #kpmg_nat_ip_list           = var.kpmg_nat_ip_list
  network_rule_default_action  ="Allow"
  #virtual_network_subnet_ids  = [module.coresubnet.subnet_id,module.coresubnet1.subnet_id]
  tags                         = var.tags
}

module "hdinsightstrcontainer" {
source                 = "../../modules12/storage_container"
 name                  = var.hd_insights_name
 storage_account_name  = module.hdinsightstr.storage_account_name
 container_access_type = var.container_access_type
}

module "hdinsights" {
  source                      = "../../modules12/hd_insights"
 name                         = var.hd_insights_name
 resource_group_name          = module.application-rg.resource_group_name
 location                     = module.application-rg.resource_group_location
 gateway_username             = var.gateway_username
 gateway_password             = var.gateway_password
 storage_container_id         = module.hdinsightstrcontainer.id
 storage_account_key          = module.hdinsightstr.primary_access_key
 head_vm_size                 = var.head_vm_size
 head_username                = var.head_username
 head_password                = var.head_password
 worker_vm_size               = var.worker_vm_size
 worker_username              = var.worker_username
 worker_password              = var.worker_password
 zookeeper_vm_size            = var.zookeeper_vm_size
  zookeeper_username          = var.zookeeper_username
  zookeeper_password          = var.zookeeper_password
  virtual_network_id          = module.core-vnet.virtual_network_id
  subnet_id                   = module.hdinsight.subnet_id
  tags                        = var.hdinsights_tags
}