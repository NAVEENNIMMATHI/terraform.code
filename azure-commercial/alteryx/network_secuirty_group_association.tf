resource "azurerm_subnet_network_security_group_association" "alteryx_subnet" {
 subnet_id                 = module.subnet.subnet_id
 network_security_group_id = module.alteryxnsg.network_security_group_id
}