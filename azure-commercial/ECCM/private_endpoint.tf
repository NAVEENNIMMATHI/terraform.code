#Private Endpoint for Logic App
resource "azurerm_private_endpoint" "logic_app_endpoint" {
  name                = "pep-${var.location_acronym}-${var.application_acronym}-lap-${var.environment_acronym}"
  location            = module.eccm_rg.resource_group_location
  resource_group_name = module.eccm_rg.resource_group_name
  subnet_id           = module.eccm_pep_subnet.subnet_id
  private_service_connection {
    name                           = "pep-${var.location_acronym}-${var.application_acronym}-lap-${var.environment_acronym}"
    private_connection_resource_id = azurerm_logic_app_standard.eccm_logic_app.id
    subresource_names              = ["sites"] 
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = data.azurerm_private_dns_zone.dns_zone_logic_app.name
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_logic_app.id]
  }

  tags = var.tags
}

#Private Endpoint for Storage Account Blob
resource "azurerm_private_endpoint" "storage_blob_endpoint" {
  name                = "pep-${var.location_acronym}-${var.application_acronym}-blob-${var.environment_acronym}"
  location            = module.eccm_rg.resource_group_location
  resource_group_name = module.eccm_rg.resource_group_name
  subnet_id           = module.eccm_pep_subnet.subnet_id
  private_service_connection {
    name                           = "pep-${var.location_acronym}-${var.application_acronym}-blob-${var.environment_acronym}"
    private_connection_resource_id = azurerm_storage_account.eccm_cstr.id
    subresource_names              = ["blob"] 
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = data.azurerm_private_dns_zone.dns_zone_storage_blob.name
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_storage_blob.id]
  }

  tags = var.tags
}


# #Private Endpoint for Storage Account Table
# resource "azurerm_private_endpoint" "storage_table_endpoint" {
#   name                = "pep-${var.location_acronym}-${var.application_acronym}-table-${var.environment_acronym}"
#   location            = module.eccm_rg.resource_group_location
#   resource_group_name = module.eccm_rg.resource_group_name
#   subnet_id           = module.eccm_pep_subnet.subnet_id
#   private_service_connection {
#     name                           = "pep-${var.location_acronym}-${var.application_acronym}-table-${var.environment_acronym}"
#     private_connection_resource_id = azurerm_storage_account.eccm_cstr.id
#     subresource_names              = ["table"] 
#     is_manual_connection           = false
#   }
#   private_dns_zone_group {
#     name                 = data.azurerm_private_dns_zone.dns_zone_storage_table.name
#     private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_storage_table.id]
#   }

#   tags = var.tags
# }

# #Private Endpoint for Storage Account Queue
# resource "azurerm_private_endpoint" "storage_queue_endpoint" {
#   name                = "pep-${var.location_acronym}-${var.application_acronym}-queue-${var.environment_acronym}"
#   location            = module.eccm_rg.resource_group_location
#   resource_group_name = module.eccm_rg.resource_group_name
#   subnet_id           = module.eccm_pep_subnet.subnet_id
#   private_service_connection {
#     name                           = "pep-${var.location_acronym}-${var.application_acronym}-queue-${var.environment_acronym}"
#     private_connection_resource_id = azurerm_storage_account.eccm_cstr.id
#     subresource_names              = ["table"] 
#     is_manual_connection           = false
#   }
#   private_dns_zone_group {
#     name                 = data.azurerm_private_dns_zone.dns_zone_storage_queue.name
#     private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_storage_queue.id]
#   }

#   tags = var.tags
# }

#Private Endpoint for Logic app Storage Account
resource "azurerm_private_endpoint" "logic_app_storage_endpoint" {
  name                = "pep-${var.location_acronym}-${var.application_acronym}-stoweb-${var.environment_acronym}"
  location            = module.eccm_rg.resource_group_location
  resource_group_name = module.eccm_rg.resource_group_name
  subnet_id           = module.eccm_pep_subnet.subnet_id
  private_service_connection {
    name                           = "pep-${var.location_acronym}-${var.application_acronym}-stoweb-${var.environment_acronym}"
    private_connection_resource_id = azurerm_storage_account.eccm_app.id
    subresource_names              = ["web"] 
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = data.azurerm_private_dns_zone.dns_zone_storage_blob.name
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_storage_blob.id]
  }

  tags = var.tags
}

