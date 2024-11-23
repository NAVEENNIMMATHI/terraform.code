resource "azurerm_subnet_route_table_association" "tabext_route_table_association" {
  count          = var.environment == "production" ? "0" : "1"

  subnet_id      = module.tabext_subnet.subnet_id
  route_table_id = data.azurerm_route_table.route_table.id
}