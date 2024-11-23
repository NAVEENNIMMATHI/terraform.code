# App Gateway
resource "azurerm_network_security_rule" "inbound_cmp_nsg_rule_agw_kpmg_trusted" {
  name                        = "inbound_cmp_nsg_rule_agw_kpmg_trusted"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes       = var.kpmg_trusted_address_prefixes
  destination_address_prefix  = module.cmp_agw_subnet.subnet_address_prefix
  resource_group_name         = module.cmp_rg_shared.resource_group_name
  network_security_group_name = module.cmp_nsg_agw.network_security_group_name
}

resource "azurerm_network_security_rule" "inbound_cmp_nsg_rule_agw_kpmg_germany_dc" {
  name                        = "inbound_cmp_nsg_rule_agw_allow_german_dc_access"
  priority                    = 200
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = ["185.22.69.1","185.22.69.2","185.22.69.3","185.22.69.4","185.22.69.5","185.22.69.6","185.22.69.7","185.22.69.8","185.22.69.9","185.22.69.10"]
  destination_address_prefix  = module.cmp_agw_subnet.subnet_address_prefix
  resource_group_name         = module.cmp_rg_shared.resource_group_name
  network_security_group_name = module.cmp_nsg_agw.network_security_group_name
}

/*resource "azurerm_network_security_rule" "inbound_cmp_nsg_rule_agw_client" {
  name                        = "inbound_cmp_nsg_rule_agw_client"
  priority                    = 200
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "443"
  for_each = var.cmp_clients
  source_address_prefixes     = var.cmp_clients.subnet_cidr #["10.50.76.16/28", "10.50.76.48/28"]
  destination_address_prefix  = module.cmp_agw_subnet.subnet_address_prefix
  resource_group_name         = module.cmp_rg_shared.resource_group_name
  network_security_group_name = module.cmp_nsg_agw.network_security_group_name
}*/

module "allow_gateway_manager" {
  source                      = "../../modules/network_security_rules"
  name                        = "Allow_Gateway_Manager"
  priority                    = 300
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "65200-65535"
  source_address_prefix       = "GatewayManager"
  destination_address_prefix  = "*"
  resource_group_name         = module.cmp_rg_shared.resource_group_name
  network_security_group_name = module.cmp_nsg_agw.network_security_group_name
}

#cmp_client nsg rules
module "allow_443_from_agw_to_client_vm" {
  for_each                    = var.cmp_clients
  source                      = "../../modules/network_security_rules"
  name                        = "allow_443_from_agw_to_client_vm"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = module.cmp_agw_subnet.subnet_address_prefix
  destination_address_prefix  = "*"
  resource_group_name         = module.cmp_rg_client[each.key].resource_group_name
  network_security_group_name = module.cmp_nsg_clients[each.key].network_security_group_name
}

module "Allow_80_from_agw_to_client_vm" {
  for_each                    = var.cmp_clients
  source                      = "../../modules/network_security_rules"
  name                        = "allow_80_from_agw_to_client_vm"
  priority                    = 200
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = module.cmp_agw_subnet.subnet_address_prefix
  destination_address_prefix  = "*"
  resource_group_name         = module.cmp_rg_client[each.key].resource_group_name
  network_security_group_name = module.cmp_nsg_clients[each.key].network_security_group_name
}

module "Allow_Intra_Subnet_client_vm" {
  for_each                    = var.cmp_clients
  source                      = "../../modules/network_security_rules"
  name                        = "allow_intra_subnet_client_vm"
  priority                    = 300
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = module.cmp_subnet_client_vm[each.key].subnet_address_prefix
  destination_address_prefix  = module.cmp_subnet_client_vm[each.key].subnet_address_prefix
  resource_group_name         = module.cmp_rg_client[each.key].resource_group_name
  network_security_group_name = module.cmp_nsg_clients[each.key].network_security_group_name
}

module "allow_rdp_connection_to_vm" {
  for_each                    = var.cmp_clients
  source                      = "../../modules/network_security_rules"
  name                        = "allow_rdp_connection_to_vm"
  priority                    = 400
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = var.source_address_prefix #"10.0.0.0/16"
  destination_address_prefix  = module.cmp_subnet_client_vm[each.key].subnet_address_prefix
  resource_group_name         = module.cmp_rg_client[each.key].resource_group_name
  network_security_group_name = module.cmp_nsg_clients[each.key].network_security_group_name
}

/*module "deny_all_other_inbound_traffic" {
  for_each                    = var.cmp_clients
  source                      = "../../modules/network_security_rules"
  name                        = "deny_all_other_inbound_traffic"
  priority                    = 1000
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.cmp_rg_client[each.key].resource_group_name
  network_security_group_name = module.cmp_nsg_clients[each.key].network_security_group_name
}*/

