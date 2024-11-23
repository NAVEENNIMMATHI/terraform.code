resource "azurerm_public_ip" "gatewayip" {
  name                         = var.environment == "production" ? "CO-P-EASTUS-TAB-APPGW-ip" : "pip-apg-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name          = module.applicationrg.resource_group_name
  location                     = module.applicationrg.resource_group_location
  allocation_method            = "Static"
  sku                          = "Standard"
  domain_name_label            = var.environment == "production" ? "co-p-spitableauappgw" : "apg-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  tags                         = var.tags  
}