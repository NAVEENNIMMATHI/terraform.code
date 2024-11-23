resource "azurerm_network_security_group" "fpi-app-nsg-frontend" {
  name                        = var.environment=="production" ? "co-p-spi-fpi-gw-nsg" : "nsg-${var.location_acronym}-${var.application_acronym}-agw-${var.environment_acronym}"
  resource_group_name         = module.rgfpi.resource_group_name
  location                    = module.rgfpi.resource_group_location
  tags                        = var.tags
}

resource "azurerm_network_security_group" "fpi-app-nsg-backend" {
  name                        = var.environment=="production" ? "co-p-spi-fpi-app-nsg" : "nsg-${var.location_acronym}-${var.application_acronym}-app-${var.environment_acronym}"
  resource_group_name         = module.rgfpi.resource_group_name
  location                    = module.rgfpi.resource_group_location
  tags                        = var.tags
}