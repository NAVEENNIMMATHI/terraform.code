#Private Endpoint for Arcgis KeyVault
resource "azurerm_private_endpoint" "kvl_endpoint" {
  name                = "pep-${lower(var.location_acronym)}-${var.application_acronym}-kvl-${lower(var.environment_acronym)}"
  resource_group_name = module.geospatial_rg.resource_group_name
  location            = module.geospatial_rg.resource_group_location
  subnet_id           = module.geospatial_pep_subnet.subnet_id

  private_service_connection {
    name                           = "pep-${lower(var.location_acronym)}-${var.application_acronym}-kvl-${lower(var.environment_acronym)}"
    private_connection_resource_id = azurerm_key_vault.geospatial_key_vault.id
    subresource_names              = ["vault"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = data.azurerm_private_dns_zone.dns_zone_keyvault.name
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_keyvault.id]
  }


  tags = var.tags
}

# Private End Point for Arcgis ACR
resource "azurerm_private_endpoint" "pep_arcgis_acr" {
  name                = "pep-${lower(var.location_acronym)}-${var.application_acronym}-acr-${lower(var.environment_acronym)}"
  resource_group_name = module.geospatial_rg.resource_group_name
  location            = module.geospatial_rg.resource_group_location
  subnet_id           = module.geospatial_pep_subnet.subnet_id

  private_service_connection {
    name                           = "pesc-acr-${lower(var.location_acronym)}-${var.application_acronym}-${lower(var.environment_acronym)}"
    private_connection_resource_id = azurerm_container_registry.arcgis_acr.id
    subresource_names              = ["registry"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = "dns_zone_containerregistry"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_acr.id]
  }

  tags = var.tags

  depends_on = [ azurerm_container_registry.arcgis_acr ]
}

/*
# Private Endpoint for database
resource "azurerm_private_endpoint" "private_endpoint_geo_mysql" {
  name                = "pep-${lower(var.location_acronym)}-${var.application_acronym}-sql-${lower(var.environment_acronym)}"
 resource_group_name  = module.geospatial_rg.resource_group_name
  location            = module.geospatial_rg.resource_group_location
  subnet_id           = module.geospatial_pep_subnet.subnet_id


  private_service_connection {
    name                           = "ams-${var.location_acronym}-${var.application_acronym}-sql-${var.environment_acronym}"
    private_connection_resource_id = azurerm_mssql_server.geospatial_mssql_server.id

    is_manual_connection           = false
    subresource_names              = ["sqlServer"]
  }

  private_dns_zone_group {
    name                 = data.azurerm_private_dns_zone.dns_zone_database.name
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_database.id]
  }

  tags = var.tags
}
*/

#Private Endpoint for Arcgis NFS Storage Account
resource "azurerm_private_endpoint" "nfs_endpoint" {
  name                = "pep-${lower(var.location_acronym)}-${var.application_acronym}-nfs-${lower(var.environment_acronym)}"
  resource_group_name = module.geospatial_rg.resource_group_name
  location            = module.geospatial_rg.resource_group_location
  subnet_id           = module.geospatial_pep_subnet.subnet_id

  private_service_connection {
    name                           = "pep-${lower(var.location_acronym)}-${var.application_acronym}-nfs-${lower(var.environment_acronym)}"
    private_connection_resource_id = module.vmdiagnosticslogs.id
    subresource_names              = ["file"]
    is_manual_connection           = false
  }

    private_dns_zone_group {
    name                 = data.azurerm_private_dns_zone.dns_zone_storage_file.name
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_storage_file.id]
  }
  tags = var.tags
}

/*
# Private Endpoint for Postgre
resource "azurerm_private_endpoint" "private_endpoint_gis_pstgresql" {
  name                = "pep-${lower(var.location_acronym)}-${var.application_acronym}-pstgre-${lower(var.environment_acronym)}"
 resource_group_name  = module.geospatial_rg.resource_group_name
  location            = module.geospatial_rg.resource_group_location
  subnet_id           = module.geospatial_pep_subnet.subnet_id


  private_service_connection {
    name                           = "psc-${var.location_acronym}-${var.application_acronym}-pstgre-${var.environment_acronym}"
    private_connection_resource_id = azurerm_postgresql_server.gis_Postgresql_server.id
    is_manual_connection           = false
    subresource_names              = ["postgresqlServer"]
  }

  private_dns_zone_group {
    name                 = "dns_zone_postgresql"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_postgresql.id]
  }

  tags = var.tags
}
*/
