resource "azurerm_public_ip" "gatewayip" {
  name                         = var.environment == "production" ? "CO-${upper(var.location)}-${upper(var.application_acronym)}-APPGTWY-ip" : "pip-appgateway"
  resource_group_name          = azurerm_resource_group.cospivnetrg.name
  location                     = azurerm_resource_group.cospivnetrg.location
  allocation_method            = "Dynamic"

  tags                         = var.tags
  
}