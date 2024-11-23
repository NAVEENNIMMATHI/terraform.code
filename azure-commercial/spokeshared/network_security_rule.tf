resource "azurerm_network_security_rule" "fastpathapplication_inbound_allow_443_KPMG_Trusted_NW" {
  name                        = "inbound_allow_443_from_KPMG_Trusted_NW"
  priority                    = 105
  direction                   = "Inbound"
  access                      = "Allow"
  description                 = "Access to FASTPATH Cloud Application should be restricted to KPMG Trusted network, refer DevOps 8372"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = var.gateway_whitelist_ips
  destination_address_prefix  = "*"
  resource_group_name         = module.sharedrg.resource_group_name
  network_security_group_name = module.appgatewaynsg.network_security_group_name
}

resource "azurerm_network_security_rule" "appgateway_inbound_allow_65503-65534" {
  name                        = "Port_65503-65534"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "65200-65535"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.sharedrg.resource_group_name
  network_security_group_name = module.appgatewaynsg.network_security_group_name
}

resource "azurerm_network_security_rule" "ase_inbound_allow_454-455" {
  name                        = "inbound_allow_454-455"
  priority                    = 125
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "454-455"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.sharedrg.resource_group_name
  network_security_group_name = module.asensg.network_security_group_name
}

resource "azurerm_network_security_rule" "ase_inbound_allow_443" {
  name                        = "Inbound_443"
  priority                    = 135
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.sharedrg.resource_group_name
  network_security_group_name = module.asensg.network_security_group_name
}

