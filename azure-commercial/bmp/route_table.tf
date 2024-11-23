resource "azurerm_route_table" "bmpazurefirewall" {
  name                          = "rtb-${var.location_acronym}-${var.application_acronym}-firewall-${var.environment_acronym}"
  location                      = module.applicationrg.resource_group_location
  resource_group_name           = module.applicationrg.resource_group_name
  disable_bgp_route_propagation = false

  route {
    name                        = "OutboundTraffictoAzureFirewall"
    address_prefix              = "0.0.0.0/0"
    next_hop_type               = "VirtualAppliance"
    next_hop_in_ip_address      = var.azfirewall_ip_address
  }

  tags                          = var.tags
}

resource "azurerm_route_table" "bmpsqlroutetable" {
  count                         = var.environment == "production" ? "1" : "0"

  name                          = var.environment == "production" ? "co-p-eastus-${var.application_acronym}sql-udr" : "rtb-${var.location_acronym}-${var.application_acronym}-mi-${var.environment_acronym}"
  location                      = module.applicationrg.resource_group_location
  resource_group_name           = module.applicationrg.resource_group_name
  disable_bgp_route_propagation = false

  tags = var.tags
}

resource "azurerm_route_table" "rt-uemcbmpdb1p1" {
  name                          = var.environment == "production" ? "rt-uemcbmpdb1p1" : "rtb-${var.location_acronym}-${var.application_acronym}-misql-${var.environment_acronym}"
  location                      = module.applicationrg.resource_group_location
  resource_group_name           = module.applicationrg.resource_group_name
  disable_bgp_route_propagation = false
  tags                          = var.tags
}

resource "azurerm_route_table" "aseroutetable" {
  
  name                          = "rtb-${var.location_acronym}-${var.application_acronym}-ase-${var.environment_acronym}"
  location                      = module.applicationrg.resource_group_location
  resource_group_name           = module.applicationrg.resource_group_name
  disable_bgp_route_propagation = false

  route {
    name                        = "ase-smtp-traffic-to-paloalto"
    address_prefix              = "199.207.144.9/32"
    next_hop_type               = "VirtualAppliance"
    next_hop_in_ip_address      =  var.azfirewall_ip_address
  }

  route {
    name                        = "ase-traffic-to-internet"
    address_prefix              = "0.0.0.0/0"
    next_hop_type               = "Internet"
  }

  tags                          = var.tags
}