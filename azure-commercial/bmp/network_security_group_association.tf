resource "azurerm_subnet_network_security_group_association" "bmpagw1subnet_nsg_association" {
  subnet_id                 = azurerm_subnet.bmpagw1subnet.id
  network_security_group_id = azurerm_network_security_group.bmpagw1nsg.id
}

resource "azurerm_subnet_network_security_group_association" "bmpapp1subnet_nsg_association" {
  subnet_id                 = azurerm_subnet.bmpapp1subnet.id
  network_security_group_id = azurerm_network_security_group.bmpapp1nsg.id
}

resource "azurerm_subnet_network_security_group_association" "kpimcapiqsubnet_nsg_association" {
  subnet_id                 = azurerm_subnet.kpimcapiqsubnet.id
  network_security_group_id = azurerm_network_security_group.kpimcapiqnsg.id
}

resource "azurerm_subnet_network_security_group_association" "bmprest1subnet_nsg_association" {
  subnet_id                 = azurerm_subnet.bmprest1subnet.id
  network_security_group_id = azurerm_network_security_group.bmprest1nsg.id
}

resource "azurerm_subnet_network_security_group_association" "bmpinformaticasubnet_nsg_association" {
  subnet_id                 = azurerm_subnet.bmpinformaticasubnet.id
  network_security_group_id = azurerm_network_security_group.bmpinformaticansg.id
}

resource "azurerm_subnet_network_security_group_association" "bmpdb1subnet_nsg_association" {
  subnet_id                 = azurerm_subnet.bmpdb1subnet.id
  network_security_group_id = azurerm_network_security_group.nsg-uemcbmpdb1p1.id
}

resource "azurerm_subnet_network_security_group_association" "bmpasesubnet_nsg_association" {
  subnet_id                 = azurerm_subnet.bmpasesubnet.id
  network_security_group_id = azurerm_network_security_group.bmpasensg.id
}

resource "azurerm_subnet_network_security_group_association" "bmppesubnet_nsg_association" {
  subnet_id                 = azurerm_subnet.bmppesubnet.id
  network_security_group_id = azurerm_network_security_group.bmppensg.id
}