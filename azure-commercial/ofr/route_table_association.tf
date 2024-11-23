resource "azurerm_subnet_route_table_association" "azure_firewall" {
  subnet_id      = azurerm_subnet.build.id
  route_table_id = azurerm_route_table.azure_firewall.id
}