resource "azurerm_network_security_group" "tabappgw_nsg" {
  count               = var.environment == "production" ? "0" : "1"

  name                = "nsg-${var.location_acronym}-${var.application_acronym_spi}-${var.application_acronym}appgw-${var.environment_acronym}"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  tags                = var.tags
}

module "tabext_nsg" {
  source              = "../../modules/network_security_group"
  name                = var.environment == "production" ? "co-p-eastus-tabext-nsg" : "nsg-${var.location_acronym}-${var.application_acronym_spi}-${var.application_acronym}ext-${var.environment_acronym}"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  tags                = var.tags
}