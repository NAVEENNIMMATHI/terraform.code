#### Application Gateway NSG Rules
resource "azurerm_network_security_rule" "Inbound_Allow_443_From_PaloAlto1_agw1nsg" {
  name                        = "Inbound_Allow_443_From_PaloAlto1"
  priority                    = 101
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = var.PaloAlto1
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = module.agw1nsg.network_security_group_name
}

resource "azurerm_network_security_rule" "Inbound_Allow_443_From_PaloAlto2_agw1nsg" {
  name                        = "Inbound_Allow_443_From_PaloAlto2"
  priority                    = 102
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = var.PaloAlto2
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = module.agw1nsg.network_security_group_name
}

resource "azurerm_network_security_rule" "Inbound_Allow_443_From_KPMG_On-Premise_agw1nsg" {
  name                        = "Inbound_Allow_443_From_KPMG_On-Premise"
  priority                    = 103
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = var.KPMG_On-Premise
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = module.agw1nsg.network_security_group_name
}

resource "azurerm_network_security_rule" "Inbound_Allow_443_From_KPMG_VPN_agw1nsg" {
  name                        = "Inbound_Allow_443_From_KPMG_VPN"
  priority                    = 104
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = var.KPMG_VPN
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = module.agw1nsg.network_security_group_name
}

resource "azurerm_network_security_rule" "Inbound_Allow_443_From_KGS_Bangalore_agw1nsg" {
  name                        = "Inbound_Allow_443_From_KGS_Bangalore"
  priority                    = 105
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = var.KGS_Bangalore
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = module.agw1nsg.network_security_group_name
}

resource "azurerm_network_security_rule" "Inbound_Allow_443_From_KGS_Gurgaon_agw1nsg" {
  name                        = "Inbound_Allow_443_From_KGS_Gurgaon"
  priority                    = 106
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = var.KGS_Gurgaon
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = module.agw1nsg.network_security_group_name
}

resource "azurerm_network_security_rule" "Inbound_Allow_443_From_ASE_PIP_agw1nsg" {
  name                        = "Inbound_Allow_443_From_ASE_PIP"
  priority                    = 107
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = var.ASE_PIP
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = module.agw1nsg.network_security_group_name
}

resource "azurerm_network_security_rule" "Inbound_Allow_65503-65534_From_Azure_Infrastructure_Communication_agw1nsg" {
  name                        = "Inbound_Allow_65503-65534_From_Azure_Infrastructure_Communication"
  priority                    = 301
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "65503-65534"
  source_address_prefix       = "GatewayManager"
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = module.agw1nsg.network_security_group_name
}

#### ASE NSG Rules

resource "azurerm_network_security_rule" "Inbound_Allow_443_From_Application_Gateway_ase1nsg" {
  name                        = "Inbound_Allow_443_From_Application_Gateway"
  priority                    = 101
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = var.agw1_subnet_adress_space
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = module.ase1nsg.network_security_group_name
}

resource "azurerm_network_security_rule" "Inbound_Allow_454-455_App_Service_Management_Addresses_ase1nsg" {
  name                        = "Inbound_Allow_454-455_App_Service_Management_Addresses"
  priority                    = 301
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "454-455"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = module.ase1nsg.network_security_group_name
}


#### Azure Data Storage NSG Rules

resource "azurerm_network_security_rule" "Inbound_Allow_443_Azure_data_Explorer_Mgmt_adx1nsg" {
  name                        = "Inbound_Allow_443_Azure_data_Explorer_Mgmt_adx1nsg"
  priority                    = 1000
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = var.ADX_Mgmt_IP
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = module.adx1nsg.network_security_group_name
}


resource "azurerm_network_security_rule" "Inbound_Allow_443_Azure_Data_Explorer_Health_Monitor_adx1nsg" {
  name                        = "Inbound_Allow_443_Azure_Data_Explorer_Health_Monitor_adx1nsg"
  priority                    = 1100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = var.ADX_HealthMonitor_IP
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = module.adx1nsg.network_security_group_name
}

resource "azurerm_network_security_rule" "Inbound_Allow_80_443_Azure_Data_Explorer_Load_Balancer_adx1nsg" {
  name                        = "Inbound_Allow_80_443_Azure_Data_Explorer_Load_Balancer_adx1nsg"
  priority                    = 1200
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_ranges      = ["80","443"]
  source_address_prefix       = "AzureLoadBalancer"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = module.adx1nsg.network_security_group_name
}

resource "azurerm_network_security_rule" "Inbound_Deny_443_Azure_Data_Explorer_Public_Access_adx1nsg" {
  name                        = "Inbound_Deny_443_Azure_Data_Explorer_Public_Access_adx1nsg"
  priority                    = 1210
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "Internet"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = module.adx1nsg.network_security_group_name
}

resource "azurerm_network_security_rule" "Outbound_Allow_443_Azure_Data_Explorer_Storage_adx1nsg" {
  name                        = "Outbound_Allow_443_Azure_Data_Explorer_Storage_adx1nsg"
  priority                    = 1100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "Storage.EastUS"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = module.adx1nsg.network_security_group_name
}

resource "azurerm_network_security_rule" "Outbound_Allow_443_Azure_Data_Explorer_DataLake_adx1nsg" {
  name                        = "Outbound_Allow_443_Azure_Data_Explorer_DataLake_adx1nsg"
  priority                    = 1110
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "AzureDataLake"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = module.adx1nsg.network_security_group_name
}