#Private Endpoint for KeyVault
resource "azurerm_private_endpoint" "kvl_endpoint" {
  name                = "pep-${var.location_acronym}-${var.application_acronym}-kvl-${var.environment_acronym}"
  location            = module.eccm_rg.resource_group_location
  resource_group_name = module.eccm_rg.resource_group_name
  subnet_id           = module.eccm_pep_subnet.subnet_id
  private_service_connection {
    name                           = "pep-${var.location_acronym}-${var.application_acronym}-kvl-${var.environment_acronym}"
    private_connection_resource_id = azurerm_key_vault.eccm_key_vault.id
    subresource_names              = ["vault"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = data.azurerm_private_dns_zone.dns_zone_keyvault.name
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_keyvault.id]
  }

  tags = var.tags
}

#Private Endpoint for SQL Server
resource "azurerm_private_endpoint" "sql_endpoint" {
  name                = "pep-${var.location_acronym}-${var.application_acronym}-sql-${var.environment_acronym}"
  location            = module.eccm_rg.resource_group_location
  resource_group_name = module.eccm_rg.resource_group_name
  subnet_id           = module.eccm_pep_subnet.subnet_id
  private_service_connection {
    name                           = "pep-${var.location_acronym}-${var.application_acronym}-sql-${var.environment_acronym}"
    private_connection_resource_id = azurerm_mssql_server.eccm_sqlserver.id
    subresource_names              = ["sqlServer"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = data.azurerm_private_dns_zone.dns_zone_sql.name
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_sql.id]
  }

  tags = var.tags
}



#Private Endpoint for ACR
resource "azurerm_private_endpoint" "acr_endpoint" {
  name                = "pep-${var.location_acronym}-${var.application_acronym}-cr-${var.environment_acronym}"
  location            = module.eccm_rg.resource_group_location
  resource_group_name = module.eccm_rg.resource_group_name
  subnet_id           = module.eccm_pep_subnet.subnet_id
  private_service_connection {
    name                           = "pep-${var.location_acronym}-${var.application_acronym}-cr-${var.environment_acronym}"
    private_connection_resource_id = azurerm_container_registry.eccmacr.id
    subresource_names              = ["registry"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = data.azurerm_private_dns_zone.dns_zone_acr.name
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_acr.id]
  }

  tags = var.tags
}

#Private Endpoint for Web App
resource "azurerm_private_endpoint" "web_app_endpoint" {
  name                = "pep-${var.location_acronym}-${var.application_acronym}-web-${var.environment_acronym}"
  location            = module.eccm_rg.resource_group_location
  resource_group_name = module.eccm_rg.resource_group_name
  subnet_id           = module.eccm_pep_subnet.subnet_id
  private_service_connection {
    name                           = "pep-${var.location_acronym}-${var.application_acronym}-web-${var.environment_acronym}"
    private_connection_resource_id = azurerm_app_service.eccm_web_app.id
    subresource_names              = ["sites"] 
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = "dns_zone_web_app_${var.application_acronym}"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_logic_app.id]
  }

  tags = var.tags
}

#Private Endpoint for function App
resource "azurerm_private_endpoint" "fun_app_endpoint" {
  name                = "pep-${var.location_acronym}-${var.application_acronym}-fun-${var.environment_acronym}"
  location            = module.eccm_rg.resource_group_location
  resource_group_name = module.eccm_rg.resource_group_name
  subnet_id           = module.eccm_pep_subnet.subnet_id
  private_service_connection {
    name                           = "pep-${var.location_acronym}-${var.application_acronym}-fun-${var.environment_acronym}"
    private_connection_resource_id = azurerm_function_app.eccm_fun_app.id
    subresource_names              = ["sites"] 
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = "dns_zone_fun_app_${var.application_acronym}"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_logic_app.id]
  }

  tags = var.tags
}