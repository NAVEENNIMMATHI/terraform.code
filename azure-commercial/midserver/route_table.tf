resource "azurerm_route_table" "midserver-rt" {
  name                          = "rtb-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  location                      = module.midserver-rg.resource_group_location
  resource_group_name           = module.midserver-rg.resource_group_name
  disable_bgp_route_propagation = false
  tags                          = var.tags

  route {
    name                   = "InternetToFirewall"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.fw_ip
  }
}

