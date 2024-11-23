module "agw1_subnet_nsg_association_central" {
  source                    = "../../modules/network_security_group_association"
  subnet_id                 = azurerm_subnet.spipaasappgw_subnet_central.id
  network_security_group_id = module.agw1nsg_central.network_security_group_id
}

module "app1_subnet_nsg_association_central" {
  source                    = "../../modules/network_security_group_association"
  subnet_id                 = azurerm_subnet.spipaasappsrv_subnet_central.id
  network_security_group_id = module.app1nsg_central.network_security_group_id
}

module "wst1_subnet_nsg_association_central" {
  source                    = "../../modules/network_security_group_association"
  subnet_id                 = azurerm_subnet.spiwst1_subnet_central.id
  network_security_group_id = module.wst1nsg_central.network_security_group_id
}

module "pep_subnet_nsg_association_central" {
  source                    = "../../modules/network_security_group_association"
  subnet_id                 = azurerm_subnet.private_endpoint_ctr.id
  network_security_group_id = module.pep1nsg_central.network_security_group_id
}
module "db_subnet_nsg_association_central" {
  source                    = "../../modules/network_security_group_association"
  subnet_id                 = azurerm_subnet.spipaasdb_subnet_central.id
  network_security_group_id = module.db1nsg_central.network_security_group_id
}
module "adf_subnet_nsg_association_central" {
  source                    = "../../modules/network_security_group_association"
  subnet_id                 = azurerm_subnet.spipaasadf_subnet_central.id
  network_security_group_id = module.adf1nsg_central.network_security_group_id
}
module "vnetint_subnet_nsg_association_central" {
  source                    = "../../modules/network_security_group_association"
  subnet_id                 = azurerm_subnet.spipaasvnetint_subnet_central.id
  network_security_group_id = module.vnetint1nsg_central.network_security_group_id
}