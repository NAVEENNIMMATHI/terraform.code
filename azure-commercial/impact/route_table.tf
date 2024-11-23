
resource "azurerm_route_table" "applicationtoAzureFirewall" {
  name                          = "rtb-${var.location_acronym}-${var.application_acronym}-azfw-${var.environment_acronym}"
  location                      = module.impact_rg.resource_group_location
  resource_group_name           = module.impact_rg.resource_group_name
  disable_bgp_route_propagation = false

  route {
    name                   = "OutboundTraffictoAzureFirewall"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.azfirewall_ip_address
  }

  tags = var.tags

}
