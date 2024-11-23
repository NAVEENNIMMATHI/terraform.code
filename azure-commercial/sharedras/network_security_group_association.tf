resource "azurerm_subnet_network_security_group_association" "ase_nsg_association" {
  subnet_id                 = module.asesubnet.subnet_id
  network_security_group_id = module.asensg.network_security_group_id
}

resource "azurerm_subnet_network_security_group_association" "mgmt_nsg_association" {
  subnet_id                 = module.mgmtsubnet.subnet_id
  network_security_group_id = module.mgmtnsg.network_security_group_id
}

resource "azurerm_subnet_network_security_group_association" "build_nsg_association" {
  subnet_id                 = module.buildsubnet.subnet_id
  network_security_group_id = module.buildnsg.network_security_group_id
}
resource "azurerm_subnet_network_security_group_association" "agw_nsg_association" {
  subnet_id                 = var.environment_acronym != "pd" ? module.appgatewaysubnet.subnet_id:azurerm_subnet.appgatewaysubnet_allow_443_all.id
  network_security_group_id = module.agwnsg.network_security_group_id
}

/*
resource "azurerm_subnet_network_security_group_association" "agw_nsg_association_443_all" {
  subnet_id                 = azurerm_subnet.appgatewaysubnet_allow_443_all.id
  network_security_group_id = module.agwnsg.network_security_group_id
}
*/


resource "azurerm_subnet_network_security_group_association" "powerappss_nsg_association_all" {
  subnet_id                 = azurerm_subnet.appgatewaysubnet_allow_443_all.id
  network_security_group_id = module.powerapptoappgatewaynsg.network_security_group_id
}

