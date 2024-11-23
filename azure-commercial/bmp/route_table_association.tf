resource "azurerm_subnet_route_table_association" "bmpapp1subnet_subnet" {
  subnet_id      = azurerm_subnet.bmpapp1subnet.id
  route_table_id = azurerm_route_table.bmpazurefirewall.id
}

resource "azurerm_subnet_route_table_association" "kpimcapiqsubnet_subnet" {
  subnet_id      = azurerm_subnet.kpimcapiqsubnet.id
  route_table_id = azurerm_route_table.bmpazurefirewall.id
}

resource "azurerm_subnet_route_table_association" "bmprest1subnet_subnet" {
  subnet_id      = azurerm_subnet.bmprest1subnet.id
  route_table_id = azurerm_route_table.bmpazurefirewall.id
}

resource "azurerm_subnet_route_table_association" "bmpinformaticasubnet_subnet" {
  subnet_id      = azurerm_subnet.bmpinformaticasubnet.id
  route_table_id = azurerm_route_table.bmpazurefirewall.id
}

resource "azurerm_subnet_route_table_association" "bmpdb1subnet_subnet" {
  subnet_id      = azurerm_subnet.bmpdb1subnet.id
  route_table_id = azurerm_route_table.rt-uemcbmpdb1p1.id
}

resource "azurerm_subnet_route_table_association" "bmpasesubnet_rta" {
  subnet_id      = azurerm_subnet.bmpasesubnet.id
  route_table_id = azurerm_route_table.aseroutetable.id
}

resource "azurerm_subnet_route_table_association" "bmppesubnet_rta" {
  subnet_id      = azurerm_subnet.bmppesubnet.id
  route_table_id = azurerm_route_table.bmpazurefirewall.id
}