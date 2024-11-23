resource "azurerm_route_table" "routetable" {
  name                          = var.environment == "production" ? "co-p-eastus-CLOtoPaloAlto-udr" : "rtb-${var.location_acronym}-${var.application_acronym}-clo-${var.environment_acronym}"
  location                      = module.vnetrg.resource_group_location
  resource_group_name           = module.vnetrg.resource_group_name
  disable_bgp_route_propagation = false

  route {
    name                        = var.environment == "production" ? "TrafficThroughPaloAlto" : "TrafficThroughAzureFirewall"
    address_prefix              = "0.0.0.0/0"
    next_hop_in_ip_address      = var.next_hop_in_ip_address
    next_hop_type               = "VirtualAppliance"
  }

  tags                          = var.tags
}


resource "azurerm_route_table" "routetableazfw" {
  name                          = "rtb-${var.location_acronym}-${var.application_acronym}-clo-${var.environment_acronym}"
  location                      = module.vnetrg.resource_group_location
  resource_group_name           = module.vnetrg.resource_group_name
  disable_bgp_route_propagation = false

  route {
    name                        =  "TrafficThroughAzureFirewall"
    address_prefix              = "0.0.0.0/0"
    next_hop_in_ip_address      = var.next_hop_in_ip_address
    next_hop_type               = "VirtualAppliance"
  }

  tags                          = var.tags
}
