module "core-vnet" {
  source                  = "../../modules12/virtual_network"
  virtual_network_name    = var.virtual_network_name
  resource_group_location = module.application-rg.resource_group_location
  resource_group_name     = module.application-rg.resource_group_name
  address_space           = var.address_space
  #dns_server             = var.dns_server
  tags                    = var.tags
}