resource "azurerm_subnet_route_table_association" "avscanvm_route_association" {
  subnet_id      = module.mdp_subnet_avscan.subnet_id
  route_table_id = azurerm_route_table.vmroutetable-azfirewall.id
 
}

resource "azurerm_subnet_route_table_association" "iicsvm_route_association" {
  subnet_id      = module.iicssubnet.subnet_id
  route_table_id = azurerm_route_table.vmroutetable-azfirewall.id
 
}


resource "azurerm_subnet_route_table_association" "functionapp_route_association" {
  subnet_id      = module.mdp_subnet_funapp.subnet_id
  route_table_id = azurerm_route_table.vmroutetable-azfirewall.id
 
}

resource "azurerm_subnet_route_table_association" "apim_route_association" {
  subnet_id      = module.mdp_subnet_apim.subnet_id
  route_table_id = azurerm_route_table.vmroutetable-azfirewall.id
 
}

resource "azurerm_subnet_route_table_association" "mdp_aks_route_association" {
  subnet_id      = module.mdp_aks_subnet.subnet_id
  route_table_id = azurerm_route_table.vmroutetable-azfirewall.id
}

resource "azurerm_subnet_route_table_association" "mdp_appintg_route_association" {
  subnet_id      = module.appintgsubnet.subnet_id
  route_table_id = azurerm_route_table.vmroutetable-azfirewall.id
}

