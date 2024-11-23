resource "azurerm_subnet_network_security_group_association" "tabappgw_nsg_association" {
  count                     = var.environment == "production" ? "0" : "1"

  subnet_id                 = module.tabappgw_subnet.subnet_id
  network_security_group_id = azurerm_network_security_group.tabappgw_nsg[count.index].id
}

resource "azurerm_subnet_network_security_group_association" "tabext_nsg_association" {
  subnet_id                 = module.tabext_subnet.subnet_id
  network_security_group_id = module.tabext_nsg.network_security_group_id
}