resource "azurerm_route_table" "spitoPaloAlto" {
  name                          = var.environment ==  "production" ? "co-${lower(var.environment_acronym)}-${var.location}-${var.application_acronym}toPaloAlto-udr" : "rtb-${var.location_acronym}-${var.application_acronym}-PaloAlto-${var.environment_acronym}"
  location                      = azurerm_resource_group.cospivnetrg.location
  resource_group_name           = azurerm_resource_group.cospivnetrg.name
  disable_bgp_route_propagation = false

  route {
    name                        = "OutboundTraffictoPaloAlto"
    address_prefix              = "0.0.0.0/0"
    next_hop_type               = "VirtualAppliance"
    next_hop_in_ip_address      = var.PaloAltoInboundIP
  }

  tags                          = var.tags
  
}

resource "azurerm_route_table" "AZFirewall" {
  name                          = var.environment ==  "production" ? "co-${lower(var.environment_acronym)}-${var.location}-azfirewall-udr" : "rtb-${var.location_acronym}-${var.application_acronym}-azfirewall-${var.environment_acronym}"
  location                      = azurerm_resource_group.cospivnetrg.location
  resource_group_name           = azurerm_resource_group.cospivnetrg.name
  disable_bgp_route_propagation = false

  route {
    name                        = "OutboundTrafficAZFirewall"
    address_prefix              = "0.0.0.0/0"
    next_hop_type               = "VirtualAppliance"
    next_hop_in_ip_address      = var.azfirewall_private_ip_address
  }

  tags                          = var.tags

}
