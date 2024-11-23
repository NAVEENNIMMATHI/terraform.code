module "controlplane_subnet_nsg_association" {
  source                    = "../../modules/network_security_group_association"
  subnet_id                 = azurerm_subnet.controlplane.id
  network_security_group_id = module.databricksnsg.network_security_group_id
}

module "webapp_subnet_nsg_association" {
  source                    = "../../modules/network_security_group_association"
  subnet_id                 = azurerm_subnet.webapp.id
  network_security_group_id = module.databricksnsg.network_security_group_id
}

module "sqlmi_subnet_nsg_association" {
  source                    = "../../modules/network_security_group_association"
  subnet_id                 = azurerm_subnet.sqlmi.id
  network_security_group_id = module.databricksnsgsqlmi.network_security_group_id
}