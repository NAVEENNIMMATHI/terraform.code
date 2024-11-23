resource "azurerm_subnet_route_table_association" "subnetrouteassociation" {
  subnet_id      = module.applicationsubnet.subnet_id
  route_table_id = azurerm_route_table.routetable.id
  
 
}