resource "azurerm_subnet_route_table_association" "controlplane" {
  subnet_id      = azurerm_subnet.controlplane.id
  route_table_id = azurerm_route_table.routetable.id
}

resource "azurerm_subnet_route_table_association" "webapp" {
  subnet_id      = azurerm_subnet.webapp.id
  route_table_id = azurerm_route_table.routetable.id
}

resource "azurerm_subnet_route_table_association" "sqlmi" {
  subnet_id      = azurerm_subnet.sqlmi.id
  route_table_id = azurerm_route_table.routetablesqlmi.id
}