#Subnet
module "asesubnet" {
  source                    = "../../modules12/subnet"
  subnet_name               = var.ase_subnet_name
  virtual_network_name      = module.sharedvnet.virtual_network_name
  resource_group_name       = module.sharedrg.resource_group_name
  address_prefix            = var.ase_subnet_address_prefix
  service_endpoints         = var.service_endpoints
}

module "appgatewaysubnet" {
  source                    = "../../modules12/subnet"
  subnet_name               = var.appgateway_subnet_name
  virtual_network_name      = module.sharedvnet.virtual_network_name
  resource_group_name       = module.sharedrg.resource_group_name
  address_prefix            = var.appgateway_subnet_address_prefix
  service_endpoints         = var.service_endpoints
}

