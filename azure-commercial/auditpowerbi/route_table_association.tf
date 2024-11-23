resource "azurerm_subnet_route_table_association" "auditwst_route_association" {
  subnet_id      = module.auditwstsubnet.subnet_id
  route_table_id = data.azurerm_route_table.routetable.id
}
