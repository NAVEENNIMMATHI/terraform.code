
resource "azurerm_route_table" "azfroutetable" {

  name                          = "rtb-${var.location_acronym}-${var.application_acronym}-app-azfw-${var.environment_acronym}"
  location                      = var.location
  resource_group_name           = module.opkey_rg.resource_group_name
  disable_bgp_route_propagation = false

  route {
    name                        = "EgressTraffictoAzureFirewall"
    address_prefix              = "0.0.0.0/0"
    next_hop_type               = "VirtualAppliance"
    next_hop_in_ip_address      = var.firewall_primary_core
  }

  tags = var.tags
}
