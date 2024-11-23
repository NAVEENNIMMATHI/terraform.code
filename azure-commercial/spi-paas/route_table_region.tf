resource "azurerm_route_table" "spipaaswsttoAzureFirewall" {
  for_each = var.application_rg
  name                          = "rtb-${each.value.location_acronym}-${var.application_acronym}-${each.value.region}-azfw-${var.environment_acronym}"
  resource_group_name          =  module.applicationrg[each.key].resource_group_name
  location                     =  module.applicationrg[each.key].resource_group_location
  disable_bgp_route_propagation = false

  route {
    name                        = "OutboundTraffictoAzureFirewall"
    address_prefix              = "0.0.0.0/0"
    next_hop_type               = "VirtualAppliance"
    next_hop_in_ip_address      =  var.azfirewall_ip_address
  }

  tags                          = var.tags
  
}
resource "azurerm_route_table" "spipaaswebapptoAzureFirewall" {
  for_each = var.application_rg
  name                          = "rtb-${each.value.location_acronym}-${var.application_acronym}-${each.value.region}-app-${var.environment_acronym}"
  resource_group_name          =  module.applicationrg[each.key].resource_group_name
  location                     =  module.applicationrg[each.key].resource_group_location
  disable_bgp_route_propagation = false

  route {
    name                        = "OutboundTraffictoAzureFirewall"
    address_prefix              = "0.0.0.0/0"
    next_hop_type               = "VirtualAppliance"
    next_hop_in_ip_address      =  var.azfirewall_ip_address
  }

  tags                          = var.tags
  
}
resource "azurerm_route_table" "ssistoAzureFirewall" {
  for_each = var.application_rg
  name                          = "rtb-${each.value.location_acronym}-${var.application_acronym}-${each.value.region}-ssis-${var.environment_acronym}"
  resource_group_name          =  module.applicationrg[each.key].resource_group_name
  location                     =  module.applicationrg[each.key].resource_group_location
  disable_bgp_route_propagation = false

  route {
    name                        = "SmtpOutboundTraffictoAzureFirewall"
    address_prefix              = "199.207.144.9/32"
    next_hop_type               = "VirtualAppliance"
    next_hop_in_ip_address      =  var.azfirewall_ip_address
  }
route {
    name                        = "ssis-traffic-to-internet"
    address_prefix              = "0.0.0.0/0"
    next_hop_type               = "Internet"
  }
  tags                          = var.tags
  
}