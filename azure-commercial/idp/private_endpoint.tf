#Private Endpoint for Storage Account
resource "azurerm_private_endpoint" "storage_endpoint" {
  name                = lower("pep-${var.location_acronym}-${var.application_acronym}-sablob-${var.environment_acronym}")
  location            = module.idp_resource_group.resource_group_location
  resource_group_name = module.idp_resource_group.resource_group_name
  subnet_id           = azurerm_subnet.subnet["pe"].id
  private_service_connection {
    name                           = lower("pe-sto-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}")
    private_connection_resource_id = module.storage_account.id
    subresource_names              = ["blob"] #"blob","file","queue","table","web"
    is_manual_connection           = false
  }
  tags = var.tags
}

#Private Endpoint for KeyVault
resource "azurerm_private_endpoint" "kvl_endpoint" {
  name                = lower("pep-${var.location_acronym}-${var.application_acronym}-kvl-${var.environment_acronym}")
  location            = module.idp_resource_group.resource_group_location
  resource_group_name = module.idp_resource_group.resource_group_name
  subnet_id           = azurerm_subnet.subnet["pe"].id
  private_service_connection {
    name                           = lower("pe-kvl-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}")
    private_connection_resource_id = azurerm_key_vault.idp_key_vault.id
    subresource_names              = ["vault"]
    is_manual_connection           = false
  }
  tags = var.tags
}

#Private Endpoint for SQL Server
resource "azurerm_private_endpoint" "sql_endpoint" {
  name                = lower("pe-sql-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}")
  location            = module.idp_resource_group.resource_group_location
  resource_group_name = module.idp_resource_group.resource_group_name
  subnet_id           = azurerm_subnet.subnet["pe"].id
  private_service_connection {
    name                           = lower("pe-sql-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}")
    private_connection_resource_id = module.sqlserver.sql_server_id
    subresource_names              = ["sqlServer"]
    is_manual_connection           = false
  }
  tags = var.tags
}