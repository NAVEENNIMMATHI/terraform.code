resource "azurerm_subnet_route_table_association" "krtapp1subnet" {
  subnet_id      = module.krtapp1subnet.subnet_id
  route_table_id = azurerm_route_table.azurefirewall.id
}

resource "azurerm_subnet_route_table_association" "krtase1subnet" {
  subnet_id      = module.krtase1subnet.subnet_id
  route_table_id = azurerm_route_table.aseroutetable.id
}