resource "azurerm_network_watcher" "eastus" {
  name                = "NetworkWatcher_eastus"
  resource_group_name = module.networkwatcherrg.resource_group_name
  location            = module.networkwatcherrg.resource_group_location

  tags = var.tags
}

