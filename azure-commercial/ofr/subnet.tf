resource "azurerm_subnet" "app" {
  name                      = "sub-${var.location_acronym}-app-${var.environment_acronym}"
  virtual_network_name      = module.vnet.virtual_network_name
  resource_group_name       = azurerm_resource_group.ofr.name
  address_prefixes          = var.app_subnet_address_prefixes
  enforce_private_link_endpoint_network_policies = true
  service_endpoints         = ["Microsoft.Storage", "Microsoft.KeyVault", "Microsoft.Sql"]
}

resource "azurerm_subnet" "build" {
  name                      = "sub-${var.location_acronym}-build-${var.environment_acronym}"
  resource_group_name       = azurerm_resource_group.ofr.name
  virtual_network_name      = module.vnet.virtual_network_name
  address_prefixes          = var.build_subnet_address_prefixes
  enforce_private_link_endpoint_network_policies = true
  service_endpoints         = ["Microsoft.Storage", "Microsoft.KeyVault", "Microsoft.Sql"]
  depends_on                = [azurerm_subnet.app]
}

resource "azurerm_subnet" "agw" {
  name                      = "sub-${var.location_acronym}-agw-${var.environment_acronym}"
  virtual_network_name      = module.vnet.virtual_network_name
  resource_group_name       = azurerm_resource_group.ofr.name
  address_prefixes          = var.agw_subnet_address_prefixes
  enforce_private_link_endpoint_network_policies = true
  service_endpoints         = ["Microsoft.Storage", "Microsoft.KeyVault", "Microsoft.Web"]
  depends_on                = [azurerm_subnet.build]
}