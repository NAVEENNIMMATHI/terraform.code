provider "azurerm" {
  alias           = "firewall"
  subscription_id = var.azfwsubscriptionid
   client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  features {    
  }
}
data "azurerm_firewall" "firewall" {
  name                = var.firewall_network_name
  resource_group_name = var.firewall_network_rg_name
  provider = azurerm.firewall
}

resource "azurerm_route_table" "vmroutetable-azfirewall" {  
  name                          = "rtb-vm-azfw-${var.location_acronym}-${lower(var.application_acronym)}-shared-${lower(var.environment_acronym)}"
  location                      = module.sharedrg.resource_group_location
  resource_group_name           = module.sharedrg.resource_group_name
  disable_bgp_route_propagation = false
  route {
    name                        = "ase-traffic-to-internet"
    address_prefix              = "0.0.0.0/0"
    next_hop_type               = "VirtualAppliance"
    next_hop_in_ip_address      = data.azurerm_firewall.firewall.ip_configuration[0].private_ip_address
  }
  tags                          = var.tags
}

resource "azurerm_route_table" "aseroutetable-azfirewall" {
  name                          = "rtb-ase-azfw-${var.location_acronym}-spokeapp-shared-${lower(var.environment_acronym)}"
  location                      = module.sharedrg.resource_group_location
  resource_group_name           = module.sharedrg.resource_group_name
  disable_bgp_route_propagation = false

  route {
    name                        = "ase-smtp-traffic-through-AzFirewall"
    address_prefix              = "199.207.144.9/32"
    next_hop_type               = "VirtualAppliance"
    next_hop_in_ip_address      = data.azurerm_firewall.firewall.ip_configuration[0].private_ip_address
  }

  route {
    name                        = "ase-traffic-to-internet"
    address_prefix              = "0.0.0.0/0"
    next_hop_type               = "Internet"
  }

  tags                          = var.tags
}