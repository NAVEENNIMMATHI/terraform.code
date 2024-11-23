provider "azurerm" {
  alias           = "core"
  subscription_id = var.coresubscriptionid
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  features {}
}

provider "azurerm" {
  alias           = "transit"
  subscription_id = var.transitsubscriptionid
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  features {}
}

provider "azurerm" {
  alias           = "newcore"
  subscription_id = var.newcoresubscriptionid
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  features {}
}

data "azurerm_resource_group" "corerg" {
  provider = azurerm.core
  name     = var.corevnetresourcegroup
}

data "azurerm_resource_group" "transitrg" {
  provider = azurerm.transit
  name     = var.transitvnetresourcegroup
}

data "azurerm_resource_group" "newcorerg" {
  provider = azurerm.newcore
  name     = var.newcorevnetresourcegroup
}

data "azurerm_virtual_network" "corevnet" {
  provider            = azurerm.core
  name                = var.corevnetname
  resource_group_name = data.azurerm_resource_group.corerg.name
}

data "azurerm_virtual_network" "transitvnet" {
  provider            = azurerm.transit
  name                = var.transitvnetname
  resource_group_name = data.azurerm_resource_group.transitrg.name
}

data "azurerm_virtual_network" "newcorevnet" {
  provider            = azurerm.newcore
  name                = var.newcorevnetname
  resource_group_name = data.azurerm_resource_group.newcorerg.name
}

resource "azurerm_virtual_network_peering" "vnettocore" {
  name                         = var.environment == "production" ? "co-p-eastus-krt-vnetToco-p-eastus-core1-vnet" : "${module.applicationvnet.virtual_network_name}-to-${var.corevnetname}"
  virtual_network_name         = module.applicationvnet.virtual_network_name
  resource_group_name          = module.applicationrg.resource_group_name
  remote_virtual_network_id    = "/subscriptions/${var.coresubscriptionid}/resourceGroups/${var.corevnetresourcegroup}/providers/Microsoft.Network/virtualNetworks/${var.corevnetname}"
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}

resource "azurerm_virtual_network_peering" "vnettotransit" {
  name                         = var.environment == "production" ? "co-p-eastus-krt-vnetToCO-P-eastus-transit1-Vnet" : "${module.applicationvnet.virtual_network_name}-to-${var.transitvnetname}"
  virtual_network_name         = module.applicationvnet.virtual_network_name
  resource_group_name          = module.applicationrg.resource_group_name
  remote_virtual_network_id    = "/subscriptions/${var.transitsubscriptionid}/resourceGroups/${var.transitvnetresourcegroup}/providers/Microsoft.Network/virtualNetworks/${var.transitvnetname}"
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}

resource "azurerm_virtual_network_peering" "vnettonewcore" {
  count                        = var.environment == "production" ? "0" : "1"

  name                         = "${module.applicationvnet.virtual_network_name}-to-${var.newcorevnetname}"
  virtual_network_name         = module.applicationvnet.virtual_network_name
  resource_group_name          = module.applicationrg.resource_group_name
  remote_virtual_network_id    = "/subscriptions/${var.newcoresubscriptionid}/resourceGroups/${var.newcorevnetresourcegroup}/providers/Microsoft.Network/virtualNetworks/${var.newcorevnetname}"
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}

resource "azurerm_virtual_network_peering" "coretovnet" {
  name                         = var.environment == "production" ? "co-p-eastus-core1-vnetToco-p-eastus-krt-vnet" : "${var.corevnetname}-to-${module.applicationvnet.virtual_network_name}"
  virtual_network_name         = data.azurerm_virtual_network.corevnet.name
  resource_group_name          = data.azurerm_virtual_network.corevnet.resource_group_name
  remote_virtual_network_id    = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${module.applicationrg.resource_group_name}/providers/Microsoft.Network/virtualNetworks/${module.applicationvnet.virtual_network_name}"
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true

  depends_on = [azurerm_virtual_network_peering.vnettocore]
  provider   = azurerm.core
}

resource "azurerm_virtual_network_peering" "transittovnet" {
  name                         = var.environment == "production" ? "CO-P-eastus-transit1-VnetToco-p-eastus-krt-vnet" : "${var.transitvnetname}-to-${module.applicationvnet.virtual_network_name}"
  virtual_network_name         = data.azurerm_virtual_network.transitvnet.name
  resource_group_name          = data.azurerm_virtual_network.transitvnet.resource_group_name
  remote_virtual_network_id    = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${module.applicationrg.resource_group_name}/providers/Microsoft.Network/virtualNetworks/${module.applicationvnet.virtual_network_name}"
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true

  depends_on = [azurerm_virtual_network_peering.vnettotransit]
  provider   = azurerm.transit
}

resource "azurerm_virtual_network_peering" "newcoretovnet" {
  count                        = var.environment == "production" ? "0" : "1"

  name                         = "${var.newcorevnetname}-to-${module.applicationvnet.virtual_network_name}"
  virtual_network_name         = data.azurerm_virtual_network.newcorevnet.name
  resource_group_name          = data.azurerm_virtual_network.newcorevnet.resource_group_name
  remote_virtual_network_id    = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${module.applicationrg.resource_group_name}/providers/Microsoft.Network/virtualNetworks/${module.applicationvnet.virtual_network_name}"
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true

  depends_on = [azurerm_virtual_network_peering.vnettonewcore]
  provider   = azurerm.newcore
}