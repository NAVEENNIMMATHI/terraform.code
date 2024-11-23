resource "azurerm_network_security_rule" "ase_inbound_allow_454-455" {
  name                          = "inbound_allow_454-455"
  priority                      = 125
  direction                     = "Inbound"
  access                        = "Allow"
  protocol                      = "Tcp"
  source_port_range             = "*"
  destination_port_range        = "454-455"
  source_address_prefix         = "*"
  destination_address_prefix    = "*"
  resource_group_name           = module.sharedrg.resource_group_name
  network_security_group_name   = module.asensg.network_security_group_name
}
resource "azurerm_network_security_rule" "ase_inbound_allow_443" {
    name                       = "Inbound_443"
    priority                   = 135
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    resource_group_name         = module.sharedrg.resource_group_name
    network_security_group_name  = module.asensg.network_security_group_name
}

resource "azurerm_network_security_rule" "InboundAseInternal" {
  name                        = "InboundAseInternal"
  priority                    = 145
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_ranges     = ["443", "80"]
  source_address_prefix       = var.ase_subnet_address_prefix
  destination_address_prefix  = "*"
   resource_group_name        = module.sharedrg.resource_group_name
  network_security_group_name = module.asensg.network_security_group_name
}

resource "azurerm_network_security_rule" "inbound_allow_internalASE" {
  name                        = "inbound_ASE_Internal_Inbound"
  priority                    = 150
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = var.ase_subnet_address_prefix
  destination_address_prefix  = "*"
   resource_group_name         = module.sharedrg.resource_group_name
  network_security_group_name = module.asensg.network_security_group_name
}

resource "azurerm_network_security_rule" "outbound_allow_443" {
  description                 = "outbound_443"
  name                        = "outbound_443"
  priority                    = 200
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
   resource_group_name         = module.sharedrg.resource_group_name
  network_security_group_name = module.asensg.network_security_group_name
}

resource "azurerm_network_security_rule" "outbound_allow_smb445" {
  description                 = "outbound_445"
  name                        = "outbound_445"
  priority                    = 210
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "445"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
   resource_group_name         = module.sharedrg.resource_group_name
  network_security_group_name = module.asensg.network_security_group_name
}

resource "azurerm_network_security_rule" "outbound_allow_db" {
  description                 = "outbound_db"
  name                        = "outbound_db"
  priority                    = 220
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "1433"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
   resource_group_name         = module.sharedrg.resource_group_name
  network_security_group_name = module.asensg.network_security_group_name
}

resource "azurerm_network_security_rule" "outbound_allow_db2" {
  description                 = "outbound_db2"
  name                        = "outbound_db2"
  priority                    = 230
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "11000-11999"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
   resource_group_name         = module.sharedrg.resource_group_name
  network_security_group_name = module.asensg.network_security_group_name
}

resource "azurerm_network_security_rule" "outbound_allow_dns" {
  description                 = "outbound_dns"
  name                        = "outbound_dns"
  priority                    = 240
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "53"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.sharedrg.resource_group_name
  network_security_group_name = module.asensg.network_security_group_name
}

resource "azurerm_network_security_rule" "outbound_allow_ASE-internal" {
  description                 = "outbound_ase_internal"
  name                        = "outbound_ase_internal"
  priority                    = 260
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
   resource_group_name         = module.sharedrg.resource_group_name
  network_security_group_name = module.asensg.network_security_group_name
}

#--------------for Application gateway  Subnet------------#
resource "azurerm_network_security_rule" "inbound_allow_443_agw" {
  name                   = "inbound_allow_443"
  priority               = 100
  direction              = "Inbound"
  access                 = "Allow"
  protocol               = "*"
  source_port_range      = "*"
  destination_port_range = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.sharedrg.resource_group_name
  network_security_group_name = module.agwnsg.network_security_group_name
}

resource "azurerm_network_security_rule" "Port_65503-65534__agw" {
  name                        = "Port_65503-65534"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "65503-65534"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.sharedrg.resource_group_name
  network_security_group_name = module.agwnsg.network_security_group_name
}


resource "azurerm_network_security_rule" "inbound_allow_443_powerappstoagwforcmbs" {
  name                        = "inbound_allow_443_from_Powerapps"
  priority                    = 200
  direction                   = "Inbound"
  access                      = "Allow"
  description                 = "Access to PowerApps to cmbs  Flow - NSG- Appgateway - functionApp"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = var.powerapps_whitelist_ips
  destination_address_prefix  = "*"
  resource_group_name         = module.sharedrg.resource_group_name
  #network_security_group_name = module.appgatewaynsg.network_security_group_name
  network_security_group_name = module.powerapptoappgatewaynsg.network_security_group_name
}

resource "azurerm_network_security_rule" "cmbsapplication_inbound_allow_443_KPMG_Trusted_NW" {
  name                        = "inbound_allow_443_from_KPMG_Trusted_NW"
  priority                    = 300
  direction                   = "Inbound"
  access                      = "Allow"
  description                 = "Access to powerapps Cloud Application should be restricted to KPMG Trusted network"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = var.vpn_whitelist_ips
  destination_address_prefix  = "*"
  resource_group_name         = module.sharedrg.resource_group_name
  network_security_group_name = module.powerapptoappgatewaynsg.network_security_group_name
}

resource "azurerm_network_security_rule" "Port_65503-65534__powerappstoagw" {
  name                        = "Port_65503-65534"
  priority                    = 400
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "65503-65534"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.sharedrg.resource_group_name
  network_security_group_name = module.powerapptoappgatewaynsg.network_security_group_name
}



#--------------for Application gateway  Subnet end ------------#
resource "azurerm_network_security_rule" "ASE_Outbound_agw" {
  name                        = "ASE_Outbound"
  priority                    = 200
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.sharedrg.resource_group_name
  network_security_group_name = module.agwnsg.network_security_group_name
}

resource "azurerm_network_security_rule" "outbound_DNS_agw" {
  name                        = "outbound_DNS"
  priority                    = 250
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefixes  = var.dns_servers
  resource_group_name         = module.sharedrg.resource_group_name
  network_security_group_name = module.agwnsg.network_security_group_name
}


resource "azurerm_network_security_rule" "ASE_Outbound_powerauotmateagw" {
  name                        = "ASE_Outbound"
  priority                    = 200
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.sharedrg.resource_group_name
  network_security_group_name = module.powerapptoappgatewaynsg.network_security_group_name
}

resource "azurerm_network_security_rule" "outbound_DNS_powerautomateagw" {
  name                        = "outbound_DNS"
  priority                    = 250
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefixes  = var.dns_servers
  resource_group_name         = module.sharedrg.resource_group_name
  network_security_group_name = module.powerapptoappgatewaynsg.network_security_group_name
}
