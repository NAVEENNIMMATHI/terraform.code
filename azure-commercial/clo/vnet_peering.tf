provider "azurerm" {
  alias                          = "hub"
  subscription_id                = var.hubsubscriptionid
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

data "azurerm_resource_group" "hubrg" {
  provider                       = azurerm.hub
  name                           = var.hubvnetresourcegroup
}

data "azurerm_resource_group" "transitrg" {
  provider                       = azurerm.transit
  name                           = var.transitvnetresourcegroup
}

data "azurerm_virtual_network" "hubvnet" {
  provider                       = azurerm.hub
  name                           = var.hubvnetname
  resource_group_name            = data.azurerm_resource_group.hubrg.name
}

data "azurerm_virtual_network" "transitvnet" {
  provider                      = azurerm.transit
  name                          = var.transitvnetname
  resource_group_name           = data.azurerm_resource_group.transitrg.name
}

resource "azurerm_virtual_network_peering" "vnettohub" {
  name                         = var.environment == "production" ? "co-p-eastus-clo-vnet_To_co-p-eastus-clo-vnettoCO-P-eastus-hub-vnet" : "${azurerm_virtual_network.clo-vnet.name}-to-vnt-${var.hubvnetname}"
  virtual_network_name         = azurerm_virtual_network.clo-vnet.name
  resource_group_name          = module.vnetrg.resource_group_name
  remote_virtual_network_id    = var.hub_vnet_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
}

resource "azurerm_virtual_network_peering" "vnettotransit" {
  name                         = var.environment == "production" ? "co-p-eastus-clo-vnet_To_co-p-eastus-clo-vnettoCO-P-eastus-transit-vnet" : "${azurerm_virtual_network.clo-vnet.name}-to-vnt-${var.transitvnetname}"
  virtual_network_name         = azurerm_virtual_network.clo-vnet.name
  resource_group_name          = module.vnetrg.resource_group_name
  remote_virtual_network_id    = var.transit_vnet_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
}

resource "azurerm_virtual_network_peering" "hubtovnet" {
  name                         = var.environment == "production" ? "CO-P-eastus-hub-vnettoco-p-eastus-clo-vnet" : "${var.hubvnetname}-to-${azurerm_virtual_network.clo-vnet.name}"
  virtual_network_name         = var.hubvnetname
  resource_group_name          = var.hubvnetresourcegroup
  remote_virtual_network_id    = azurerm_virtual_network.clo-vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  depends_on                   = [azurerm_virtual_network_peering.vnettohub]
  provider                     = azurerm.hub
}

resource "azurerm_virtual_network_peering" "transittovnet" {
  name                         = var.environment == "production" ? "CO-P-eastus-transit-vnettoco-p-eastus-clo-vnet" : "${var.transitvnetname}-to-${azurerm_virtual_network.clo-vnet.name}"
  virtual_network_name         = var.transitvnetname
  resource_group_name          = var.transitvnetresourcegroup
  remote_virtual_network_id    = azurerm_virtual_network.clo-vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  depends_on                   = [azurerm_virtual_network_peering.vnettotransit]
  provider                     = azurerm.transit
}