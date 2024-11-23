resource "azurerm_recovery_services_vault" "transit" {
  name                = "co${lower(var.environment)}eusrecvault01${var.applicationname}"
  location            = "${azurerm_resource_group.transitbackuprecovery.location}"
  resource_group_name = "${azurerm_resource_group.transitbackuprecovery.name}"
  sku                 = "standard"
  
  tags = "${var.tags}"

}
