resource "azurerm_route_table" "eccm_rtb" {
  name                          = "rtb-${var.location_acronym}-${var.application_acronym}-azfw-${var.environment_acronym}"
  resource_group_name           = module.eccm_rg.resource_group_name
  location                      = module.eccm_rg.resource_group_location

  tags                          = var.tags

route {
    name                   = "OutboundtrafficToFirewall"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.AzureFirewallIPAddress
  }
}
