resource "azurerm_subnet_route_table_association" "backend" {
  subnet_id      = azurerm_subnet.backend.id
  #route_table_id = var.environment == "production" ? azurerm_route_table.routetable.id : azurerm_route_table.AZFirewall.id
  route_table_id = azurerm_route_table.AZFirewall.id
}