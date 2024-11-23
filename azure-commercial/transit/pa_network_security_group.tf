resource "azurerm_network_security_group" "fwmgmtnsg" {
        name                = "co-${lower(var.environment)}-${var.location}-fwmgmt-nsg"
        resource_group_name = "${azurerm_resource_group.transitpalofw.name}"
        location            = "${azurerm_resource_group.transitpalofw.location}"


  tags = "${var.tags}"
}

resource "azurerm_network_security_group" "fwuntrustnsg" {
        name                = "co-${lower(var.environment)}-${var.location}-fwuntrust-nsg"
        resource_group_name = "${azurerm_resource_group.transitpalofw.name}"
        location            = "${azurerm_resource_group.transitpalofw.location}"


 tags = "${var.tags}"
}
