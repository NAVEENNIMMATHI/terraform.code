### Route Table Associations

resource "azurerm_subnet_route_table_association" "spiweb1_subnet" {
  subnet_id      = azurerm_subnet.spiweb1_subnet.id
  route_table_id = azurerm_route_table.AZFirewall.id  
}

resource "azurerm_subnet_route_table_association" "spiapp1_subnet" {
  subnet_id      = azurerm_subnet.spiapp1_subnet.id
  route_table_id = azurerm_route_table.AZFirewall.id
}

resource "azurerm_subnet_route_table_association" "spidb1_subnet" {
  subnet_id      = azurerm_subnet.spidb1_subnet.id
  route_table_id = azurerm_route_table.AZFirewall.id
}

resource "azurerm_subnet_route_table_association" "bstn_subnet" {
  count          = var.environment == "production" ? "0" : "1"
  subnet_id      = azurerm_subnet.bstn_subnet.id
  route_table_id = azurerm_route_table.AZFirewall.id
}