resource "azurerm_subnet_network_security_group_association" "krtagw1subnet" {
  subnet_id                 = module.krtagw1subnet.subnet_id
  network_security_group_id = module.krtagw1nsg.network_security_group_id
}

resource "azurerm_subnet_network_security_group_association" "krtapp1subnet" {
  subnet_id                 = module.krtapp1subnet.subnet_id
  network_security_group_id = module.krtapp1nsg.network_security_group_id
}

resource "azurerm_subnet_network_security_group_association" "krtase1subnet" {
  subnet_id                 = module.krtase1subnet.subnet_id
  network_security_group_id = module.krtase1nsg.network_security_group_id
}