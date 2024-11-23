resource "azurerm_network_security_group" "bmpagw1nsg" {
  name                = var.environment == "production" ? "co-p-eastus-bmpagw1-nsg" : "nsg-${var.location_acronym}-${var.application_acronym}-agw-${var.environment_acronym}"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name

  tags = var.tags
}

resource "azurerm_network_security_group" "bmpapp1nsg" {
  name                = var.environment == "production" ? "co-p-eastus-bmpapp1-nsg" : "nsg-${var.location_acronym}-${var.application_acronym}-app-${var.environment_acronym}"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name

  tags = var.tags
}

resource "azurerm_network_security_group" "kpimcapiqnsg" {
  name                = var.environment == "production" ? "co-p-eastus-kpimcapiq-nsg" : "nsg-${var.location_acronym}-${var.application_acronym}-kpimcapiq-${var.environment_acronym}"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name

  tags = var.tags
}

resource "azurerm_network_security_group" "bmprest1nsg" {
  name                = var.environment == "production" ? "co-p-eastus-bmprest1-nsg" : "nsg-${var.location_acronym}-${var.application_acronym}-rest-${var.environment_acronym}"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name

  tags = var.tags
}

resource "azurerm_network_security_group" "bmpinformaticansg" {
  name                = var.environment == "production" ? "co-p-eastus-bmpinformatica-nsg" : "nsg-${var.location_acronym}-${var.application_acronym}-informatica-${var.environment_acronym}"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name

  tags = var.tags
}

resource "azurerm_network_security_group" "bmpdb1nsg" {
  count               = var.environment == "production" ? "1" : "0"

  name                = var.environment == "production" ? "co-p-eastus-bmpdb1-nsg" : "nsg-${var.location_acronym}-${var.application_acronym}-db1-${var.environment_acronym}"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name

  tags = var.tags
}

resource "azurerm_network_security_group" "bmpdb1p1nsg" {
  count               = var.environment == "production" ? "1" : "0"

  name                = var.environment == "production" ? "nsg-uemcbmpdb1p1" : "nsg-${var.location_acronym}-${var.application_acronym}-db2-${var.environment_acronym}"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name

  tags = var.tags
}

resource "azurerm_network_security_group" "nsg-uemcbmpdb1p1" {
  name                = var.environment == "production" ? "nsg-uemcbmpdb1p1" : "nsg-${var.location_acronym}-${var.application_acronym}-db-${var.environment_acronym}"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name

  tags = var.tags
}

resource "azurerm_network_security_group" "bmpasensg" {
  name                = "nsg-${var.location_acronym}-${var.application_acronym}-ase-${var.environment_acronym}"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name

  tags = var.tags
}

resource "azurerm_network_security_group" "bmppensg" {
  name                = "nsg-${var.location_acronym}-${var.application_acronym}-pe-${var.environment_acronym}"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name

  tags = var.tags
}