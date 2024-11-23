resource "azurerm_network_security_rule" "gwrule" {
  name                        = "fpi-gw-ms"
  priority                    = 150
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "65200-65535"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.rgfpi.resource_group_name
  network_security_group_name = azurerm_network_security_group.fpi-app-nsg-frontend.name
}

resource "azurerm_network_security_rule" "gwrule1" {
  name                        = "fpi-gw-https"
  priority                    = 160
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_ranges     = ["443", "80"]
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.rgfpi.resource_group_name
  network_security_group_name = azurerm_network_security_group.fpi-app-nsg-frontend.name
}

resource "azurerm_network_security_rule" "gwrule2" {
  name                        = "fpi-gw-3306"
  priority                    = 170
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_ranges     = ["3306"]
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.rgfpi.resource_group_name
  network_security_group_name = azurerm_network_security_group.fpi-app-nsg-backend.name
}

resource "azurerm_network_security_rule" "Outbound_Allow_443_Kip_Application_Gateway" {
  name                         = "Outbound_Allow_443_From_Kip_Application_Gateway"
  priority                     = 1025
  direction                    = "Outbound"
  access                       = "Allow"
  protocol                     = "*"
  source_port_range            = "*"
  destination_port_range       = "443"
  source_address_prefix        = "*"
  destination_address_prefixes = var.KIPAGW_PIP
  resource_group_name         = module.rgfpi.resource_group_name
  network_security_group_name = azurerm_network_security_group.fpi-app-nsg-backend.name
}