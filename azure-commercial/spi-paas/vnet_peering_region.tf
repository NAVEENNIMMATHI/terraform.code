resource "azurerm_virtual_network_peering" "coretoappvnet" {
  for_each = var.application_vnet
  name                         = "${var.corevnetname}-to-${azurerm_virtual_network.virtual_network[each.key].name}"
  virtual_network_name         = var.corevnetname
  resource_group_name          = var.corevnetresourcegroup
  remote_virtual_network_id    = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${module.applicationrg[each.key].resource_group_name}/providers/Microsoft.Network/virtualNetworks/${azurerm_virtual_network.virtual_network[each.key].name}"
  allow_virtual_network_access = true
  allow_forwarded_traffic      = false

  depends_on = [azurerm_virtual_network_peering.appvnettocore]
  provider   = azurerm.core
}


resource "azurerm_virtual_network_peering" "newcoretoappvnet" {
  for_each = var.application_vnet
  name                         = "${var.newcorevnetname}-to-${azurerm_virtual_network.virtual_network[each.key].name}"
  virtual_network_name         = var.newcorevnetname
  resource_group_name          = var.newcorevnetresourcegroup
  remote_virtual_network_id    = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${module.applicationrg[each.key].resource_group_name}/providers/Microsoft.Network/virtualNetworks/${azurerm_virtual_network.virtual_network[each.key].name}"
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true

  depends_on = [azurerm_virtual_network_peering.appvnettonewcore]
  provider   = azurerm.newcore
}

resource "azurerm_virtual_network_peering" "appvnettocore" {
  for_each = var.application_vnet
  name                         = "${azurerm_virtual_network.virtual_network[each.key].name}-to-${var.corevnetname}"
  virtual_network_name         = azurerm_virtual_network.virtual_network[each.key].name
  resource_group_name          = module.applicationrg[each.key].resource_group_name
  remote_virtual_network_id    = "/subscriptions/${var.coresubscriptionid}/resourceGroups/${var.corevnetresourcegroup}/providers/Microsoft.Network/virtualNetworks/${var.corevnetname}"
  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
}
resource "azurerm_virtual_network_peering" "appvnettonewcore" {
  for_each = var.application_vnet
  name                         = "${azurerm_virtual_network.virtual_network[each.key].name}-to-${var.newcorevnetname}"
  virtual_network_name         = azurerm_virtual_network.virtual_network[each.key].name
  resource_group_name          = module.applicationrg[each.key].resource_group_name
  remote_virtual_network_id    = "/subscriptions/${var.newcoresubscriptionid}/resourceGroups/${var.newcorevnetresourcegroup}/providers/Microsoft.Network/virtualNetworks/${var.newcorevnetname}"
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}
