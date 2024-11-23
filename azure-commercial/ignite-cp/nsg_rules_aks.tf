resource "azurerm_network_security_rule" "aks_out_ssl_allow" {
  name                        = "aks-out-ssl-allow"
  priority                    = 140
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_ranges     = ["80", "443"]
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.ignite_rg.resource_group_name
  network_security_group_name = azurerm_network_security_group.ignite_aks_nsg.name
}

resource "azurerm_network_security_rule" "aks_out_kubectl_udp_allow" {
  name                        = "aks-out-kubectl-udp-allow"
  priority                    = 150
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Udp"
  source_port_range           = "*"
  destination_port_range      = "1194"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.ignite_rg.resource_group_name
  network_security_group_name = azurerm_network_security_group.ignite_aks_nsg.name
}
resource "azurerm_network_security_rule" "aks_out_kubectl_allow" {
  name                        = "aks-out-kubectl-tcp-allow"
  priority                    = 120
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "9000"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.ignite_rg.resource_group_name
  network_security_group_name = azurerm_network_security_group.ignite_aks_nsg.name
}

resource "azurerm_network_security_rule" "aks_out_kubectl_ntp_allow" {
  name                        = "aks-out-ntp-allow"
  priority                    = 160
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Udp"
  source_port_range           = "*"
  destination_port_range      = "123"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.ignite_rg.resource_group_name
  network_security_group_name = azurerm_network_security_group.ignite_aks_nsg.name
}

resource "azurerm_network_security_rule" "aks_out_kubectl_dns_allow" {
  name                        = "aks-out-dns-allow"
  priority                    = 180
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Udp"
  source_port_range           = "*"
  destination_port_range      = "53"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.ignite_rg.resource_group_name
  network_security_group_name = azurerm_network_security_group.ignite_aks_nsg.name
}

resource "azurerm_network_security_rule" "aks_out_ssh_allow" {
  name                        = "aks-out-ssh-allow"
  priority                    = 170
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.ignite_rg.resource_group_name
  network_security_group_name = azurerm_network_security_group.ignite_aks_nsg.name
}

