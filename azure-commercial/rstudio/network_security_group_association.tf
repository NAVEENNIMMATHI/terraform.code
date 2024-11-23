resource "azurerm_subnet_network_security_group_association" "spirstudioSubnet" {
  subnet_id                 = module.subnet.subnet_id
  network_security_group_id = module.rstudionsg.network_security_group_id
}

resource "azurerm_subnet_network_security_group_association" "spirstudioGurobiSubnet" {
  subnet_id                 = module.gurobi_subnet.subnet_id
  network_security_group_id = module.gurobinsg.network_security_group_id
}

resource "azurerm_subnet_network_security_group_association" "spirstudioWindowsSubnet" {
  subnet_id                 = module.windows_subnet.subnet_id
  network_security_group_id = module.windowsnsg.network_security_group_id
}

resource "azurerm_subnet_network_security_group_association" "spirstudioMongoSubnet" {
  subnet_id                 = module.mongodb_subnet.subnet_id
  network_security_group_id = module.mongonsg.network_security_group_id
}