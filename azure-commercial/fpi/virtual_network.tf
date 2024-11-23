resource "azurerm_virtual_network" "fpi-vnet" {
  name                      = var.environment == "production" ? "co-p-spi-fpi-vnet" : "vnt-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  address_space             = var.fpivnet_address_space
  resource_group_name       = module.rgfpi.resource_group_name
  location                  = module.rgfpi.resource_group_location
  dns_servers               = var.dns_servers
  tags                      = var.tags

  lifecycle {
    ignore_changes = [
      ddos_protection_plan
    ]
  }
}

resource "azurerm_subnet" "frontend" {
  name                      = var.environment == "production" ? "co-p-spi-fpi-gw-subnet" : "sub-${var.location_acronym}-${var.application_acronym}-agw-${var.environment_acronym}"
  resource_group_name       = module.rgfpi.resource_group_name
  virtual_network_name      = azurerm_virtual_network.fpi-vnet.name
  address_prefixes          = [var.address_prefix_frontend]
  service_endpoints         = var.SVCEP_frontend
}

resource "azurerm_subnet" "backend" {
  name                      = var.environment == "production" ? "co-p-fpi-app-subnet" : "sub-${var.location_acronym}-${var.application_acronym}-app-${var.environment_acronym}"
  resource_group_name       = module.rgfpi.resource_group_name
  virtual_network_name      = azurerm_virtual_network.fpi-vnet.name
  address_prefixes          = [var.address_prefix_backend]
  service_endpoints         = var.SVCEP_backend
}