resource "azurerm_subnet_network_security_group_association" "rridbsubnet_nsg_association" {
  subnet_id                 = azurerm_subnet.rridbsubnet.id
  network_security_group_id = azurerm_network_security_group.rridbnsg.id
}

resource "azurerm_subnet_network_security_group_association" "rripbisubnet_nsg_association" {
  subnet_id                 = azurerm_subnet.rripbisubnet.id
  network_security_group_id = azurerm_network_security_group.rripbinsg.id
}

resource "azurerm_subnet_network_security_group_association" "rrimgtsubnet_nsg_association" {
  subnet_id                 = azurerm_subnet.rrimgtsubnet.id
  network_security_group_id = azurerm_network_security_group.rrimgtnsg.id
}

resource "azurerm_subnet_network_security_group_association" "rriapgwsubnet_nsg_association" {
  subnet_id                 = azurerm_subnet.rriapgwsubnet.id
  network_security_group_id = azurerm_network_security_group.rriapgwnsg.id
}
