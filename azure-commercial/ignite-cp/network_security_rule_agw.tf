resource "azurerm_network_security_rule" "agw_in_gateway_manager_allow" {
    name                        = "agw-in-gateway-manager-allow"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "65200-65535"
    source_address_prefix       = "GatewayManager"
    destination_address_prefix  = "*"
    resource_group_name         = module.ignite_rg.resource_group_name
    network_security_group_name = azurerm_network_security_group.ignite_agw_nsg.name
}

#resource "azurerm_network_security_rule" "agw_in_gateway_ssl_allow" {
#    name                        = "agw-in-gateway-ssl-allow"
#    priority                    = 110
#    direction                   = "Inbound"
#    access                      = "Allow"
#    protocol                    = "Tcp"
#    source_port_range           = "*"
#    destination_port_range      = "443"
#    source_address_prefixes     = var.aks_api_allow_ip_list
#    destination_address_prefix  = "*"
#    resource_group_name         = module.ignite_rg.resource_group_name
#   network_security_group_name = azurerm_network_security_group.ignite_agw_nsg.name
#}

resource "azurerm_network_security_rule" "igniteapplication_inbound_allow_443_KPMG_Trusted_NW" {
  name                        = "inbound_allow_443_from_KPMG_Trusted_NW"
  priority                    = 300
  direction                   = "Inbound"
  access                      = "Allow"
  description                 = "Access to ignite aplication should be restricted to KPMG Trusted network"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = var.vpn_whitelist_ips
  destination_address_prefix  = "*"
  resource_group_name         = module.ignite_rg.resource_group_name
  network_security_group_name = azurerm_network_security_group.ignite_agw_nsg.name
}
/*
resource "azurerm_network_security_rule" "Inbound_VirtualNetwork_agw" {
  name                        = "Inbound_VirtualNetwork"
  priority                    =  4096
  direction                   = "Inbound"
  access                      = "Deny"
  description                 = "Deny agw subnet"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = module.ignite_rg.resource_group_name
  network_security_group_name = azurerm_network_security_group.ignite_agw_nsg.name

}
*/