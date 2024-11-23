resource "azurerm_route_table" "co-p-eastus-transitpaloaltofw-udr" {
  name                          = "co-${lower(var.environment)}-${var.location}-${var.applicationname}paloaltofw-udr"
  location                      = "${azurerm_resource_group.transitvnet.location}"
  resource_group_name           = "${azurerm_resource_group.transitvnet.name}"
  disable_bgp_route_propagation = false

  route {
    name           = "AllTrafficthroughPAFW"
    address_prefix = "0.0.0.0/0"
    next_hop_type  = "VirtualAppliance"
	next_hop_in_ip_address = "${var.ilb_frontend_private_ip_address}"
  }

  tags = "${var.tags}"
}