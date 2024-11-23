#Tableau Application Gateway NSG
resource "azurerm_network_security_rule" "AllowAzureInBoundGatewayManager" {
  count                       = var.environment == "production" ? "0" : "1"

  name                        = "AllowAzureInBoundGatewayManager"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_ranges     = ["65200-65535"]
  source_address_prefix       = "GatewayManager"
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = azurerm_network_security_group.tabappgw_nsg[count.index].name
}

resource "azurerm_network_security_rule" "AllowAzureInBoundAzureLoadBalancer" {
  count                       = var.environment == "production" ? "0" : "1"

  name                        = "AllowAzureInBoundAzureLoadBalancer"
  priority                    = 120
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "AzureLoadBalancer"
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = azurerm_network_security_group.tabappgw_nsg[count.index].name
}

resource "azurerm_network_security_rule" "Allow_443" {
  count                       = var.environment == "production" ? "0" : "1"

  name                        = "Allow_443"
  priority                    = 130
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = azurerm_network_security_group.tabappgw_nsg[count.index].name
}

#Tableau External NSG
resource "azurerm_network_security_rule" "Port_8080-8081" {
  name                        = "Port_8080-8081"
  priority                    = 102
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_ranges     = ["8080", "8081"]
  source_address_prefix       = var.spi_web_subnet_address_space
  destination_address_prefix  = var.spi_app_subnet_address_space
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = module.tabext_nsg.network_security_group_name
}

resource "azurerm_network_security_rule" "Port_443" {
  name                        = "Port_443"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = ["110.173.180.210/32", 
                                 "114.143.105.74/32", 
                                 "115.114.9.131/32",
                                 "199.206.0.5/32", 
                                 "199.207.253.0/24",
                                 "203.199.72.210/32"]
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = module.tabext_nsg.network_security_group_name
}

resource "azurerm_network_security_rule" "Port_3389" {
  name                        = "Port_3389"
  priority                    = 120
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefixes= var.environment == "production" ? [var.spi_app_subnet_address_space, "10.4.4.0/24"] : [var.spi_app_subnet_address_space]
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = module.tabext_nsg.network_security_group_name
}

resource "azurerm_network_security_rule" "SSISIntegratedRunTime" {
  name                        = "SSISIntegratedRunTime"
  priority                    = 130
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_ranges     = ["29876", "29877"]
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = module.tabext_nsg.network_security_group_name
}


resource "azurerm_network_security_rule" "AllowMicrosoftOfficeOutBound" {
  name                        = "AllowMicrosoftOfficeOutBound"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefixes= ["103.58.118.215",
                                 "103.58.118.216",
                                 "103.58.118.217",
                                 "103.58.118.218",
                                 "103.58.118.219",
                                 "23.37.68.220",
                                 "40.79.77.110",
                                 "52.184.162.170",
                                 "52.232.254.121",
                                 "65.52.98.231",
                                 "65.52.98.233",
                                 "65.55.163.76",
                                 "65.55.163.78",
                                 "65.55.163.80",
                                 "72.22.185.200",
                                 "72.22.185.208"]
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = module.tabext_nsg.network_security_group_name
}

resource "azurerm_network_security_rule" "AllowCarbonBlackOutbound" {
  name                        = "AllowCarbonBlackOutbound"
  priority                    = 1040
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "199.207.144.0/26"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = module.tabext_nsg.network_security_group_name
}

