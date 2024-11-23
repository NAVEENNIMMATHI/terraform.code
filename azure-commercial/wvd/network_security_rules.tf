# ASE Inbound
module "AllowAppGtwySubnet" {
  source                      = "../../modules/network_security_rules"
  name                        = "AllowAppGtwySubnet"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "${var.ablaagw1_subnet_address_prefix}"
  destination_address_prefix  = "*"
  resource_group_name         = "${module.applicationrg.resource_group_name}"
  network_security_group_name = "${var.ablaase1_nsg_name}"
}

module "abla_inbound_allow_454-455" {
  source                      = "../../modules/network_security_rules"
  name                        = "abla_inbound_allow_454-455"
  priority                    = 130
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "454-455"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "${module.applicationrg.resource_group_name}"
  network_security_group_name = "${var.ablaase1_nsg_name}"
}

module "abla_inbound_allow_443_forASE" {
  source                      = "../../modules/network_security_rules"
  name                        = "abla_inbound_allow_443_forASE"
  priority                    = 140
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "${module.applicationrg.resource_group_name}"
  network_security_group_name = "${var.ablaase1_nsg_name}"
}

module "abla_inbound_ASE_Internal_Inbound" {
  source                      = "../../modules/network_security_rules"
  name                        = "abla_inbound_ASE_Internal_Inbound"
  priority                    = 150
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "${var.ablaase1_subnet_address_prefix}"
  destination_address_prefix  = "*"
  resource_group_name         = "${module.applicationrg.resource_group_name}"
  network_security_group_name = "${var.ablaase1_nsg_name}"
}

module "abla_outbound_443" {
  source                      = "../../modules/network_security_rules"
  name                        = "abla_outbound_443"
  priority                    = 200
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "${module.applicationrg.resource_group_name}"
  network_security_group_name = "${var.ablaase1_nsg_name}"
}

module "abla_outbound_445" {
  source                      = "../../modules/network_security_rules"
  name                        = "abla_outbound_445"
  priority                    = 210
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "445"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "${module.applicationrg.resource_group_name}"
  network_security_group_name = "${var.ablaase1_nsg_name}"
}

module "abla_outbound_db" {
  source                      = "../../modules/network_security_rules"
  name                        = "abla_outbound_db"
  priority                    = 220
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "1433"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "${module.applicationrg.resource_group_name}"
  network_security_group_name = "${var.ablaase1_nsg_name}"
}

module "abla_outbound_db2" {
  source                      = "../../modules/network_security_rules"
  name                        = "abla_outbound_db2"
  priority                    = 230
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "11000-11999"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "${module.applicationrg.resource_group_name}"
  network_security_group_name = "${var.ablaase1_nsg_name}"
}

module "abla_outbound_dns" {
  source                      = "../../modules/network_security_rules"
  name                        = "abla_outbound_dns"
  priority                    = 250
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "53"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "${module.applicationrg.resource_group_name}"
  network_security_group_name = "${var.ablaase1_nsg_name}"
}

module "abla_outbound_ase_internal" {
  source                      = "../../modules/network_security_rules"
  name                        = "abla_outbound_ase_internal"
  priority                    = 260
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "${var.ablaase1_subnet_address_prefix}"
  resource_group_name         = "${module.applicationrg.resource_group_name}"
  network_security_group_name = "${var.ablaase1_nsg_name}"
}

module "abla_outbound_ASE_to_VNet" {
  source                      = "../../modules/network_security_rules"
  name                        = "abla_outbound_ASE_to_VNet"
  priority                    = 270
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "${var.address_space_single_value}"
  resource_group_name         = "${module.applicationrg.resource_group_name}"
  network_security_group_name = "${var.ablaase1_nsg_name}"
}

# APP Inbound
module "AllowManagementAccessForRDP" {
  source                      = "../../modules/network_security_rules"
  name                        = "AllowManagementAccessForRDP"
  priority                    = 900
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "${var.source_address_prefix_ForRDP}"
  destination_address_prefix  = "${var.ablaapp1_subnet_address_prefix}"
  resource_group_name         = "${module.applicationrg.resource_group_name}"
  network_security_group_name = "${var.ablaapp1_nsg_name}"
}

module "Port_RDP_3389" {
  source                      = "../../modules/network_security_rules"
  name                        = "Port_RDP_3389"
  priority                    = 1000
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "10.1.8.0/24"
  destination_address_prefix  = "${var.destination_address_prefix_ForRDP}"
  resource_group_name         = "${module.applicationrg.resource_group_name}"
  network_security_group_name = "${var.ablaapp1_nsg_name}"
}

module "ra_allow_port80" {
  source                      = "../../modules/network_security_rules"
  name                        = "ra_allow_port80"
  priority                    = 1010
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "${module.applicationrg.resource_group_name}"
  network_security_group_name = "${var.ablaapp1_nsg_name}"
}

# APP Outbound

# Appplication Gateway Inbound
module "abla_inbound_allow_443" {
  source                      = "../../modules/network_security_rules"
  name                        = "abla_inbound_allow_443"
  priority                    = 130
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "${module.applicationrg.resource_group_name}"
  network_security_group_name = "${var.ablaagw1_nsg_name}"
}

module "abla_inbound_allow__65503-65534" {
  source                      = "../../modules/network_security_rules"
  name                        = "abla_inbound_allow__65503-65534"
  priority                    = 140
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "65200-65535"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "${module.applicationrg.resource_group_name}"
  network_security_group_name = "${var.ablaagw1_nsg_name}"
}

# Appplication Gateway Outbound
module "abla_outbound_DNS1" {
  source                      = "../../modules/network_security_rules"
  name                        = "abla_outbound_DNS1"
  priority                    = 270
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "10.30.15.196"
  resource_group_name         = "${module.applicationrg.resource_group_name}"
  network_security_group_name = "${var.ablaagw1_nsg_name}"
}

module "abla_outbound_DNS2" {
  source                      = "../../modules/network_security_rules"
  name                        = "abla_outbound_DNS2"
  priority                    = 280
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "10.30.15.197"
  resource_group_name         = "${module.applicationrg.resource_group_name}"
  network_security_group_name = "${var.ablaagw1_nsg_name}"
}