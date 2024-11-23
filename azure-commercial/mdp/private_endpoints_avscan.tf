#Private Endpoint for AV Scanning Function App
resource "azurerm_private_endpoint" "avscan_fap" {
  name                = "pep-${azurerm_function_app.fun_avscan.name}"
  resource_group_name = module.mdp_rg_main.resource_group_name
  location            = module.mdp_rg_main.resource_group_location
  subnet_id           = module.mdp_subnet_pep.subnet_id

  private_service_connection {
    name                           = "pep-sites-${azurerm_function_app.fun_avscan.name}"
    private_connection_resource_id = azurerm_function_app.fun_avscan.id
    is_manual_connection           = false
    subresource_names              = ["sites"]
  }

  private_dns_zone_group {
    name                 = data.azurerm_private_dns_zone.dns_zone_azurewebsites.name
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_azurewebsites.id]
  }

  tags = var.tags
}

#Private Endpoint for AV Scanning Web App
resource "azurerm_private_endpoint" "avscan_wap" {
  name                = "pep-${azurerm_function_app.fun_avscan.name}"
  resource_group_name = module.mdp_rg_main.resource_group_name
  location            = module.mdp_rg_main.resource_group_location
  subnet_id           = module.mdp_subnet_pep.subnet_id

  private_service_connection {
    name                           = "pep-sites-${azurerm_function_app.fun_avscan.name}"
    private_connection_resource_id = azurerm_function_app.fun_avscan.id
    is_manual_connection           = false
    subresource_names              = ["sites"]
  }

  private_dns_zone_group {
    name                 = data.azurerm_private_dns_zone.dns_zone_azurewebsites.name
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_azurewebsites.id]
  }

  tags = var.tags
}