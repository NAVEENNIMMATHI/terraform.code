resource "azurerm_availability_set" "paloaltofwas" {
  name                = "CO-${var.environment}-${var.location}-PaloAltoFw-as"
  location            = "${azurerm_resource_group.transitpalofw.location}"
  resource_group_name = "${azurerm_resource_group.transitpalofw.name}"
  managed             = "True"
 
  platform_update_domain_count = 2
  platform_fault_domain_count = 2

  tags = "${var.tags}"
}
