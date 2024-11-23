data "azurerm_route_table" "route_table" {
  count = var.restrict_gateway_endpoint == "true" ? 0 : 1

  name                = var.route_table_name
  resource_group_name = var.route_table_rg_name  
}


resource "azurerm_subnet_route_table_association" "vm_route_association" {
  count = var.restrict_gateway_endpoint == "true" ? 0 : 1

  subnet_id      = module.subnet.subnet_id
  route_table_id = data.azurerm_route_table.route_table[0].id
}
