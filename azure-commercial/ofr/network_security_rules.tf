resource "azurerm_network_security_rule" "allow_gateway_manager" {
  name                        = "Allow_Gateway_Manager"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "65503-65534"
  source_address_prefix       = "GatewayManager"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.ofr.name
  network_security_group_name = azurerm_network_security_group.agw.name
}

resource "azurerm_network_security_rule" "allow_https_agw" {
  name                        = "Allow_HTTPS_agw"
  priority                    = 120
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = var.app_gw_allowed_ip_range
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.ofr.name
  network_security_group_name = azurerm_network_security_group.agw.name
}