resource "azurerm_network_security_rule" "Allow_Proofpoint_Smtp_mdc_port_25" {
for_each                      = var.cmp_clients
name                          = "Allow_Proofpoint_Smtp_mdc_port_25"
priority                      = 500
direction                     = "Outbound"
source_port_range             = "*"
destination_port_range        = "25"
protocol                      = "TCP"
source_address_prefix         = module.cmp_subnet_client_vm[each.key].subnet_address_prefix
destination_address_prefixes  = ["205.220.188.0/24","205.220.189.0/24"]
access                        = "Allow"
resource_group_name           = module.cmp_rg_client[each.key].resource_group_name
network_security_group_name   = module.cmp_nsg_clients[each.key].network_security_group_name

}

resource "azurerm_network_security_rule" "Allow_Proofpoint_Smtp_mdc_port_465" {
for_each                      = var.cmp_clients
name                          = "Allow_Proofpoint_Smtp_mdc_port_465"
priority                      = 550
direction                     = "Outbound"
source_port_range             = "*"
destination_port_range        = "465"
protocol                      = "TCP"
source_address_prefix         = module.cmp_subnet_client_vm[each.key].subnet_address_prefix
destination_address_prefixes  = ["205.220.188.0/24","205.220.189.0/24"]
access                        = "Allow"
resource_group_name           = module.cmp_rg_client[each.key].resource_group_name
network_security_group_name   = module.cmp_nsg_clients[each.key].network_security_group_name

}

resource "azurerm_network_security_rule" "Allow_Proofpoint_Smtp_mdc_port_587" {
for_each                     = var.cmp_clients
name                         = "Allow_Proofpoint_Smtp_mdc_port_587"
priority                     = 600
direction                    = "Outbound"
source_port_range            = "*"
destination_port_range       = "587"
protocol                     = "TCP"
source_address_prefix        = module.cmp_subnet_client_vm[each.key].subnet_address_prefix
destination_address_prefixes = ["205.220.188.0/24","205.220.189.0/24"]
access                       = "Allow"
resource_group_name          = module.cmp_rg_client[each.key].resource_group_name
network_security_group_name  = module.cmp_nsg_clients[each.key].network_security_group_name

}

module "Outbound_Allow_Intra_Subnet_Client_vm" {
  for_each                    = var.cmp_clients
  source                      = "../../modules/network_security_rules"
  name                        = "outbound_allow_intra_subnet_client_vm"
  priority                    = 700
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = module.cmp_subnet_client_vm[each.key].subnet_address_prefix
  destination_address_prefix  = module.cmp_subnet_client_vm[each.key].subnet_address_prefix
  resource_group_name         = module.cmp_rg_client[each.key].resource_group_name
  network_security_group_name = module.cmp_nsg_clients[each.key].network_security_group_name
}

/*module "allow_traffic_to_internet" {
  for_each                    = var.cmp_clients
  source                      = "../../modules/network_security_rules"
  name                        = "allow_traffic_to_internet"
  priority                    = 700
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "Internet"
  resource_group_name         = module.cmp_rg_client[each.key].resource_group_name
  network_security_group_name = module.cmp_nsg_clients[each.key].network_security_group_name
}*/

/*module "deny_all_other_outbound_traffic" {
  for_each                    = var.cmp_clients
  source                      = "../../modules/network_security_rules"
  name                        = "deny_all_other_outbound_traffic"
  priority                    = 800
  direction                   = "Outbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.cmp_rg_client[each.key].resource_group_name
  network_security_group_name = module.cmp_nsg_clients[each.key].network_security_group_name
}*/

module "Allow_Access_to_PostgreSQL_tcp" {
  for_each                    = var.cmp_clients
  source                      = "../../modules/network_security_rules"
  name                        = "allow_Access_to_PostgreSQL_tcp"
  priority                    = 800
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "5432"
  source_address_prefix       = module.cmp_subnet_client_vm[each.key].subnet_address_prefix
  destination_address_prefix  = "*"
  resource_group_name         = module.cmp_rg_client[each.key].resource_group_name
  network_security_group_name = module.cmp_nsg_clients[each.key].network_security_group_name
}

module "Allow_Access_to_PostgreSQL_udp" {
  for_each                    = var.cmp_clients
  source                      = "../../modules/network_security_rules"
  name                        = "allow_Access_to_PostgreSQL_udp"
  priority                    = 900
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Udp"
  source_port_range           = "*"
  destination_port_range      = "5432"
  source_address_prefix       = module.cmp_subnet_client_vm[each.key].subnet_address_prefix
  destination_address_prefix  = "*"
  resource_group_name         = module.cmp_rg_client[each.key].resource_group_name
  network_security_group_name = module.cmp_nsg_clients[each.key].network_security_group_name
}

