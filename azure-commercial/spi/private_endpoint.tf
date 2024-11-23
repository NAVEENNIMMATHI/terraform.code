resource "azurerm_private_endpoint" "private_endpoint" {
  name                = lower("pe-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}")
  location            = azurerm_resource_group.cospivnetrg.location
  resource_group_name = azurerm_resource_group.cospivnetrg.name
  subnet_id           = azurerm_subnet.private_endpoint.id
  private_service_connection {
    name                           = lower("pesc-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}")
    private_connection_resource_id = module.spifishfileshare.id
    subresource_names              = ["file"]#"blob","file","queue","table","web"
    is_manual_connection           = false
  }
  tags               = var.tags
}
resource "azurerm_private_endpoint" "cons_private_endpoint" {
  name                = lower("pe-${var.location_acronym}-cons${var.application_acronym}-${var.environment_acronym}")
  location            = azurerm_resource_group.cospivnetrg.location
  resource_group_name = azurerm_resource_group.cospivnetrg.name
  subnet_id           = azurerm_subnet.private_endpoint.id
  private_service_connection {
    name                           = lower("pe-${var.location_acronym}-cons-${var.application_acronym}-${var.environment_acronym}")
    private_connection_resource_id = module.consspistorageaccount.id
    subresource_names              = ["file"]#"blob","file","queue","table","web"
    is_manual_connection           = false
  }
   private_dns_zone_group {
           name                 = lower("pe-${var.location_acronym}-cons-${var.application_acronym}-${var.environment_acronym}")
           private_dns_zone_ids = [
                "/subscriptions/${var.pvt_dns_subscription_id}/resourceGroups/${var.pvt_dns_resource_group}/providers/Microsoft.Network/privateDnsZones/privatelink.file.core.windows.net",
             ] 
         }
  tags               = var.tags_cons
}

#Connection between Arcgis pep to Spi share Storage account

resource "azurerm_private_endpoint" "arcgis_pep" {
  name                = lower("pe-${var.location_acronym}-${var.application_acronym}-arcgis-${var.environment_acronym}")
  location            = azurerm_resource_group.cospivnetrg.location
  resource_group_name = azurerm_resource_group.cospivnetrg.name
  subnet_id           = data.azurerm_subnet.arcgis_pep_subnet.id
  private_service_connection {
    name                           = lower("pesc-${var.location_acronym}-${var.application_acronym}-arcgis-${var.environment_acronym}")
    private_connection_resource_id = module.spifishfileshare.id
    subresource_names              = ["file"]#"blob","file","queue","table","web"
    is_manual_connection           = false
  }
  tags               = var.tags
}