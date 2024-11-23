resource "azurerm_subnet_network_security_group_association" "eccm_agw_nsg_assoc" {
  subnet_id                 = module.eccm_agw_subnet.subnet_id
  network_security_group_id = azurerm_network_security_group.eccm_agw_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "eccm_lap_pvt_nsg_assoc" {
  subnet_id                 = module.eccm_lap_pvt_subnet.subnet_id
  network_security_group_id = azurerm_network_security_group.eccm_lap_pvt_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "eccm_lap_pub_nsg_assoc" {
  subnet_id                 = module.eccm_lap_pub_subnet.subnet_id
  network_security_group_id = azurerm_network_security_group.eccm_lap_pub_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "eccm_pep_nsg_assoc" {
  subnet_id                 = module.eccm_pep_subnet.subnet_id
  network_security_group_id = azurerm_network_security_group.eccm_pep_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "eccm_aks_nsg_assoc" {
  subnet_id                 = module.eccm_aks_subnet.subnet_id
  network_security_group_id = azurerm_network_security_group.eccm_aks_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "eccm_css_nsg_assoc" {
  subnet_id                 = module.eccm_css_subnet.subnet_id
  network_security_group_id = azurerm_network_security_group.eccm_css_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "eccm_app_nsg_assoc" {
  subnet_id                 = module.eccm_app_subnet.subnet_id
  network_security_group_id = azurerm_network_security_group.eccm_app_nsg.id
}