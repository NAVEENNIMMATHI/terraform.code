resource "azurerm_network_security_rule" "Allow_443_fwmgmt" {
        name                        = "Allow_443"
        priority                    = 100
        direction                   = "Inbound"
        access                      = "Allow"
        protocol                    = "Tcp"
        source_port_range           = "*"
        destination_port_ranges      = ["443","22","3389"]
        source_address_prefixes       = ["106.51.58.102","10.30.2.196/32","69.250.38.180/32","10.30.16.0/24","10.30.17.0/24","199.207.253.0/24"]
        destination_address_prefix  = "*"
        resource_group_name         = "${azurerm_resource_group.transitpalofw.name}"
        network_security_group_name = "${azurerm_network_security_group.fwmgmtnsg.name}"
}

resource "azurerm_network_security_rule" "Allow_KLT" {
        name                        = "Allow_KLT"
        priority                    = 110
        direction                   = "Inbound"
        access                      = "Allow"
        protocol                    = "Tcp"
        source_port_range           = "*"
        destination_port_ranges     = ["4437","4438","4439","4431","4432","4434","4435","4436"]
        source_address_prefix       = "*"
        destination_address_prefix  = "*"
        resource_group_name         = "${azurerm_resource_group.transitpalofw.name}"
        network_security_group_name = "${azurerm_network_security_group.fwuntrustnsg.name}"
}
