resource "azurerm_network_watcher" "eastus" {
  name                = "NetworkWatcher_eastus"
  resource_group_name = azurerm_resource_group.networkwatcher.name
  location            = azurerm_resource_group.networkwatcher.location

  tags = var.tags
}

resource "azurerm_network_watcher" "westus" {
  name                = "NetworkWatcher_westus"
  resource_group_name = azurerm_resource_group.networkwatcher.name
  location            = "westus"

  tags = var.tags
}
