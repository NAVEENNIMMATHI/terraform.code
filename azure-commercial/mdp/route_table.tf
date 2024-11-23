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
  provider            = azurerm.firewall
}

resource "azurerm_route_table" "vmroutetable-azfirewall" {
  name                          = "rtb-${var.location_acronym}-${lower(var.application_acronym)}-azfw-${lower(var.environment_acronym)}"
  location                      = module.mdp_rg_main.resource_group_location
  resource_group_name           = module.mdp_rg_main.resource_group_name
  disable_bgp_route_propagation = false
  route {
    name                   = "OutboundTraffictoAzureFirewall"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = data.azurerm_firewall.firewall.ip_configuration[0].private_ip_address
  }
  route {
    address_prefix         = "52.224.186.99/32"
		name                   = "controlplanpip_Allow_eastus"
		next_hop_type          = "Internet"
  }
  route {
    address_prefix         = "20.44.72.3/32"
		name                   = "controlplanpip_Allow_eastus2"
		next_hop_type          = "Internet"
  }
  route {
    address_prefix         = "104.214.19.224/32"
		name                   = "controlplanpip_Allow_global_1"
		next_hop_type          = "Internet"
  }
  route {
    address_prefix         = "52.162.110.80/32"
		name                   = "controlplanpip_Allow_global_2"
		next_hop_type          = "Internet"
  }
  route {
    address_prefix         = "52.183.41.109/32"
		name                   = "contralplanepublicIP_global_3"
		next_hop_type          = "Internet"
  }


  tags = var.tags
}
