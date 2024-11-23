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

resource "azurerm_network_security_rule" "agw_in_gateway_ssl_allow" {
    name                        = "agw-in-gateway-ssl-allow"
    priority                    = 110
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "443"
    source_address_prefixes     = var.aks_api_allow_ip_list
    destination_address_prefix  = "*"
    resource_group_name         = module.ignite_rg.resource_group_name
    network_security_group_name = azurerm_network_security_group.ignite_agw_nsg.name
}