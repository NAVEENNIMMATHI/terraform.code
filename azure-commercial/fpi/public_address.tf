resource "azurerm_public_ip" "fpiappgwpip" {
  name                                        = var.environment=="production" ? "fpi-gw-pip" : "pip-agw-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name                         = module.rgfpi.resource_group_name
  location                                    = module.rgfpi.resource_group_location
  allocation_method                           = "Static"
  sku                                         = "Standard"
  ip_version                                  = "IPv4"
  domain_name_label                           = var.domain_name_label
  tags                                        = var.tags
}