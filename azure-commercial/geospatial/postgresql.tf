##Postgre Flexible

resource "azurerm_postgresql_flexible_server" "postgresql_flexible" {
  name                   = "pgs-${var.location_acronym}-${var.application_acronym}-flex-${var.environment_acronym}"
  resource_group_name    = module.geospatial_rg.resource_group_name
  location               = module.geospatial_rg.resource_group_location
  version                = var.gis_postgresql_PostGresVersion
  delegated_subnet_id    = module.geospatial_postgre_flexible_subnet.subnet_id
  private_dns_zone_id    = data.azurerm_private_dns_zone.dns_zone_postgresql.id
  administrator_login    = var.gis_postgresql_adminname
  administrator_password = var.gis_postgrefs_adminpassword
  zone                   = "1"
  storage_mb             = var.gis_postgresql_storage_mb
  sku_name               = var.gis_postgresql_sku_name
  depends_on             = [azurerm_private_dns_zone_virtual_network_link.gis_to_core_vnet]
  tags                   = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "gis_to_core_vnet" {
  name                  = "vnet-${var.location_acronym}-${var.application_acronym}-link-${var.environment_acronym}"
  provider              = azurerm.dns
  resource_group_name   = var.private_dns_zone_resource_group_name
  private_dns_zone_name = var.private_dns_zone_name_psql
  virtual_network_id    = module.geospatial_vnet_main.virtual_network_id
  tags                  = var.tags
}

 resource "azurerm_monitor_diagnostic_setting" "az_pstfs_diag" {
  name                       = "pstfs-${var.location_acronym}-${var.application_acronym}-diag-${var.environment_acronym}"
  target_resource_id         = azurerm_postgresql_flexible_server.postgresql_flexible.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.spoke_law.id

  log {
    category = "PostgreSQLLogs"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }
  
  metric {
    category = "AllMetrics"
    enabled  = true

    retention_policy {
      days    = 7
      enabled = true
    }
  }
}
