module "agw1_subnet_nsg_association" {
  for_each = var.network_security_group
  source                    = "../../modules/network_security_group_association"
  subnet_id                 = azurerm_subnet.spipaasappgw_subnet[each.key].id
  network_security_group_id = module.agwnsg[each.key].network_security_group_id
}

module "app1_subnet_nsg_association" {
for_each = var.network_security_group
  source                    = "../../modules/network_security_group_association"
  subnet_id                 = azurerm_subnet.spipaasappsrv_subnet[each.key].id
  network_security_group_id = module.appnsg[each.key].network_security_group_id
}

module "wst1_subnet_nsg_association" {
for_each = var.network_security_group
  source                    = "../../modules/network_security_group_association"
  subnet_id                 = azurerm_subnet.spipaaswst_subnet[each.key].id
  network_security_group_id = module.wstnsg[each.key].network_security_group_id
}

module "pep_subnet_nsg_association" {
for_each = var.network_security_group
  source                    = "../../modules/network_security_group_association"
  subnet_id                 = azurerm_subnet.spipaaspep_subnet[each.key].id
  network_security_group_id = module.pepnsg[each.key].network_security_group_id
}
module "db_subnet_nsg_association" {
    for_each = var.network_security_group
  source                    = "../../modules/network_security_group_association"
  subnet_id                 = azurerm_subnet.spipaasdb_subnet[each.key].id
  network_security_group_id = module.dbnsg[each.key].network_security_group_id
}
module "pbi_subnet_nsg_association" {
    for_each = var.network_security_group
  source                    = "../../modules/network_security_group_association"
  subnet_id                 = azurerm_subnet.spipaaspbi_subnet[each.key].id
  network_security_group_id = module.pbinsg[each.key].network_security_group_id
}
module "ssis_subnet_nsg_association" {
    for_each = var.network_security_group
  source                    = "../../modules/network_security_group_association"
  subnet_id                 = azurerm_subnet.spipaasssis_subnet[each.key].id
  network_security_group_id = module.ssisnsg[each.key].network_security_group_id
}
module "vnetint_subnet_nsg_association" {
  for_each = var.network_security_group
  source                    = "../../modules/network_security_group_association"
  subnet_id                 = azurerm_subnet.spipaasvnetint_subnet[each.key].id
  network_security_group_id = module.vnetintnsg[each.key].network_security_group_id
}