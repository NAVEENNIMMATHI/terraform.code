data "azurerm_firewall" "firewall" {
  name                = var.firewall_network_name
  resource_group_name = var.firewall_network_rg_name
  provider = azurerm.core
}

resource "azurerm_route_table" "aseroutetable" {  
  name                          = "rtb-ase-usc-${lower(var.application_acronym)}-shared-${lower(var.environment_acronym)}"
  location                      = module.applicationrg.resource_group_location
  resource_group_name           = module.applicationrg.resource_group_name
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

  route {
    name                        = "rri-pe-subnet-traffic-through-AzFirewall"
    address_prefix              = var.rri_pe_subnet_address_space
    next_hop_type               = "VirtualAppliance"
    next_hop_in_ip_address      = data.azurerm_firewall.firewall.ip_configuration[0].private_ip_address
  }

  route {
    name                        = "kip-pe-subnet-traffic-through-AzFirewall"
    address_prefix              = var.kip_pe_subnet_address_space
    next_hop_type               = "VirtualAppliance"
    next_hop_in_ip_address      = var.environment_acronym == "ut" ? "10.30.3.4" : data.azurerm_firewall.firewall.ip_configuration[0].private_ip_address # KIP traffic needs to be sent KIP Staging which is behind PROD AZ FW
  }

  tags                          = var.tags
}

resource "azurerm_route_table" "vmroutetable" {  
  name                          = "rtb-vm-usc-${lower(var.application_acronym)}-shared-${lower(var.environment_acronym)}"
  location                      = module.applicationrg.resource_group_location
  resource_group_name           = module.applicationrg.resource_group_name
  disable_bgp_route_propagation = false
  route {
    name                        = "ase-traffic-to-internet"
    address_prefix              = "0.0.0.0/0"
    next_hop_type               = "VirtualAppliance"
    next_hop_in_ip_address      = data.azurerm_firewall.firewall.ip_configuration[0].private_ip_address
  }
  tags                          = var.tags
}