resource "azurerm_route_table" "azure_firewall" {
  name                          = "rtb-${var.location_acronym}-${var.application_acronym}-firewall-${var.environment_acronym}"
  location                      = azurerm_resource_group.ofr.location
  resource_group_name           = azurerm_resource_group.ofr.name
  disable_bgp_route_propagation = false

  route {
    name                        = "OutboundTraffictoAzureFirewall"
    address_prefix              = "0.0.0.0/0"
    next_hop_type               = "VirtualAppliance"
    next_hop_in_ip_address      = var.firewall_ip_address
  }

  tags                          = var.tags  
}