resource "azurerm_network_security_rule" "aks_agw_manager_rule" {
  name                        = "aks-agw-manager-rule"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "65200-65535"
  source_address_prefix       = "GatewayManager"
  destination_address_prefix  = "*"
  resource_group_name         = data.azurerm_resource_group.hubvnet.name
  network_security_group_name = azurerm_network_security_group.aks_agw.name
}

resource "azurerm_network_security_rule" "aks_agw_inbound_allow_rule" {
  name                        = "aks-agw-inbound-allow-rule"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = concat(var.aks_agw_allow_ip_list, var.aks_agw_allow_ip_list_kgs)
  destination_address_prefix  = "*"
  resource_group_name         = data.azurerm_resource_group.hubvnet.name
  network_security_group_name = azurerm_network_security_group.aks_agw.name
}