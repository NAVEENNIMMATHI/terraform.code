resource "azurerm_network_watcher" "eastus" {
  name                = "NetworkWatcher_${var.location}"
  location            = "${azurerm_resource_group.networkwatcher.location}"
  resource_group_name = "${azurerm_resource_group.networkwatcher.name}"

  tags = "${var.tags}"

}
