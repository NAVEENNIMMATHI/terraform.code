module "vnet" {
  source                  = "../../modules12/virtual_network"
  virtual_network_name    = "vnt-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_location = azurerm_resource_group.ofr.location
  resource_group_name     = azurerm_resource_group.ofr.name
  address_space           = var.address_space
  dns_server              = var.dns_server

  tags                    = var.tags
}
