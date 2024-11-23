module "appgw_subnet_nsg_association" {
  source                    = "../../modules12/network_security_group_association"
  subnet_id                 = azurerm_subnet.cloappgwsbn.id
  network_security_group_id = module.cloappgwnsg.network_security_group_id
}

module "mgmt_subnet_nsg_association" {
  source                    = "../../modules12/network_security_group_association"
  subnet_id                 = azurerm_subnet.clomgmtsbn.id
  network_security_group_id = module.clomgmtnsg.network_security_group_id
}

module "web_subnet_nsg_association" {
  source                    = "../../modules12/network_security_group_association"
  subnet_id                 = azurerm_subnet.clowebsbn.id
  network_security_group_id = module.clowebnsg.network_security_group_id
}