# MGT Outbound
resource "azurerm_network_security_rule" "Allow_PowerBI_Outbound_MGT" {
  name                        = "Allow_PowerBI_Outbound"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  description                 = "Allow PowerBI Outbound"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = azurerm_subnet.rrimgtsubnet.address_prefix
  destination_address_prefix  = "PowerBI"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = azurerm_network_security_group.rrimgtnsg.name
}

resource "azurerm_network_security_rule" "Allow_SQL_Outbound_MGT" {
  name                        = "Allow_SQL_Outbound"
  priority                    = 200
  direction                   = "Outbound"
  access                      = "Allow"
  description                 = "Allow SQL Outbound"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "1433"
  source_address_prefix       = azurerm_subnet.rrimgtsubnet.address_prefix
  destination_address_prefix  = azurerm_subnet.rridbsubnet.address_prefix
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = azurerm_network_security_group.rrimgtnsg.name
}

#pbi Inbound
resource "azurerm_network_security_rule" "Allow_SQL_Inbound_PBI" {
  name                        = "Allow_SQL_Inbound"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  description                 = "Allow SQL Inbound"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "1443"
  source_address_prefix       = azurerm_subnet.rridbsubnet.address_prefix
  destination_address_prefix  = "PowerBI"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = azurerm_network_security_group.rripbinsg.name
}

#pbi Outbound
resource "azurerm_network_security_rule" "Allow_PowerBI_Outbound_PBI" {
  name                        = "Allow_PowerBI_Outbound"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  description                 = "Allow PowerBI Outbound"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = azurerm_subnet.rripbisubnet.address_prefix
  destination_address_prefix  = "PowerBI"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = azurerm_network_security_group.rripbinsg.name
}
