##Inbound NSG Rules for Application Gateway##
resource "azurerm_network_security_rule" "Inbound_allow_443_agw_api_management" {
  name                        = "Inbound_allow_443_api_management"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "ApiManagement"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = module.eccm_rg.resource_group_name
  network_security_group_name = azurerm_network_security_group.eccm_agw_nsg.name
}

resource "azurerm_network_security_rule" "Inbound_allow_443_agw_internet" {
  name                        = "Inbound_allow_443_internet"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "Internet"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = module.eccm_rg.resource_group_name
  network_security_group_name = azurerm_network_security_group.eccm_agw_nsg.name
}

resource "azurerm_network_security_rule" "Inbound_allow_443_agw_KPMG_Trusted_NW" {
  name                        = "Inbound_allow_443_KPMG_Trusted_NW"
  priority                    = 120
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = var.kpmg_trusted_ip
  destination_address_prefix  = module.eccm_agw_subnet.subnet_address_prefix
  resource_group_name         = module.eccm_rg.resource_group_name
  network_security_group_name = azurerm_network_security_group.eccm_agw_nsg.name
}

resource "azurerm_network_security_rule" "Inbound_allow_65200-65535_agw_gateway_manager" {
  name                        = "Inbound_allow_65200-65535_gateway_manager"
  priority                    = 130
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "65200-65535"
  source_address_prefix       = "GatewayManager"
  destination_address_prefix  = "*"
  resource_group_name         = module.eccm_rg.resource_group_name
  network_security_group_name = azurerm_network_security_group.eccm_agw_nsg.name
}

/*resource "azurerm_network_security_rule" "Inbound_agw_vnet_allow" {
  name                        = "Inbound_allow_vnet"
  priority                    = 65000
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = module.eccm_rg.resource_group_name
  network_security_group_name = azurerm_network_security_group.eccm_agw_nsg.name
}

resource "azurerm_network_security_rule" "Inbound_allow_agw_azure_load_balancer" {
  name                        = "Inbound_allow_azure_load_balancer"
  priority                    = 65001
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "AzureLoadBalancer"
  destination_address_prefix  = "*"
  resource_group_name         = module.eccm_rg.resource_group_name
  network_security_group_name = azurerm_network_security_group.eccm_agw_nsg.name
}

resource "azurerm_network_security_rule" "Inbound_deny_agw_any" {
  name                        = "Inbound_deny_any"
  priority                    = 65500
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.eccm_rg.resource_group_name
  network_security_group_name = azurerm_network_security_group.eccm_agw_nsg.name
}


####Outbound NSG Rules for Application Gateway####
resource "azurerm_network_security_rule" "Outbound_allow_agw_vnet" {
  name                        = "Outbound_allow_vnet"
  priority                    = 65000
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = module.eccm_rg.resource_group_name
  network_security_group_name = azurerm_network_security_group.eccm_agw_nsg.name
}

resource "azurerm_network_security_rule" "Outbound_allow_agw_internet" {
  name                        = "Outbound_allow_internet"
  priority                    = 65001
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "Internet"
  resource_group_name         = module.eccm_rg.resource_group_name
  network_security_group_name = azurerm_network_security_group.eccm_agw_nsg.name
}

resource "azurerm_network_security_rule" "Outbound_deny_agw_any" {
  name                        = "Outbound_deny_any"
  priority                    = 65500
  direction                   = "Outbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.eccm_rg.resource_group_name
  network_security_group_name = azurerm_network_security_group.eccm_agw_nsg.name
}*/