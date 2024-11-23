resource "azurerm_subnet_route_table_association" "mgmt" {
  subnet_id      = azurerm_subnet.clomgmtsbn.id
  #route_table_id = azurerm_route_table.routetable.id
  route_table_id = azurerm_route_table.routetableazfw.id
}

resource "azurerm_subnet_route_table_association" "web" {
  subnet_id      = azurerm_subnet.clowebsbn.id
  #route_table_id = azurerm_route_table.routetable.id
  route_table_id = azurerm_route_table.routetableazfw.id
}

