resource "azurerm_virtual_network_peering" "main_vnet_to_hub" {
  name                         = "${module.geospatial_vnet_main.virtual_network_name}-to-${data.azurerm_virtual_network.hub.name}"
  virtual_network_name         = module.geospatial_vnet_main.virtual_network_name
  resource_group_name          = module.geospatial_rg.resource_group_name
  remote_virtual_network_id    = data.azurerm_virtual_network.hub.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}

resource "azurerm_virtual_network_peering" "hub_to_main_vnet" {
  name                         = "${data.azurerm_virtual_network.hub.name}-to-${module.geospatial_vnet_main.virtual_network_name}"
  virtual_network_name         = data.azurerm_virtual_network.hub.name
  resource_group_name          = var.hub_vnet_resource_group_name
  remote_virtual_network_id    = module.geospatial_vnet_main.virtual_network_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true

  depends_on = [azurerm_virtual_network_peering.main_vnet_to_hub]
  provider   = azurerm.hub
}

resource "azurerm_virtual_network_peering" "main_vnet_to_transit" {
  name                         = "${module.geospatial_vnet_main.virtual_network_name}-to-${data.azurerm_virtual_network.transit.name}"
  virtual_network_name         = module.geospatial_vnet_main.virtual_network_name
  resource_group_name          = module.geospatial_rg.resource_group_name
  remote_virtual_network_id    = data.azurerm_virtual_network.transit.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}

resource "azurerm_virtual_network_peering" "transit_to_main_vnet" {
  name                         = "${data.azurerm_virtual_network.transit.name}-to-${module.geospatial_vnet_main.virtual_network_name}"
  virtual_network_name         = data.azurerm_virtual_network.transit.name
  resource_group_name          = data.azurerm_virtual_network.transit.resource_group_name
  remote_virtual_network_id    = module.geospatial_vnet_main.virtual_network_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  depends_on                   = [azurerm_virtual_network_peering.main_vnet_to_transit]
  provider                     = azurerm.transit
}

/*
resource "azurerm_virtual_network_peering" "main_vnet_to_shared" {
  name                         = "${module.geospatial_vnet_main.virtual_network_name}-to-${data.azurerm_virtual_network.shared.name}"
  virtual_network_name         = module.geospatial_vnet_main.virtual_network_name
  resource_group_name          = module.geospatial_rg.resource_group_name
  remote_virtual_network_id    = data.azurerm_virtual_network.shared.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}

resource "azurerm_virtual_network_peering" "shared_to_main_vnet" {
  name                         = "${data.azurerm_virtual_network.shared.name}-to-${module.geospatial_vnet_main.virtual_network_name}"
  virtual_network_name         = data.azurerm_virtual_network.shared.name
  resource_group_name          = var.shared_resource_group_name
  remote_virtual_network_id    = module.geospatial_vnet_main.virtual_network_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true

  depends_on = [azurerm_virtual_network_peering.main_vnet_to_shared]
  provider   = azurerm.shared
}
*/