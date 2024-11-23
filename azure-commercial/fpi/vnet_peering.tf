provider "azurerm" {
  alias                          = "core"
  subscription_id                = var.coresubscriptionid
  features {}
  client_id                      = var.client_id
  client_secret                  = var.client_secret
  tenant_id                      = var.tenant_id
}

data "azurerm_resource_group" "corerg" {
  provider                       = azurerm.core
  name                           = var.corevnetresourcegroup
}

data "azurerm_virtual_network" "corevnet" {
  provider                       = azurerm.core
  name                           = var.corevnetname
  resource_group_name            = data.azurerm_resource_group.corerg.name
}

resource "azurerm_virtual_network_peering" "vnet_to_core" {
  name                         = "${azurerm_virtual_network.fpi-vnet.name}To${var.vnetpeering1_remote_vnet_name}"
  virtual_network_name         = azurerm_virtual_network.fpi-vnet.name
  resource_group_name          = module.rgfpi.resource_group_name
  remote_virtual_network_id    = var.vnetpeering1_remote_vnet_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}

resource "azurerm_virtual_network_peering" "core_to_vnet" {
  name                         = "${var.vnetpeering1_remote_vnet_name}To${azurerm_virtual_network.fpi-vnet.name}"
  virtual_network_name         = var.vnetpeering1_remote_vnet_name
  resource_group_name          = var.vnetpeering1_remote_vnet_resource_group_name
  remote_virtual_network_id    = azurerm_virtual_network.fpi-vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true

  depends_on                   = [azurerm_virtual_network_peering.vnet_to_core]
  provider                      = azurerm.core
}