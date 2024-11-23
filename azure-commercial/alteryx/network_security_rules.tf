resource "azurerm_network_security_rule" "outbound_1113" {
  name                          = "outbound_1113"
  priority                      = 102
  direction                     = "Outbound"
  access                        = "Allow"
  protocol                      = "Tcp"
  source_port_range             = "*"
  destination_port_range        = "1113"
  source_address_prefix         = "*"
  destination_address_prefix    = "*"
  resource_group_name           = module.applicationrg.resource_group_name
  network_security_group_name   = module.alteryxnsg.network_security_group_name
}