resource "azurerm_subnet_route_table_association" "aks" {
  count = 1

  subnet_id      = azurerm_subnet.aks[0].id
  route_table_id = data.azurerm_route_table.firewallroutetable.id
}

resource "azurerm_subnet_route_table_association" "aks_paired_rt" {
  count = var.environment_acronym == "dv" || var.environment_acronym == "pd" ? 1 : 0

  subnet_id      = azurerm_subnet.aks_paired[0].id
  route_table_id = data.azurerm_route_table.firewallroutetable_paired[0].id
}