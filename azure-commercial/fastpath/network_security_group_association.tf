resource "azurerm_subnet_network_security_group_association" "appnsg_nsg_association" {
  subnet_id                 = module.appsubnet.subnet_id
  network_security_group_id = module.appnsg.network_security_group_id
}

resource "azurerm_subnet_network_security_group_association" "redisnsg_nsg_association" {
  subnet_id                 = module.redissubnet.subnet_id
  network_security_group_id = module.redisnsg.network_security_group_id
}