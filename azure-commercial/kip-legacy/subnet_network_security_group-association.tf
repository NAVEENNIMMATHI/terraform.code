module "adx1_subnet_nsg_association" {
  source                    = "../../modules12/network_security_group_association"
  subnet_id                 = module.adxsubnet.subnet_id
  network_security_group_id = module.adx1nsg.network_security_group_id
}