resource "azurerm_network_security_rule" "Inbound_Allow_443_From_KPMG_On-Premise_central_agw1nsg" {
  name                        = "Inbound_Allow_443_From_KPMG_On-Premise"
  priority                    = 103
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = var.KPMG_On-Premise
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg_central.resource_group_name
  network_security_group_name = module.agw1nsg_central.network_security_group_name
}
resource "azurerm_network_security_rule" "Inbound_Allow_443_From_KPMG_VPN_central_agw1nsg" {
  name                        = "Inbound_Allow_443_From_KPMG_VPN"
  priority                    = 104
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = var.KPMG_VPN_US
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg_central.resource_group_name
  network_security_group_name = module.agw1nsg_central.network_security_group_name
}

resource "azurerm_network_security_rule" "Inbound_Allow_443_From_KGS_Bangalore_central_agw1nsg" {
  name                        = "Inbound_Allow_443_From_KGS_Bangalore"
  priority                    = 105
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = var.KGS_Bangalore
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg_central.resource_group_name
  network_security_group_name = module.agw1nsg_central.network_security_group_name
}
/*
resource "azurerm_network_security_rule" "Inbound_Allow_443_From_UK_central_agw1nsg" {
  name                        = "Inbound_Allow_443_From_UK_central"
  priority                    = 106
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = var.KPMG_VPN_UK
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg_central.resource_group_name
  network_security_group_name = module.agw1nsg_central.network_security_group_name
}*/
resource "azurerm_network_security_rule" "Inbound_Allow_443_From_BR_central_agw1nsg" {
  name                        = "Inbound_Allow_443_From_BR_central"
  priority                    = 107
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = var.KPMG_VPN_BR
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg_central.resource_group_name
  network_security_group_name = module.agw1nsg_central.network_security_group_name
}
resource "azurerm_network_security_rule" "Inbound_Allow_443_From_CN_central_agw1nsg" {
  name                        = "Inbound_Allow_443_From_CN_central"
  priority                    = 108
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = var.KPMG_VPN_CN
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg_central.resource_group_name
  network_security_group_name = module.agw1nsg_central.network_security_group_name
}
resource "azurerm_network_security_rule" "Inbound_Allow_443_From_AU_central_agw1nsg" {
  name                        = "Inbound_Allow_443_From_AU_central"
  priority                    = 109
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = var.KPMG_VPN_AU
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg_central.resource_group_name
  network_security_group_name = module.agw1nsg_central.network_security_group_name
}
resource "azurerm_network_security_rule" "Inbound_Allow_443_From_AZFW_PIP_agw1nsg" {
  name                        = "Inbound_Allow_443_From_AZFW_PIP"
  priority                    = 166
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = var.AZFW_PIP
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg_central.resource_group_name
  network_security_group_name = module.agw1nsg_central.network_security_group_name
}
resource "azurerm_network_security_rule" "Inbound_Allow_443_From_KIP_ASE_agw1nsg" {
  name                        = "Inbound_Allow_443_From_KIP_ASE"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix     = var.KIP_ASE_PIP
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg_central.resource_group_name
  network_security_group_name = module.agw1nsg_central.network_security_group_name
}

resource "azurerm_network_security_rule" "Inbound_Allow_65503-65534_From_Azure_Infrastructure_Communication_central_agw1nsg" {
  name                        = "Inbound_Allow_65503-65534_From_Azure_Infrastructure_Communication"
  priority                    = 301
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "65503-65534"
  source_address_prefix       = "GatewayManager"
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg_central.resource_group_name
  network_security_group_name = module.agw1nsg_central.network_security_group_name
}
resource "azurerm_network_security_rule" "Inbound_Allow_443_From_central_Application_Gateway" {
  name                        = "Inbound_Allow_443_From_Application_Gateway"
  priority                    = 101
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = var.agw1_subnet_adress_space_central
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg_central.resource_group_name
  network_security_group_name = module.app1nsg_central.network_security_group_name
}
