data "azurerm_subscription" "current" {}

provider "azurerm" {
  alias           = "core"
  subscription_id = var.coresubscriptionid
   client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  features {    
  }
}
provider "azurerm" {
  alias           = "transit"
  subscription_id = var.transitsubscriptionid
   client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  features {    
  }
}

data "azurerm_resource_group" "corerg" {
  provider = azurerm.core
  name     = var.corevnet_resource_group_name
}
data "azurerm_resource_group" "transitrg" {
  provider = azurerm.transit
  name     = var.transitvnet_resource_group_name
}
data "azurerm_virtual_network" "corevnet" {
  provider            = azurerm.core
  name                = var.core_vnet_name
  resource_group_name = data.azurerm_resource_group.corerg.name
}
data "azurerm_virtual_network" "transitvnet" {
  provider            = azurerm.transit
  name                = var.transit_vnet_name
  resource_group_name = data.azurerm_resource_group.transitrg.name
}


resource "azurerm_virtual_network_peering" "vnettocore" {
 name                        = "vnet-${var.location_acronym}-ase-${lower(var.environment_acronym)}-to-vnet-${var.location_acronym}-core-${lower(var.environment_acronym)}"
 virtual_network_name         = module.sharedvnet.virtual_network_name
 resource_group_name          = module.sharedrg.resource_group_name
 remote_virtual_network_id    = "/subscriptions/${var.coresubscriptionid}/resourceGroups/${var.corevnet_resource_group_name}/providers/Microsoft.Network/virtualNetworks/${var.core_vnet_name}"
 allow_virtual_network_access = true
 allow_forwarded_traffic      = true
}
resource "azurerm_virtual_network_peering" "vnettotransit" {
 name                        = "vnet-${var.location_acronym}-ase-${lower(var.environment_acronym)}-to-vnet-${var.location_acronym}-transit-${lower(var.environment_acronym)}"
 virtual_network_name         = module.sharedvnet.virtual_network_name
 resource_group_name          = module.sharedrg.resource_group_name
 remote_virtual_network_id    = "/subscriptions/${var.transitsubscriptionid}/resourceGroups/${var.transitvnet_resource_group_name}/providers/Microsoft.Network/virtualNetworks/${var.transit_vnet_name}"
 allow_virtual_network_access = true
 allow_forwarded_traffic      = true
}

resource "azurerm_virtual_network_peering" "coretovnet" {
 name                         = "vnet-${var.location_acronym}-core-${lower(var.environment_acronym)}-to-vnet-${var.location_acronym}-${var.new_uat_suffix_coretovnet_peering}ase-${lower(var.environment_acronym)}"
 virtual_network_name         = data.azurerm_virtual_network.corevnet.name
 resource_group_name          = var.corevnet_resource_group_name
 remote_virtual_network_id    = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${module.sharedrg.resource_group_name}/providers/Microsoft.Network/virtualNetworks/${module.sharedvnet.virtual_network_name}"
 allow_virtual_network_access = true
 allow_forwarded_traffic      = true

 depends_on = [azurerm_virtual_network_peering.vnettocore]
 provider = azurerm.core
}

resource "azurerm_virtual_network_peering" "transittovnet" {
 name                         = "vnet-${var.location_acronym}-transit-${lower(var.environment_acronym)}-to-vnet-${var.location_acronym}-ase-${lower(var.environment_acronym)}"
 virtual_network_name         = data.azurerm_virtual_network.transitvnet.name
 resource_group_name          = data.azurerm_virtual_network.transitvnet.resource_group_name
 remote_virtual_network_id    = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${module.sharedrg.resource_group_name}/providers/Microsoft.Network/virtualNetworks/${module.sharedvnet.virtual_network_name}"
 allow_virtual_network_access = true
 allow_forwarded_traffic      = true

 depends_on = [azurerm_virtual_network_peering.vnettotransit]
 provider = azurerm.transit
}
