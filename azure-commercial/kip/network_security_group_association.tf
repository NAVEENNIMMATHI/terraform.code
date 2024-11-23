### Network Security Group Associations

module "agw1_subnet_nsg_association" {
  source                    = "../../modules/network_security_group_association"
  subnet_id                 = module.agw1subnet.subnet_id
  network_security_group_id = module.agw1nsg.network_security_group_id
}

module "app1_subnet_nsg_association" {
  source                    = "../../modules/network_security_group_association"
  subnet_id                 = module.app1subnet.subnet_id
  network_security_group_id = module.app1nsg.network_security_group_id
}

module "wst1_subnet_nsg_association" {
  source                    = "../../modules/network_security_group_association"
  subnet_id                 = module.wst1subnet.subnet_id
  network_security_group_id = module.wst1nsg.network_security_group_id
}

module "ase1_subnet_nsg_association" {
  source                    = "../../modules/network_security_group_association"
  subnet_id                 = module.ase1subnet.subnet_id
  network_security_group_id = module.ase1nsg.network_security_group_id
}

module "pbi1_subnet_nsg_association" {
  source                    = "../../modules/network_security_group_association"
  subnet_id                 = module.pbi1subnet.subnet_id
  network_security_group_id = module.pbi1nsg.network_security_group_id
}

module "adx1_subnet_nsg_association" {
  source                    = "../../modules/network_security_group_association"
  subnet_id                 = module.adxsubnet.subnet_id
  network_security_group_id = module.adx1nsg.network_security_group_id
}

module "kpimcapiq_subnet_nsg_association" {
  source                    = "../../modules/network_security_group_association"
  subnet_id                 = module.kpimcapiqsubnet.subnet_id
  network_security_group_id = module.kpimcapiqnsg.network_security_group_id
}

module "db1_subnet_nsg_association" {
  source                    = "../../modules/network_security_group_association"
  subnet_id                 = azurerm_subnet.db1subnet.id
  network_security_group_id = module.db1nsg.network_security_group_id
}
module "databricks_private_subnet_nsg_association" {
  source                    = "../../modules/network_security_group_association"
  subnet_id                 = azurerm_subnet.databricks_private_subnet.id
  network_security_group_id = module.databricksprivatensg.network_security_group_id
}
module "databricks_public_subnet_nsg_association" {
  source                    = "../../modules/network_security_group_association"
  subnet_id                 = azurerm_subnet.databricks_public_subnet.id
  network_security_group_id = module.databrickspublicnsg.network_security_group_id
}