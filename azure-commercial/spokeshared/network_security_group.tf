module "asensg" {
  source              = "../../modules12/network_security_group"
  name                = var.ase_network_security_group_name
  location            = module.sharedrg.resource_group_location
  resource_group_name = module.sharedrg.resource_group_name
  tags                = var.tags
}

module "appgatewaynsg" {
  source              = "../../modules12/network_security_group"
  name                = var.appgateway_network_security_group_name
  location            = module.sharedrg.resource_group_location
  resource_group_name = module.sharedrg.resource_group_name
  tags                = var.tags
}

