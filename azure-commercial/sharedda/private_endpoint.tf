resource "azurerm_private_endpoint" "private_endpoint" {
  name                = "pe-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location
  subnet_id           = module.private_endpoint.subnet_id
  private_service_connection {
    name                           = "pesc-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
    private_connection_resource_id = azurerm_storage_account.smbfileshare.id
    subresource_names              = ["file"]#"blob","file","queue","table","web"
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                           = "dns_zone_file"
    private_dns_zone_ids           = [data.azurerm_private_dns_zone.dns_zone_file.id]
  }
  tags               = var.tags
}