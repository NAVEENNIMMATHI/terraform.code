module "sharedvnet" {
  source                  = "../../modules12/virtual_network"
  virtual_network_name    = var.vnet_name
  resource_group_location = module.sharedrg.resource_group_location
  resource_group_name     = module.sharedrg.resource_group_name
  address_space           = var.vnet_address_space
  dns_server              = var.dns_servers
  tags                    = var.tags
}

