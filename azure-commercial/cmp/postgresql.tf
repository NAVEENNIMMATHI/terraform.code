resource "azurerm_postgresql_server" "aps-cmp-server" {
  for_each            = var.cmp_clients

  name                = "aps-${var.location_acronym}-${var.application_acronym}-${each.key}-${var.environment_acronym}"
  resource_group_name = module.cmp_rg_client[each.key].resource_group_name
  location            = var.location
  tags                = var.tags

  administrator_login          = "kpmgadmin"
  administrator_login_password = var.sql_admin_password

  sku_name   = var.cmp_aps_sku
  version    = var.cmp_aps_version
  storage_mb = var.cmp_aps_storage

  backup_retention_days        = 30
  geo_redundant_backup_enabled = true
  auto_grow_enabled            = true

  public_network_access_enabled    = false
  ssl_enforcement_enabled          = true
  ssl_minimal_tls_version_enforced = "TLS1_2"
}

resource "azurerm_monitor_diagnostic_setting" "cmp_aps_logging" {
  for_each            = var.cmp_clients
  
  name                       = "aps-Logs"
  target_resource_id         = azurerm_postgresql_server.aps-cmp-server[each.key].id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.spoke_law.id

  log {
    category = "QueryStoreRuntimeStatistics"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  log {
    category = "QueryStoreWaitStatistics"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = true
    }
  }

  
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
      days    = 0
      enabled = false
    }
  }
}

resource "azurerm_postgresql_active_directory_administrator" "ad_group_sql_admin" {
  for_each = var.cmp_clients

  server_name         = azurerm_postgresql_server.aps-cmp-server[each.key].name
  resource_group_name = module.cmp_rg_client[each.key].resource_group_name
  login               = azuread_group.cmp_data_base_access[each.key].display_name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  object_id           = data.azurerm_client_config.current.object_id
}