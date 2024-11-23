module "agw1nsg" {
  source              = "../../modules12/network_security_group"
  name                = var.nsg_name_agw1
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name

  tags                = var.tags
}

module "wst1nsg" {
  source              = "../../modules12/network_security_group"
  name                = var.nsg_name_wst1
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  tags                = var.tags
}

module "app1nsg" {
  source              = "../../modules12/network_security_group"
  name                = var.nsg_name_app1
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  tags                = var.tags
}

module "ase1nsg" {
  source              = "../../modules12/network_security_group"
  name                = var.nsg_name_ase1
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  tags                = var.tags
}

module "pbi1nsg" {
  source              = "../../modules12/network_security_group"
  name                = var.nsg_name_pbi1
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  tags                = var.tags
}

module "db1nsg" {
  source              = "../../modules12/network_security_group"
  name                = var.nsg_name_db1
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  tags                = var.tags
}

module "adx1nsg" {
  source              = "../../modules12/network_security_group"
  name                = var.nsg_name_adx1
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name

  tags                = var.tags
}

