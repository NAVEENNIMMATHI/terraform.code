resource "azurerm_network_security_rule" "ignite_ingress_to_ignite_aks" {
    name                        = "ingress-in-aks"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "*"
    source_address_prefix       = module.ignite_ingress_subnet.subnet_address_prefix
    destination_address_prefix  = module.ignite_aks_subnet.subnet_address_prefix
    resource_group_name         = module.ignite_rg.resource_group_name
    network_security_group_name = azurerm_network_security_group.ignite_aks_nsg.name
}
/*
resource "azurerm_network_security_rule" "Inbound_VirtualNetwork_aks" {
  name                        = "Inbound_VirtualNetwork"
  priority                    =  4096
  direction                   = "Inbound"
  access                      = "Deny"
  description                 = "Deny aks subnet"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = module.ignite_rg.resource_group_name
  network_security_group_name = azurerm_network_security_group.ignite_aks_nsg.name

}
*/