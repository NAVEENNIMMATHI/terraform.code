### Network Security Group Associations

resource "azurerm_subnet_network_security_group_association" "spiappgw_subnet" {
  subnet_id                 = azurerm_subnet.spiappgw_subnet.id
  network_security_group_id = azurerm_network_security_group.spiappgw1nsg.id
}

resource "azurerm_subnet_network_security_group_association" "spiweb1_subnet" {
  subnet_id                 = azurerm_subnet.spiweb1_subnet.id
  network_security_group_id = azurerm_network_security_group.spiweb1nsg.id
}

resource "azurerm_subnet_network_security_group_association" "spiapp1_subnet" {
  subnet_id                 = azurerm_subnet.spiapp1_subnet.id
  network_security_group_id = azurerm_network_security_group.spiapp1nsg.id
}

resource "azurerm_subnet_network_security_group_association" "spidb1_subnet" {
  subnet_id                 = azurerm_subnet.spidb1_subnet.id
  network_security_group_id = azurerm_network_security_group.spidb1nsg.id
}

resource "azurerm_subnet_network_security_group_association" "bstn_subnet" {
  subnet_id                 = azurerm_subnet.bstn_subnet.id
  network_security_group_id = azurerm_network_security_group.bastionnsg.id
}