resource "azurerm_subnet_network_security_group_association" "auditwst_nsg_association" {
  subnet_id                 = module.auditwstsubnet.subnet_id
  network_security_group_id = module.auditwstnsg.network_security_group_id
}