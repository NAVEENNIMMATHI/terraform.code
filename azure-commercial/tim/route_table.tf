resource "azurerm_route_table" "routetable" {
  name                          = "rtb-${var.location_acronym}-${var.application_acronym}-app-${var.environment_acronym}"
  resource_group_name           = module.timrg.resource_group_name
  location                      = module.timrg.resource_group_location
  disable_bgp_route_propagation = "false"

  route {
    #name                  = var.environment == "production" ? "OutboundTraffictoPaloAlto" : "OutboundTrafficToAzureFirewall"
    name                   = "OutboundTrafficToAzureFirewall"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.route_next_hop_in_ip_address
  }
  tags = var.tags
}

