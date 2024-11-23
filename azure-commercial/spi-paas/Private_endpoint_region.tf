resource "azurerm_private_endpoint" "sql_endpoint_prod" {
for_each                           = var.sql_server_prod
  name                = lower("pe-sql-${each.value.location_acronym}-${var.application_acronym}-${each.value.region}-prod-${var.environment_acronym}")
  resource_group_name          =  module.applicationrg[each.key].resource_group_name
  location                     =  module.applicationrg[each.key].resource_group_location
  subnet_id           = azurerm_subnet.spipaasdb_subnet[each.key].id
  private_service_connection {
    name                           = lower("pe-sql-${each.value.location_acronym}-${var.application_acronym}-${each.value.region}-prod-${var.environment_acronym}")
    private_connection_resource_id = module.sqlserverprod[each.key].sql_server_id
    subresource_names              = ["sqlServer"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
           name                 = lower("pe-sql-${each.value.location_acronym}-${var.application_acronym}-${each.value.region}-prod-${var.environment_acronym}")
           private_dns_zone_ids = [
                "/subscriptions/${var.pvt_dns_subscription_id}/resourceGroups/${var.pvt_dns_resource_group}/providers/Microsoft.Network/privateDnsZones/privatelink.database.windows.net",
             ] 
         }

  tags = var.tags
}

resource "azurerm_private_endpoint" "sql_endpoint_stage" {
 for_each                           = var.sql_server_stage
  name                = lower("pe-sql-${each.value.location_acronym}-${var.application_acronym}-${each.value.region}-stg-${var.environment_acronym}")
   resource_group_name          =  module.applicationrg[each.key].resource_group_name
  location                     =  module.applicationrg[each.key].resource_group_location
  subnet_id           = azurerm_subnet.spipaasdb_subnet[each.key].id
  private_service_connection {
    name                           = lower("pe-sql-${each.value.location_acronym}-${var.application_acronym}-${each.value.region}-stg-${var.environment_acronym}")
    private_connection_resource_id = module.sqlserverstage[each.key].sql_server_id
    subresource_names              = ["sqlServer"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
           name                 = lower("pe-sql-${each.value.location_acronym}-${var.application_acronym}-${each.value.region}-stg-${var.environment_acronym}")
           private_dns_zone_ids = [
                "/subscriptions/${var.pvt_dns_subscription_id}/resourceGroups/${var.pvt_dns_resource_group}/providers/Microsoft.Network/privateDnsZones/privatelink.database.windows.net",
             ] 
         }

  tags = var.tags
}
resource "azurerm_private_endpoint" "sql_endpoint_app" {
    for_each                           = var.sql_server_app
  name                = lower("pe-sql-${each.value.location_acronym}-${var.application_acronym}-${each.value.region}-app-${var.environment_acronym}")
   resource_group_name          =  module.applicationrg[each.key].resource_group_name
  location                     =  module.applicationrg[each.key].resource_group_location
  subnet_id           = azurerm_subnet.spipaasdb_subnet[each.key].id
  private_service_connection {
    name                           = lower("pe-sql-${each.value.location_acronym}-${var.application_acronym}-${each.value.region}-app-${var.environment_acronym}")
    private_connection_resource_id = module.sqlserverapp[each.key].sql_server_id
    subresource_names              = ["sqlServer"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
           name                 = lower("pe-sql-${each.value.location_acronym}-${var.application_acronym}-${each.value.region}-app-${var.environment_acronym}")
           private_dns_zone_ids = [
                "/subscriptions/${var.pvt_dns_subscription_id}/resourceGroups/${var.pvt_dns_resource_group}/providers/Microsoft.Network/privateDnsZones/privatelink.database.windows.net",
             ] 
         }

  tags = var.tags
}

resource "azurerm_private_endpoint" "repgenrest_endpoint" {
for_each = var.appservice_plan
  name                = lower("pe-web-${each.value.location_acronym}-${var.application_acronym}-repgenrest-${each.value.region}-${var.environment_acronym}")
   resource_group_name          =  module.applicationrg[each.key].resource_group_name
  location                     =  module.applicationrg[each.key].resource_group_location
  subnet_id           = azurerm_subnet.spipaasappsrv_subnet[each.key].id
  private_service_connection {
    name                           = lower("pe-web-${each.value.location_acronym}-${var.application_acronym}-repgenrest-${each.value.region}-${var.environment_acronym}")
    private_connection_resource_id = azurerm_app_service.appservice_spipaasrepgenrest[each.key].id
    subresource_names              = ["sites"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
           name                 = lower("pe-web-${each.value.location_acronym}-${var.application_acronym}-repgenrest-${each.value.region}-${var.environment_acronym}")
           private_dns_zone_ids = [
                "/subscriptions/${var.pvt_dns_subscription_id}/resourceGroups/${var.pvt_dns_resource_group}/providers/Microsoft.Network/privateDnsZones/privatelink.azurewebsites.net",
             ] 
         }
  tags = var.tags
}

resource "azurerm_private_endpoint" "kvl_endpoint" {
     for_each = var.key_vault
  name                = lower("pe-kvl-${each.value.location_acronym}-${var.application_acronym}-${each.value.region}-${var.environment_acronym}")
   resource_group_name          =  module.applicationrg[each.key].resource_group_name
  location                     =  module.applicationrg[each.key].resource_group_location
  subnet_id           = azurerm_subnet.spipaaspep_subnet[each.key].id
  private_service_connection {
    name                           = lower("pe-kvl-${each.value.location_acronym}-${var.application_acronym}-${each.value.region}-${var.environment_acronym}")
    private_connection_resource_id = azurerm_key_vault.app_keyvault[each.key].id
    subresource_names              = ["vault"]
    is_manual_connection           = false
  }
   private_dns_zone_group {
           name                 = lower("pe-kvl-${each.value.location_acronym}-${var.application_acronym}-${each.value.region}-${var.environment_acronym}")
           private_dns_zone_ids = [
                "/subscriptions/${var.pvt_dns_subscription_id}/resourceGroups/${var.pvt_dns_resource_group}/providers/Microsoft.Network/privateDnsZones/privatelink.vaultcore.azure.net",
             ] 
         }

  tags = var.tags
}
resource "azurerm_private_endpoint" "funapp_storage_endpoint" {
  for_each = var.storage_account_functionapp
  name                = lower("pe-sto-${each.value.location_acronym}-${var.application_acronym}-funappstr-${each.value.region}-${var.environment_acronym}")
   resource_group_name          =  module.applicationrg[each.key].resource_group_name
  location                     =  module.applicationrg[each.key].resource_group_location
  subnet_id           = azurerm_subnet.spipaaspep_subnet[each.key].id
  private_service_connection {
    name                           = lower("pe-sto-${each.value.location_acronym}-${var.application_acronym}-funappstr-${each.value.region}-${var.environment_acronym}")
    private_connection_resource_id = module.spipaasfunctionappsa[each.key].id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
           name                 = lower("pe-sto-${each.value.location_acronym}-${var.application_acronym}-funappstr-${each.value.region}-${var.environment_acronym}")
           private_dns_zone_ids = [
                "/subscriptions/${var.pvt_dns_subscription_id}/resourceGroups/${var.pvt_dns_resource_group}/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net",
             ] 
         }
      depends_on = [ module.spipaasfunctionappsa ]
  tags = var.tags
}


resource "azurerm_private_endpoint" "data_storage01_endpoint" {
  for_each = var.storage_account_data
  name                = lower("pe-sto-${each.value.location_acronym}-${var.application_acronym}-appdata01-${each.value.region}-${var.environment_acronym}")
  resource_group_name          =  module.applicationrg[each.key].resource_group_name
  location                     =  module.applicationrg[each.key].resource_group_location
  subnet_id                    = azurerm_subnet.spipaaspep_subnet[each.key].id
  private_service_connection {
    name                           = lower("pe-sto-${each.value.location_acronym}-${var.application_acronym}-appdata01-${each.value.region}-${var.environment_acronym}")
    private_connection_resource_id = module.spipaasappdata01sa[each.key].id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
           name                 = lower("pe-sto-${each.value.location_acronym}-${var.application_acronym}-appdata01-${each.value.region}-${var.environment_acronym}")
           private_dns_zone_ids = [
                "/subscriptions/${var.pvt_dns_subscription_id}/resourceGroups/${var.pvt_dns_resource_group}/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net",
             ] 
         }
  tags = var.tags
  depends_on = [ module.spipaasappdata01sa ]
}