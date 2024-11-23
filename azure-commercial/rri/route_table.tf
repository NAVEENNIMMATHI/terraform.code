resource "azurerm_route_table" "NextHopFw" {
  name                          = "rtb-${var.location}-${var.application_acronym}-${var.environment}"
  resource_group_name           = module.applicationrg.resource_group_name
  location                      = module.applicationrg.resource_group_location
  disable_bgp_route_propagation = false

  tags                          = var.tags

route {
    name                   = "InternetToFirewall"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.AzureFirewallIPAddress
  }
}

### Route Table Associations
resource "azurerm_subnet_route_table_association" "db_subnet" {
  subnet_id      = azurerm_subnet.rridbsubnet.id
  route_table_id = azurerm_route_table.NextHopFw.id
}

resource "azurerm_subnet_route_table_association" "pbi_subnet" {
  subnet_id      = azurerm_subnet.rripbisubnet.id
  route_table_id = azurerm_route_table.NextHopFw.id
}

resource "azurerm_subnet_route_table_association" "mgt_subnet" {
  subnet_id      = azurerm_subnet.rrimgtsubnet.id
  route_table_id = azurerm_route_table.NextHopFw.id
}

resource "azurerm_subnet_route_table_association" "web_subnet" {
  subnet_id      = azurerm_subnet.rriwebsubnet.id
  route_table_id = azurerm_route_table.NextHopFw.id
}

resource "azurerm_subnet_route_table_association" "apgw_subnet" {
  subnet_id      = azurerm_subnet.rriapgwsubnet.id
  route_table_id = azurerm_route_table.NextHopFw.id
}
