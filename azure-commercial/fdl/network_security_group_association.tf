module "core_subnet_network_security_group_association_ase" {
  source                    = "../../modules12/network_security_group_association"
  subnet_id                 = module.coresubnet.subnet_id
  network_security_group_id = module.corensg.network_security_group_id
}
module "insights_subnet_network_security_group_association_ase" {
  source                    = "../../modules12/network_security_group_association"
  subnet_id                 = module.hdinsight.subnet_id
  network_security_group_id = module.insightsnsg.network_security_group_id
}