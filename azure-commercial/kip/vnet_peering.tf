provider "azurerm" {
  alias                          = "core"
  subscription_id                = var.coresubscriptionid
  client_id                      = var.client_id
  client_secret                  = var.client_secret
  tenant_id                      = var.tenant_id
  features {}
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

resource "azurerm_virtual_network_peering" "vnettocore" {
  name                          = var.environment == "production" ? "${module.applicationvnet.virtual_network_name}To${var.corevnetname}" : "${module.applicationvnet.virtual_network_name}-to-vnt-${var.corevnetname}"
  virtual_network_name          = module.applicationvnet.virtual_network_name
  resource_group_name           = module.applicationrg.resource_group_name
  remote_virtual_network_id     = "/subscriptions/${var.coresubscriptionid}/resourceGroups/${var.corevnetresourcegroup}/providers/Microsoft.Network/virtualNetworks/${var.corevnetname}"
  allow_virtual_network_access  = true
  allow_forwarded_traffic       = true
}

resource "azurerm_virtual_network_peering" "coretovnet" {
  name                          = var.environment == "production" ? "${var.corevnetname}To${module.applicationvnet.virtual_network_name}" : "${var.corevnetname}-to-vnt-${module.applicationvnet.virtual_network_name}"
  virtual_network_name          = data.azurerm_virtual_network.corevnet.name
  resource_group_name           = data.azurerm_virtual_network.corevnet.resource_group_name
  remote_virtual_network_id     = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${module.applicationrg.resource_group_name}/providers/Microsoft.Network/virtualNetworks/${module.applicationvnet.virtual_network_name}"
  allow_virtual_network_access  = true
  allow_forwarded_traffic       = true
  depends_on                    = [azurerm_virtual_network_peering.vnettocore]
  provider                      = azurerm.core
}
