#1 Opkey App Gateway

resource "azurerm_network_security_group" "opkeyappgw" {
  name                = "nsg-${var.location_acronym}-${var.application_acronym}-gw-${var.environment_acronym}"
  location            = module.opkey_rg.resource_group_location
  resource_group_name = module.opkey_rg.resource_group_name

  tags = var.tags
}
 
#2 Opkey App Server

resource "azurerm_network_security_group" "opkeyappserver" {
  name                = "nsg-${var.location_acronym}-${var.application_acronym}-app-${var.environment_acronym}"
  location            = module.opkey_rg.resource_group_location
  resource_group_name = module.opkey_rg.resource_group_name

  tags = var.tags
}

#3 OpKey Private End point

resource "azurerm_network_security_group" "opkeypep" {
  name                = "nsg-${var.location_acronym}-${var.application_acronym}-pep-${var.environment_acronym}"
  location            = module.opkey_rg.resource_group_location
  resource_group_name = module.opkey_rg.resource_group_name

  tags = var.tags
}

#4 OpKey MySql

resource "azurerm_network_security_group" "opkeymysql" {
  name                = "nsg-${var.location_acronym}-${var.application_acronym}-data-${var.environment_acronym}"
  location            = module.opkey_rg.resource_group_location
  resource_group_name = module.opkey_rg.resource_group_name

  tags = var.tags
}