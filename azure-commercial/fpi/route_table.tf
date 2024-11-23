resource "azurerm_route_table" "routetable" {
  name                          = var.environment == "production" ? "co-p-eastus-fpitoPaloAlto-udr" : "rtb-${var.location_acronym}-${var.application_acronym}-PaloAlto-${var.environment_acronym}"
  resource_group_name           = module.rgfpi.resource_group_name
  location                      = module.rgfpi.resource_group_location
  disable_bgp_route_propagation = false
  tags                          = var.tags

  route {
    name                        = "OutboundTraffictoPaloAlto"
    address_prefix              = "0.0.0.0/0"
    next_hop_type               = "VirtualAppliance"
    next_hop_in_ip_address      = var.paloalto_hop_address
  }
}

resource "azurerm_route_table" "AZFirewall" {
  #name                         = var.environment == "production" ? "co-p-eastus-fpitoPaloAlto-udr" : "rtb-${var.location_acronym}-${var.application_acronym}-PaloAlto-${var.environment_acronym}"
  name                          = "rtb-${var.location_acronym}-${var.application_acronym}-azfirewall-${var.environment_acronym}"
  resource_group_name           = module.rgfpi.resource_group_name
  location                      = module.rgfpi.resource_group_location
  disable_bgp_route_propagation = false
  tags                          = var.tags

  route {
    name                        = "OutboundTrafficAZFirewall"
    address_prefix              = "0.0.0.0/0"
    next_hop_type               = "VirtualAppliance"
    next_hop_in_ip_address      = data.azurerm_firewall.firewall.ip_configuration.0.private_ip_address
  }
    
}