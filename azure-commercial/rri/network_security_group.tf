resource "azurerm_network_security_group" "rridbnsg" {
  name                = "nsg-${var.location_acronym}-${var.application_acronym}-db-${var.environment_acronym}"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name

  tags = var.tags
}

resource "azurerm_network_security_group" "rripbinsg" {
  name                = "nsg-${var.location_acronym}-${var.application_acronym}-pbi-${var.environment_acronym}"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name

  tags = var.tags
}

resource "azurerm_network_security_group" "rrimgtnsg" {
  name                = "nsg-${var.location_acronym}-${var.application_acronym}-mgt-${var.environment_acronym}"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name

  tags = var.tags
}

resource "azurerm_network_security_group" "rriapgwnsg" {
  name                = "nsg-${var.location_acronym}-${var.application_acronym}-apgw-${var.environment_acronym}"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name

  tags = var.tags
}
