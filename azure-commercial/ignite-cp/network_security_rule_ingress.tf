resource "azurerm_network_security_rule" "agw_to_ingress" {
    name                        = "agw-in-ingress"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "*"
    source_address_prefix       = module.ignite_agw_subnet.subnet_address_prefix
    destination_address_prefix  = module.ignite_ingress_subnet.subnet_address_prefix
    resource_group_name         = module.ignite_rg.resource_group_name
    network_security_group_name = azurerm_network_security_group.ignite_ingress_nsg.name
}
/*
resource "azurerm_network_security_rule" "Inbound_VirtualNetwork_ingress" {
  name                        = "Inbound_VirtualNetwork"
  priority                    =  4096
  direction                   = "Inbound"
  access                      = "Deny"
  description                 = "Deny ingress subnet"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = module.ignite_rg.resource_group_name
  network_security_group_name = azurerm_network_security_group.ignite_ingress_nsg.name

}
*/