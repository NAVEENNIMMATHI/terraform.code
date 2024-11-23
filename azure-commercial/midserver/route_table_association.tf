resource "azurerm_subnet_route_table_association" "buildvm_route_association" {
  subnet_id      = module.midserver-subnet.subnet_id
  route_table_id = azurerm_route_table.midserver-rt.id
}