resource "azurerm_subnet_route_table_association" "appsubnet_route_association" {
  subnet_id      = module.appsubnet.subnet_id
  route_table_id = module.approutetable.route_table_id
}
resource "azurerm_subnet_route_table_association" "acisubnet_route_association" {
  subnet_id      = azurerm_subnet.acisubnet.id
  route_table_id = module.aciroutetable.route_table_id
}