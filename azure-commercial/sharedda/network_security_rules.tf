resource "azurerm_network_security_rule" "inbound_allow_454_forMgmtASE" {
  name                        = "inbound_allow_454-455"
  priority                    = 130
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "454-455"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = module.asensg.network_security_group_name
}

resource "azurerm_network_security_rule" "inbound_allow_443_forASE" {
  name                        = "inbound_allow_443_forASE"
  priority                    = 140
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
   resource_group_name         = module.applicationrg.resource_group_name
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
  source_address_prefix       = var.ase_subnet_address_space
  destination_address_prefix  = "*"
   resource_group_name         = module.applicationrg.resource_group_name
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
   resource_group_name         = module.applicationrg.resource_group_name
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
   resource_group_name         = module.applicationrg.resource_group_name
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
   resource_group_name         = module.applicationrg.resource_group_name
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
   resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = module.asensg.network_security_group_name
}

resource "azurerm_network_security_rule" "outbound_allow_dns" {
  description                 = "outbound_dns"
  name                        = "outbound_dns"
  priority                    = 250
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "53"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg.resource_group_name
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
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = module.asensg.network_security_group_name
}

##Application Gateway Rules###

locals {
  # List of authorised KPMG NAT IP addresses
  kpmg_ip_addresses = ["20.185.109.156/32","20.185.106.213/32","199.207.253.0/24","199.206.0.5/32","103.133.112.80/28","103.58.118.80/28","103.216.201.96/28"]
  kpmg_its_global_addresses = ["137.117.105.144/32","52.179.4.30/32","13.95.127.151/32"]
}

resource "azurerm_network_security_rule" "inbound_allow_443" {
  name                        = "inbound_allow_443"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  #source_address_prefixes    = concat(local.kpmg_ip_addresses,var.ase_outbound_ip_addresses,local.kpmg_its_global_addresses)
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = module.agwnsg.network_security_group_name
}

resource "azurerm_network_security_rule" "Port_65503-65534" {
  name                        = "Port_65503-65534"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "65503-65534"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = module.agwnsg.network_security_group_name
}

resource "azurerm_network_security_rule" "ASE_Outbound" {
  name                        = "ASE_Outbound"
  priority                    = 200
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = module.agwnsg.network_security_group_name
}

resource "azurerm_network_security_rule" "outbound_DNS" {
  name                        = "outbound_DNS"
  priority                    = 250
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "53"
  source_address_prefix       = var.agw_subnet_address_space
  destination_address_prefixes= var.dns_servers
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = module.agwnsg.network_security_group_name
}

##Application Gateway Rules for KPMG Network Accessible only

resource "azurerm_network_security_rule" "inbound_allow_443_kpmg" {
  name                        = "inbound_allow_443"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes    = concat(local.kpmg_ip_addresses,var.ase_outbound_ip_addresses,var.firewall_ip_addresses)
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = module.agwnsg_kpmgonly.network_security_group_name
}

resource "azurerm_network_security_rule" "inbound_allow_443_from_kip_ase_pip" {
  name                        = "inbound_allow_443_from_kip_ase_pip"
  priority                    = 102
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = var.kip_ase_pip
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = module.agwnsg_kpmgonly.network_security_group_name
}

resource "azurerm_network_security_rule" "inbound_allow_443_from_canada_member_firm_pip" {
  name                        = "inbound_allow_443_from_canada_member_firm_pip"
  priority                    = 103
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = var.canada_member_firm_pip
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = module.agwnsg_kpmgonly.network_security_group_name

  count                       = var.environment_acronym == "ut" ? "1" : "0"
}

resource "azurerm_network_security_rule" "Port_65503-65534_kpmg" {
  name                        = "Port_65503-65534"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "65503-65534"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = module.agwnsg_kpmgonly.network_security_group_name
}

resource "azurerm_network_security_rule" "ASE_Outbound_kpmg" {
  name                        = "ASE_Outbound"
  priority                    = 200
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = module.agwnsg_kpmgonly.network_security_group_name
}

resource "azurerm_network_security_rule" "outbound_DNS_kpmg" {
  name                        = "outbound_DNS"
  priority                    = 250
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "53"
  source_address_prefix       = var.agw_subnet_address_space
  destination_address_prefixes= var.dns_servers
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = module.agwnsg_kpmgonly.network_security_group_name
}