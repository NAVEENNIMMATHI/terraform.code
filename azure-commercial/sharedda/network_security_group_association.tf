resource "azurerm_subnet_network_security_group_association" "ase_nsg_association" {
  subnet_id                 = module.asesubnet.subnet_id
  network_security_group_id = module.asensg.network_security_group_id
}

resource "azurerm_subnet_network_security_group_association" "build_nsg_association" {
  subnet_id                 = module.buildsubnet.subnet_id
  network_security_group_id = module.buildnsg.network_security_group_id
}

resource "azurerm_subnet_network_security_group_association" "mgmt_nsg_association" {
  subnet_id                 = module.mgmtsubnet.subnet_id
  network_security_group_id = module.adminnsg.network_security_group_id
}
resource "azurerm_subnet_network_security_group_association" "agw_nsg_association" {
  subnet_id                 = module.agwsubnet.subnet_id
  network_security_group_id = module.agwnsg.network_security_group_id
}
resource "azurerm_subnet_network_security_group_association" "agw_nsg_kpmgonly_association" {
  subnet_id                 = module.agwsubnet_kpmgonly.subnet_id
  network_security_group_id = module.agwnsg_kpmgonly.network_security_group_id
}
resource "azurerm_subnet_network_security_group_association" "pbi_nsg_association" {
  subnet_id                 = module.pbisubnet.subnet_id
  network_security_group_id = module.pbinsg.network_security_group_id
}
resource "azurerm_subnet_network_security_group_association" "wst_nsg_association" {
  subnet_id                 = module.wstsubnet.subnet_id
  network_security_group_id = module.wstnsg.network_security_group_id
}
resource "azurerm_subnet_network_security_group_association" "pe_nsg_association" {
  subnet_id                 = module.private_endpoint.subnet_id
  network_security_group_id = module.adminnsg.network_security_group_id
}