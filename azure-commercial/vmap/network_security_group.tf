module "agwnsg" {
  source              = "../../modules12/network_security_group"
  name                = "nsg-${var.location_acronym}-agw-${var.environment_acronym}"
  location            = module.vmap_resource_group.resource_group_location
  resource_group_name = module.vmap_resource_group.resource_group_name
  tags                = var.tags
}

resource "azurerm_subnet_network_security_group_association" "agw_nsg_association" {
  subnet_id                 = azurerm_subnet.subnet["agw"].id
  network_security_group_id = module.agwnsg.network_security_group_id
}

#--------------for Application gateway  Subnet------------#
resource "azurerm_network_security_rule" "inbound_allow_443_agw" {
  name                        = "inbound_allow_443"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = ["20.185.109.156/32", "199.207.253.0/24", "20.185.106.213/32", "199.206.0.5/32", "103.133.112.80/28", "103.58.118.80/28", "52.224.104.245/32", "103.216.201.96/28"]
  destination_address_prefix  = "*"
  resource_group_name         = module.vmap_resource_group.resource_group_name
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
  resource_group_name         = module.vmap_resource_group.resource_group_name
  network_security_group_name = module.agwnsg.network_security_group_name
}

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
  resource_group_name         = module.vmap_resource_group.resource_group_name
  network_security_group_name = module.agwnsg.network_security_group_name
}

resource "azurerm_network_security_rule" "outbound_DNS_agw" {
  name                         = "outbound_DNS"
  priority                     = 250
  direction                    = "Outbound"
  access                       = "Allow"
  protocol                     = "*"
  source_port_range            = "*"
  destination_port_range       = "*"
  source_address_prefix        = "*"
  destination_address_prefixes = var.dns_servers
  resource_group_name          = module.vmap_resource_group.resource_group_name
  network_security_group_name  = module.agwnsg.network_security_group_name
}