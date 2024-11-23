provider "azurerm" {
  alias                          = "core"
  subscription_id                = var.coresubscriptionid
  features {}
  client_id                      = var.client_id
  client_secret                  = var.client_secret
  tenant_id                      = var.tenant_id
}

provider "azurerm" {
  alias                          = "transit"
  subscription_id                = var.transitsubscriptionid
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

data "azurerm_resource_group" "transitrg" {
  provider                       = azurerm.transit
  name                           = var.transitvnetresourcegroup
}

data "azurerm_virtual_network" "transitvnet" {
  provider                       = azurerm.transit
  name                           = var.transitvnetname
  resource_group_name            = data.azurerm_resource_group.transitrg.name
}

resource "azurerm_virtual_network_peering" "vnet_to_core" {
  name                         = "${module.applicationvnet.virtual_network_name}To${data.azurerm_virtual_network.corevnet.name}"
  virtual_network_name         = module.applicationvnet.virtual_network_name
  resource_group_name          = module.applicationrg.resource_group_name
  remote_virtual_network_id    = data.azurerm_virtual_network.corevnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}

resource "azurerm_virtual_network_peering" "core_to_vnet" {
  name                         = "${data.azurerm_virtual_network.corevnet.name}To${module.applicationvnet.virtual_network_name}"
  virtual_network_name         = data.azurerm_virtual_network.corevnet.name
  resource_group_name          = data.azurerm_virtual_network.corevnet.resource_group_name
  remote_virtual_network_id    = module.applicationvnet.virtual_network_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true

  depends_on                   = [azurerm_virtual_network_peering.vnet_to_core]
  provider                      = azurerm.core
}

resource "azurerm_virtual_network_peering" "vnet_to_transit" {
  name                         = "${module.applicationvnet.virtual_network_name}To${data.azurerm_virtual_network.transitvnet.name}"
  virtual_network_name         = module.applicationvnet.virtual_network_name
  resource_group_name          = module.applicationrg.resource_group_name
  remote_virtual_network_id    = data.azurerm_virtual_network.transitvnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}

resource "azurerm_virtual_network_peering" "transit_to_vnet" {
  name                         = "${data.azurerm_virtual_network.transitvnet.name}To${module.applicationvnet.virtual_network_name}"
  virtual_network_name         = data.azurerm_virtual_network.transitvnet.name
  resource_group_name          = data.azurerm_virtual_network.transitvnet.resource_group_name
  remote_virtual_network_id    = module.applicationvnet.virtual_network_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true

  depends_on                   = [azurerm_virtual_network_peering.vnet_to_transit]
  provider                      = azurerm.transit
}