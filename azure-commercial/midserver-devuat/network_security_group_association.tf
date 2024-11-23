module "midserver_subnet_nsg_association" {
  source                    = "../../modules/network_security_group_association"
  subnet_id                 = module.midserver-subnet.subnet_id
  network_security_group_id = module.midserver-nsg.network_security_group_id
}