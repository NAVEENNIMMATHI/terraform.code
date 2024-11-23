
module "agw1_subnet_nsg_association" {
  source                    = "../../modules/network_security_group_association"
  subnet_id                 = module.impact_agw_subnet.subnet_id
  network_security_group_id = module.agw1nsg_impact.network_security_group_id
}
module "apim_subnet_nsg_association" {
  source                    = "../../modules/network_security_group_association"
  subnet_id                 = module.impact_apim_subnet.subnet_id
  network_security_group_id = module.apimnsg_impact.network_security_group_id
}
module "pep_subnet_nsg_association" {
  source                    = "../../modules/network_security_group_association"
  subnet_id                 = module.impact_pep_subnet.subnet_id
  network_security_group_id = module.pepnsg_impact.network_security_group_id
}
module "app_subnet_nsg_association" {
  source                    = "../../modules/network_security_group_association"
  subnet_id                 = module.impact_function_subnet.subnet_id
  network_security_group_id = module.appnsg_impact.network_security_group_id
}
