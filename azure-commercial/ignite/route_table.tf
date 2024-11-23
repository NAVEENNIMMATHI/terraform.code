resource "azurerm_route_table" "aks_rtb" {
  name                          = "rtb-${var.location}-${var.project_name}-${var.application_acronym}-${var.engagement_name}${var.separator}${var.environment}"
  resource_group_name           = module.ignite_rg.resource_group_name
  location                      = module.ignite_rg.resource_group_location
  disable_bgp_route_propagation = false
  depends_on = [module.ignite_aks_subnet.subnet_id]

  tags                          = var.tags

route {
    name                   = "InternetToFirewall"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.AzureFirewallIPAddress
  }
}

### Route Table Associations
resource "azurerm_subnet_route_table_association" "aks_subnet" {
  subnet_id      = module.ignite_aks_subnet.subnet_id
  route_table_id = azurerm_route_table.aks_rtb.id
}
