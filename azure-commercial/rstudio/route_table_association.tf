data "azurerm_route_table" "route_table" {
  name                = var.route_table_name
  resource_group_name = var.route_table_rg_name  
}

resource "azurerm_subnet_route_table_association" "spirstudioSubnet" {
  subnet_id      = module.subnet.subnet_id
  route_table_id = data.azurerm_route_table.route_table.id
}

resource "azurerm_subnet_route_table_association" "spirstudioGurobiSubnet" {
  subnet_id      = module.gurobi_subnet.subnet_id
  route_table_id = data.azurerm_route_table.route_table.id
}

resource "azurerm_subnet_route_table_association" "spirstudioWindowsSubnet" {
  subnet_id      = module.windows_subnet.subnet_id
  route_table_id = data.azurerm_route_table.route_table.id
}