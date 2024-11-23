
resource "azurerm_network_security_rule" "Inbound_Allow_443_From_KPMG_VPN_US_agw1nsg" {
  name                        = "Inbound_Allow_443_From_KPMG_VPN_US"
  priority                    = 104
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = var.KPMG_VPN_US
  destination_address_prefix  = "*"
  resource_group_name         = module.impact_rg.resource_group_name
  network_security_group_name = module.agw1nsg_impact.network_security_group_name
}

resource "azurerm_network_security_rule" "Inbound_Allow_443_From_KGS_Bengaluru_central_agw1nsg" {
  name                        = "Inbound_Allow_443_From_KGS_Bengaluru"
  priority                    = 105
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = var.KGS_Bangalore
  destination_address_prefix  = "*"
  resource_group_name         = module.impact_rg.resource_group_name
  network_security_group_name = module.agw1nsg_impact.network_security_group_name
}
resource "azurerm_network_security_rule" "Inbound_Allow_443_From_PublicIP_agw1nsg" {
  name                        = "Inbound_Allow_443_From_AZFW_PublicIP"
  priority                    = 166
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = var.AZFW_PIP
  destination_address_prefix  = "*"
  resource_group_name         = module.impact_rg.resource_group_name
  network_security_group_name = module.agw1nsg_impact.network_security_group_name
}
resource "azurerm_network_security_rule" "Inbound_Allow_65200-65535_From_Azure_Infrastructure_Communication_central_agw1nsg" {
  name                        = "Inbound_Allow_65200-65535_From_Azure_Infrastructure_Communication"
  priority                    = 301
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "65200-65535"
  source_address_prefix       = "GatewayManager"
  destination_address_prefix  = "*"
  resource_group_name         = module.impact_rg.resource_group_name
  network_security_group_name = module.agw1nsg_impact.network_security_group_name
}
###APIM###
resource "azurerm_network_security_rule" "inbound_impact_nsg_rule_apim_managementendpoint" {
  name                        = "inbound_impact_nsg_rule_apim_managementendpoint"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_ranges      = ["3443"]
  source_address_prefix       = "ApiManagement"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = module.impact_rg.resource_group_name
  network_security_group_name = module.apimnsg_impact.network_security_group_name
}
resource "azurerm_network_security_rule" "inbound_impact_nsg_rule_apim_azureloadbalancer" {
  name                        = "inbound_impact_nsg_rule_apim_azureloadbalancer"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "AzureLoadBalancer"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = module.impact_rg.resource_group_name
  network_security_group_name = module.apimnsg_impact.network_security_group_name
}

resource "azurerm_network_security_rule" "inbound_impact_nsg_rule_apim_internet" {
  name                        = "inbound_impact_nsg_rule_apim_internet"
  priority                    = 120
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_ranges      = ["443","80"]
  source_address_prefix       = "Internet"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = module.impact_rg.resource_group_name
  network_security_group_name = module.apimnsg_impact.network_security_group_name
}

resource "azurerm_network_security_rule" "inbound_impact_nsg_rule_apim_agw" {
  name                        = "inbound_impact_nsg_rule_apim_agw"
  priority                    = 130
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = module.impact_agw_subnet.subnet_address_prefix
  destination_address_prefix  = module.impact_apim_subnet.subnet_address_prefix
  resource_group_name         = module.impact_rg.resource_group_name
  network_security_group_name = module.apimnsg_impact.network_security_group_name
}
