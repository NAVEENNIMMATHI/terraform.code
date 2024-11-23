resource "azurerm_private_endpoint" "sql_endpoint_central" {
  name                = lower("pe-sql-${var.location_acronym}-${var.application_acronym}-${var.application_region}-${var.environment_acronym}")
  location            = module.applicationrg_central.resource_group_location
  resource_group_name = module.applicationrg_central.resource_group_name
  subnet_id           = azurerm_subnet.spipaasdb_subnet_central.id
  private_service_connection {
    name                           = lower("pe-sql-${var.location_acronym}-${var.application_acronym}-${var.application_region}-${var.environment_acronym}")
    private_connection_resource_id = module.sqlserver01_central.sql_server_id
    subresource_names              = ["sqlServer"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
           name                 = lower("pe-sql-${var.location_acronym}-${var.application_acronym}-${var.application_region}-${var.environment_acronym}")
           private_dns_zone_ids = [
                "/subscriptions/${var.pvt_dns_subscription_id}/resourceGroups/${var.pvt_dns_resource_group}/providers/Microsoft.Network/privateDnsZones/privatelink.database.windows.net",
             ] 
         }

  tags = var.tags
}

resource "azurerm_private_endpoint" "web_endpoint_central1" {
  name                = lower("pe-web-${var.location_acronym}-${var.application_acronym}-${var.application_region}-${var.environment_acronym}")
  location            = module.applicationrg_central.resource_group_location
  resource_group_name = module.applicationrg_central.resource_group_name
  subnet_id           = azurerm_subnet.spipaasappsrv_subnet_central.id
  private_service_connection {
    name                           = lower("pe-web-${var.location_acronym}-${var.application_acronym}-${var.application_region}-${var.environment_acronym}")
    private_connection_resource_id = azurerm_app_service.appservice_spipaas_central.id
    subresource_names              = ["sites"]
    is_manual_connection           = false
  }
   private_dns_zone_group {
           name                 = lower("pe-web-${var.location_acronym}-${var.application_acronym}-${var.application_region}-${var.environment_acronym}")
           private_dns_zone_ids = [
                "/subscriptions/${var.pvt_dns_subscription_id}/resourceGroups/${var.pvt_dns_resource_group}/providers/Microsoft.Network/privateDnsZones/privatelink.azurewebsites.net",
             ] 
         }

  tags = var.tags
}

resource "azurerm_private_endpoint" "restapp_endpoint_central1" {
  name                = lower("pe-web-${var.location_acronym}-${var.application_acronym}-rest-${var.application_region}-${var.environment_acronym}")
  location            = module.applicationrg_central.resource_group_location
  resource_group_name = module.applicationrg_central.resource_group_name
  subnet_id           = azurerm_subnet.spipaasappsrv_subnet_central.id
  private_service_connection {
    name                           = lower("pe-web-${var.location_acronym}-${var.application_acronym}-rest-${var.application_region}-${var.environment_acronym}")
    private_connection_resource_id = azurerm_app_service.appservice_spipaasrest_central.id
    subresource_names              = ["sites"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
           name                 = lower("pe-web-${var.location_acronym}-${var.application_acronym}-rest-${var.application_region}-${var.environment_acronym}")
           private_dns_zone_ids = [
                "/subscriptions/${var.pvt_dns_subscription_id}/resourceGroups/${var.pvt_dns_resource_group}/providers/Microsoft.Network/privateDnsZones/privatelink.azurewebsites.net",
             ] 
         }
  tags = var.tags
}

resource "azurerm_private_endpoint" "kvl_endpoint_central1" {
  name                = lower("pe-kvl-${var.location_acronym}-${var.application_acronym}-${var.application_region}-${var.environment_acronym}")
  location            = module.applicationrg_central.resource_group_location
  resource_group_name = module.applicationrg_central.resource_group_name
  subnet_id           = azurerm_subnet.private_endpoint_ctr.id
  private_service_connection {
    name                           = lower("pe-kvl-${var.location_acronym}-${var.application_acronym}-${var.application_region}-${var.environment_acronym}")
    private_connection_resource_id = azurerm_key_vault.app_key_vault_central.id
    subresource_names              = ["vault"]
    is_manual_connection           = false
  }
   private_dns_zone_group {
           name                 = lower("pe-kvl-${var.location_acronym}-${var.application_acronym}-${var.application_region}-${var.environment_acronym}")
           private_dns_zone_ids = [
                "/subscriptions/${var.pvt_dns_subscription_id}/resourceGroups/${var.pvt_dns_resource_group}/providers/Microsoft.Network/privateDnsZones/privatelink.vaultcore.azure.net",
             ] 
         }


  tags = var.tags
}
resource "azurerm_private_endpoint" "dtf_endpoint_central1" {
  name                = lower("pe-dtf-${var.location_acronym}-${var.application_acronym}-${var.application_region}-${var.environment_acronym}")
  location            = module.applicationrg_central.resource_group_location
  resource_group_name = module.applicationrg_central.resource_group_name
  subnet_id           = azurerm_subnet.spipaasadf_subnet_central.id
  private_service_connection {
    name                           = lower("pe-dtf-${var.location_acronym}-${var.application_acronym}-${var.application_region}-${var.environment_acronym}")
    private_connection_resource_id = azurerm_data_factory.spipaasadf_central.id
    subresource_names              = ["datafactory"]
    is_manual_connection           = false
  }
   private_dns_zone_group {
           name                 = lower("pe-dtf-${var.location_acronym}-${var.application_acronym}-${var.application_region}-${var.environment_acronym}")
           private_dns_zone_ids = [
                "/subscriptions/${var.pvt_dns_subscription_id}/resourceGroups/${var.pvt_dns_resource_group}/providers/Microsoft.Network/privateDnsZones/privatelink.adf.azure.com",
             ] 
         }


  tags = var.tags
}
resource "azurerm_private_endpoint" "data_storage01_endpoint_central" {
  name                = lower("pe-sto-${var.location_acronym}-${var.application_acronym}-appdata01-${var.application_region1}-${var.environment_acronym}")
  location            = module.applicationrg_central.resource_group_location
  resource_group_name = module.applicationrg_central.resource_group_name
  subnet_id           = azurerm_subnet.private_endpoint_ctr.id
  private_service_connection {
    name                           = lower("pe-sto-${var.location_acronym}-${var.application_acronym}-appdata01-${var.application_region1}-${var.environment_acronym}")
    private_connection_resource_id = module.spipaascentralappdata01sa.id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
           name                 = lower("pe-sto-${var.location_acronym}-${var.application_acronym}-appdata01-${var.application_region1}-${var.environment_acronym}")
           private_dns_zone_ids = [
                "/subscriptions/${var.pvt_dns_subscription_id}/resourceGroups/${var.pvt_dns_resource_group}/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net",
             ] 
         }
  tags = var.tags
}
resource "azurerm_private_endpoint" "data_storage02_endpoint_central" {
  name                = lower("pe-sto-${var.location_acronym}-${var.application_acronym}-appdata02-${var.application_region1}-${var.environment_acronym}")
  location            = module.applicationrg_central.resource_group_location
  resource_group_name = module.applicationrg_central.resource_group_name
  subnet_id           = azurerm_subnet.private_endpoint_ctr.id
  private_service_connection {
    name                           = lower("pe-sto-${var.location_acronym}-${var.application_acronym}-appdata02-${var.application_region1}-${var.environment_acronym}")
    private_connection_resource_id = module.spipaascentralappdata02sa.id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
           name                 = lower("pe-sto-${var.location_acronym}-${var.application_acronym}-appdata02-${var.application_region1}-${var.environment_acronym}")
           private_dns_zone_ids = [
                "/subscriptions/${var.pvt_dns_subscription_id}/resourceGroups/${var.pvt_dns_resource_group}/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net",
             ] 
         }
  tags = var.tags
}