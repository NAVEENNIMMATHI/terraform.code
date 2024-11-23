module "coresubnet" {
  source                    = "../../modules12/subnet"
  subnet_name               = var.core_subnet_name
  virtual_network_name      = module.core-vnet.virtual_network_name
  resource_group_name       = module.application-rg.resource_group_name
  address_prefix            = var.core_subnet_address_prefix
  service_endpoints         = ["Microsoft.Storage"]
}
module "hdinsight" {
  source                    = "../../modules12/subnet"
  subnet_name               = var.insights_subnet_name
  virtual_network_name      = module.core-vnet.virtual_network_name
  resource_group_name       = module.application-rg.resource_group_name
  address_prefix            = var.insights_subnet_address_prefix
  service_endpoints         = ["Microsoft.Storage"]
}
module "bastionsubnet" {
  source                    = "../../modules12/subnet"
  subnet_name               = var.bastion_subnet_name
  virtual_network_name      = module.core-vnet.virtual_network_name
  resource_group_name       = module.application-rg.resource_group_name
  address_prefix            = var.bastion_subnet_address_prefix
  service_endpoints         = []
}