resource "azurerm_virtual_network" "clo-vnet" {
  name                      = var.environment=="production" ? "co-p-eastus-clo-vnet" : "vnt-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  address_space             = var.address_space
  resource_group_name       = module.vnetrg.resource_group_name
  location                  = module.vnetrg.resource_group_location
  dns_servers               = var.dns_servers

  tags                      = var.tags

  lifecycle {
    ignore_changes = [
      ddos_protection_plan
    ]
  }
}

resource "azurerm_subnet" "cloappgwsbn" {
  name                      = var.environment == "production" ? "co-p-eastus-cloappGW-subnet" : "sub-${var.location_acronym}-cloappgw-${var.environment_acronym}"
  virtual_network_name      = azurerm_virtual_network.clo-vnet.name
  resource_group_name       = module.vnetrg.resource_group_name
  address_prefixes          = var.subnet_adress_space_cloappgw
  service_endpoints         = ["Microsoft.Storage", "Microsoft.Sql"]
}

resource "azurerm_subnet" "clomgmtsbn" {
  name                      = var.environment == "production" ? "co-p-eastus-clomgmt-subnet" : "sub-${var.location_acronym}-clomgmt-${var.environment_acronym}"
  virtual_network_name      = azurerm_virtual_network.clo-vnet.name
  resource_group_name       = module.vnetrg.resource_group_name
  address_prefixes          = var.subnet_adress_space_clomgmt
  service_endpoints         = ["Microsoft.Storage", "Microsoft.Sql"]
}

resource "azurerm_subnet" "clowebsbn" {
  name                      = var.environment == "production" ? "co-p-eastus-cloweb-subnet" : "sub-${var.location_acronym}-cloweb-${var.environment_acronym}"
  virtual_network_name      = azurerm_virtual_network.clo-vnet.name
  resource_group_name       = module.vnetrg.resource_group_name
  address_prefixes          = var.subnet_adress_space_cloweb
  service_endpoints         = ["Microsoft.Storage", "Microsoft.Sql"]
}

