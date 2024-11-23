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

data "azurerm_resource_group" "corerg" {
  provider = azurerm.core
  name     = var.corevnetresourcegroup
}

data "azurerm_resource_group" "transitrg" {
  provider = azurerm.transit
  name     = var.transitvnetresourcegroup
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

resource "azurerm_virtual_network_peering" "vnettocore" {
  name                         = "${module.applicationvnet.virtual_network_name}Toco-${var.environment}-${var.application_rg_location}-core1-vnet${var.uniqueresourcesuffix}"
  virtual_network_name         = module.applicationvnet.virtual_network_name
  resource_group_name          = module.applicationrg.resource_group_name
  remote_virtual_network_id    = "/subscriptions/${var.coresubscriptionid}/resourceGroups/${var.corevnetresourcegroup}/providers/Microsoft.Network/virtualNetworks/${var.corevnetname}"
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}

resource "azurerm_virtual_network_peering" "vnettotransit" {
  name                         = "${module.applicationvnet.virtual_network_name}ToCO-${upper(var.environment)}-${var.application_rg_location}-transit1-Vnet${var.uniqueresourcesuffix}"
  virtual_network_name         = module.applicationvnet.virtual_network_name
  resource_group_name          = module.applicationrg.resource_group_name
  remote_virtual_network_id    = "/subscriptions/${var.transitsubscriptionid}/resourceGroups/${var.transitvnetresourcegroup}/providers/Microsoft.Network/virtualNetworks/${var.transitvnetname}"
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}

resource "azurerm_virtual_network_peering" "coretovnet" {
  name                         = "co-${var.environment}-${var.application_rg_location}-core1-vnetTo${module.applicationvnet.virtual_network_name}${var.uniqueresourcesuffix}"
  virtual_network_name         = data.azurerm_virtual_network.corevnet.name
  resource_group_name          = data.azurerm_virtual_network.corevnet.resource_group_name
  remote_virtual_network_id    = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${module.applicationrg.resource_group_name}/providers/Microsoft.Network/virtualNetworks/${module.applicationvnet.virtual_network_name}"
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true

  depends_on = [azurerm_virtual_network_peering.vnettocore]
  provider   = azurerm.core
}

resource "azurerm_virtual_network_peering" "transittovnet" {
  name                         = "CO-${upper(var.environment)}-${var.application_rg_location}-transit1-VnetTo${module.applicationvnet.virtual_network_name}${var.uniqueresourcesuffix}"
  virtual_network_name         = data.azurerm_virtual_network.transitvnet.name
  resource_group_name          = data.azurerm_virtual_network.transitvnet.resource_group_name
  remote_virtual_network_id    = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${module.applicationrg.resource_group_name}/providers/Microsoft.Network/virtualNetworks/${module.applicationvnet.virtual_network_name}"
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true

  depends_on = [azurerm_virtual_network_peering.vnettotransit]
  provider   = azurerm.transit
}

