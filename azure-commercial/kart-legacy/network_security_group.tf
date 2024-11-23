module "krtagw1nsg" {
  source              = "../../modules12/network_security_group"
  name                = var.nsg_name_agw
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  tags                = var.tags
}

module "krtapp1nsg" {
  source              = "../../modules12/network_security_group"
  name                = var.nsg_name_app
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  tags                = var.tags
}

module "krtase1nsg" {
  source              = "../../modules12/network_security_group"
  name                = var.nsg_name_ase
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  tags                = var.tags
}
