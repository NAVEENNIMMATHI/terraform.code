resource "azurerm_route_table" "aseroutetable" {
  name                          = var.ase_routetable_name
  location                      = module.applicationrg.resource_group_location
  resource_group_name           = module.applicationrg.resource_group_name
  disable_bgp_route_propagation = false

  route {
    name                   = "ase-smtp-traffic-to-paloalto"
    address_prefix         = "199.207.144.9/32"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.PaloInboundIPAddress
  }

  route {
    name           = "ase-traffic-to-internet"
    address_prefix = "0.0.0.0/0"
    next_hop_type  = "Internet"
  }

  tags = var.tags
}

resource "azurerm_route_table" "miroutetable" {
  name                          = var.mi_routetable_name
  location                      = module.applicationrg.resource_group_location
  resource_group_name           = module.applicationrg.resource_group_name
  disable_bgp_route_propagation = false

  tags = var.tags
}

