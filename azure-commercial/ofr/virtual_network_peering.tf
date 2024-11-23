provider "azurerm" {
  alias           = "core"
  subscription_id = var.core_subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  features {}
}

data "azurerm_resource_group" "corerg" {
  provider = azurerm.core
  name     = var.core_vnet_resource_group
}

data "azurerm_virtual_network" "corevnet" {
  provider            = azurerm.core
  name                = var.core_vnet_name
  resource_group_name = data.azurerm_resource_group.corerg.name
}

resource "azurerm_virtual_network_peering" "vnettocore" {
  name                         = "${module.vnet.virtual_network_name}To${var.core_vnet_name}"
  virtual_network_name         = module.vnet.virtual_network_name
  resource_group_name          = azurerm_resource_group.ofr.name
  remote_virtual_network_id    = "/subscriptions/${var.core_subscription_id}/resourceGroups/${var.core_vnet_resource_group}/providers/Microsoft.Network/virtualNetworks/${var.core_vnet_name}"
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}

resource "azurerm_virtual_network_peering" "coretovnet" {
  name                         = "${var.core_vnet_name}To${module.vnet.virtual_network_name}"
  virtual_network_name         = data.azurerm_virtual_network.corevnet.name
  resource_group_name          = data.azurerm_virtual_network.corevnet.resource_group_name
  remote_virtual_network_id    = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${azurerm_resource_group.ofr.name}/providers/Microsoft.Network/virtualNetworks/${module.vnet.virtual_network_name}"
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  depends_on                   = [azurerm_virtual_network_peering.vnettocore]
  provider                     = azurerm.core
}