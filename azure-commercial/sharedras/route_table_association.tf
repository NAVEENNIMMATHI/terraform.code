resource "azurerm_subnet_route_table_association" "ase_route_association" {
  subnet_id      = module.asesubnet.subnet_id
  route_table_id = azurerm_route_table.aseroutetable-azfirewall.id
}
resource "azurerm_subnet_route_table_association" "adminvm_route_association" {
  subnet_id      = module.mgmtsubnet.subnet_id
  route_table_id = azurerm_route_table.vmroutetable-azfirewall.id
}
resource "azurerm_subnet_route_table_association" "buildvm_route_association" {
  subnet_id      = module.buildsubnet.subnet_id
  route_table_id = azurerm_route_table.vmroutetable-azfirewall.id
}