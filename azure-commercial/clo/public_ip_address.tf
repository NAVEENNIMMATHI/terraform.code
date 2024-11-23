resource "azurerm_public_ip" "cloappgwpip" {
  name                = var.environment == "production" ? "co-p-eus-cloappgw-pip" : "pip-appgateway"
  location            = module.apprg.resource_group_location
  resource_group_name = module.apprg.resource_group_name
  allocation_method   = "Dynamic"
  
  tags                = var.tags
}

