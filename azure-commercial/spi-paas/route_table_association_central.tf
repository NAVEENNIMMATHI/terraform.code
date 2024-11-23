resource "azurerm_subnet_route_table_association" "spipass_central_wst1_subnet" {
  subnet_id      = azurerm_subnet.spiwst1_subnet_central.id
  route_table_id = azurerm_route_table.spipaascentraltoAzureFirewall.id
}

resource "azurerm_subnet_route_table_association" "spipass_central_vnetint_subnet" {
  subnet_id      = azurerm_subnet.spipaasvnetint_subnet_central.id
  route_table_id = azurerm_route_table.spipaasapplicationtoAzureFirewall.id
}