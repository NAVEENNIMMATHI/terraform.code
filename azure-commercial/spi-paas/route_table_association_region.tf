resource "azurerm_subnet_route_table_association" "spipass_vnetint_subnet" {
  for_each = var.vnetint_subnet
  subnet_id      = azurerm_subnet.spipaasvnetint_subnet[each.key].id
  route_table_id = azurerm_route_table.spipaaswebapptoAzureFirewall[each.key].id
}

resource "azurerm_subnet_route_table_association" "spipass_wst1_subnet" {
  for_each = var.wst_subnet
  subnet_id      = azurerm_subnet.spipaaswst_subnet[each.key].id
  route_table_id = azurerm_route_table.spipaaswsttoAzureFirewall[each.key].id
}
resource "azurerm_subnet_route_table_association" "spipass_pbi_subnet" {
  for_each = var.pbi_subnet
  subnet_id      = azurerm_subnet.spipaaspbi_subnet[each.key].id
  route_table_id = azurerm_route_table.spipaaswsttoAzureFirewall[each.key].id
}
resource "azurerm_subnet_route_table_association" "spipaas_ssis_subnet" {
  for_each = var.ssis_subnet
  subnet_id      = azurerm_subnet.spipaasssis_subnet[each.key].id
  route_table_id = azurerm_route_table.ssistoAzureFirewall[each.key].id
}