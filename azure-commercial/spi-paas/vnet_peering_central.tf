resource "azurerm_virtual_network_peering" "coretocentralvnet" {
  name                         = "${var.corevnetname}-to-${azurerm_virtual_network.spipaassvnetcentral.name}"
  virtual_network_name         = var.corevnetname
  resource_group_name          = var.corevnetresourcegroup
  remote_virtual_network_id    = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${module.applicationrg_central.resource_group_name}/providers/Microsoft.Network/virtualNetworks/${azurerm_virtual_network.spipaassvnetcentral.name}"
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true

  depends_on = [azurerm_virtual_network_peering.centralvnettocore]
  provider   = azurerm.core
}

resource "azurerm_virtual_network_peering" "newcoretocentralvnet" {
  name                         = "${var.newcorevnetname}-to-${azurerm_virtual_network.spipaassvnetcentral.name}"
  virtual_network_name         = var.newcorevnetname
  resource_group_name          = var.newcorevnetresourcegroup
  remote_virtual_network_id    = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${module.applicationrg_central.resource_group_name}/providers/Microsoft.Network/virtualNetworks/${azurerm_virtual_network.spipaassvnetcentral.name}"
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true

  depends_on = [azurerm_virtual_network_peering.centralvnettonewcore]
  provider   = azurerm.newcore
}

resource "azurerm_virtual_network_peering" "centralvnettocore" {
  name                         = "${azurerm_virtual_network.spipaassvnetcentral.name}-to-${var.corevnetname}"
  virtual_network_name         = azurerm_virtual_network.spipaassvnetcentral.name
  resource_group_name          = module.applicationrg_central.resource_group_name
  remote_virtual_network_id    = "/subscriptions/${var.coresubscriptionid}/resourceGroups/${var.corevnetresourcegroup}/providers/Microsoft.Network/virtualNetworks/${var.corevnetname}"
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}
resource "azurerm_virtual_network_peering" "centralvnettonewcore" {
  name                         = "${azurerm_virtual_network.spipaassvnetcentral.name}-to-${var.newcorevnetname}"
  virtual_network_name         = azurerm_virtual_network.spipaassvnetcentral.name
  resource_group_name          = module.applicationrg_central.resource_group_name
  remote_virtual_network_id    = "/subscriptions/${var.newcoresubscriptionid}/resourceGroups/${var.newcorevnetresourcegroup}/providers/Microsoft.Network/virtualNetworks/${var.newcorevnetname}"
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}

