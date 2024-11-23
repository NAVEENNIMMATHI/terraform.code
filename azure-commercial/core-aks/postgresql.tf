locals {
  aks_resource_group = azurerm_resource_group.aks[0].name # indexing since resource group is created with count
}

resource "azurerm_postgresql_server" "pgs-aks-core" {
  count = 1
  name                = "pgs-${var.location_acronym}-${var.application_acronym}-aks-${var.environment_acronym}"
  resource_group_name = azurerm_resource_group.aks[0].name # indexing since resource group is created with count
  location            = azurerm_resource_group.aks[0].location
  tags = var.tags_Artifactory

  administrator_login          = "kpmgadmin"
  administrator_login_password = var.sql_administrator_password

  sku_name   = var.aks_pgs_sku
  version    = var.aks_pgs_version
  storage_mb = var.aks_pgs_storage

  backup_retention_days        = 7
  geo_redundant_backup_enabled = true
  auto_grow_enabled            = true

  public_network_access_enabled    = false
  ssl_enforcement_enabled          = true
  ssl_minimal_tls_version_enforced = "TLS1_2"

  threat_detection_policy {
    enabled = true
  }
}

resource "azurerm_private_endpoint" "pgs-aks-core" {
  count = 1
  name                = "pe-${var.location_acronym}-${var.application_acronym}-aks-${var.environment_acronym}"
  location            = azurerm_resource_group.aks[0].location
  resource_group_name = azurerm_resource_group.aks[0].name # indexing since resource group is created with count
  subnet_id           = azurerm_subnet.aks[0].id # indexing since subnet is created with count
  tags = var.tags

  private_service_connection {
    name                           = "psc-${var.location_acronym}-${var.application_acronym}-aks-${var.environment_acronym}"
    private_connection_resource_id = azurerm_postgresql_server.pgs-aks-core[0].id
    subresource_names              = [ "postgresqlServer" ]
    is_manual_connection           = false
  }
}

resource "azurerm_monitor_diagnostic_setting" "pgs-aks-core" {
  count = 1
  name               = "pgs-${var.location_acronym}-${var.application_acronym}-aks-${var.environment_acronym}-diag"
  target_resource_id = azurerm_postgresql_server.pgs-aks-core[0].id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.corelogs.id

  log {
    category = "PostgreSQLLogs"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

    log {
    category = "QueryStoreRuntimeStatistics"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

    log {
    category = "QueryStoreWaitStatistics"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = false
    }
  }
}

##### Manually Creating ADDS Entry Temporarily #####

#resource "azurerm_private_dns_zone" "pgs-aks-core" {
#  count = var.environment_acronym == "pd" ? 0 : 1
#  name                = "privatelink.postgres.database.azure.com"
#  resource_group_name = azurerm_resource_group.aks[0].name # indexing since resource group is created with count
#}

# We need to link the cluster's DNS Zone to the DNS server's Vnet since we use custom DNS servers on our Vnet
# See: https://docs.microsoft.com/en-us/azure/aks/private-clusters
#resource "null_resource" "pgs-dns-zone-link" {
#  count = var.environment_acronym == "pd" ? 0 : 1
#
#  provisioner "local-exec" {
#    interpreter = ["PowerShell", "-Command"]
#    command     = "PowerShell -file dns_zone_link.ps1 -DNS_VNET ${var.dns_vnet} -NODE_RGP ${local.aks_resource_group}"
#  }
#}

#resource "azurerm_private_dns_a_record" "pgs-dns-a-record" {
#  depends_on = ["azurerm_private_dns_zone.pgs-aks-core"]
#  count = var.environment_acronym == "pd" ? 0 : 1
#  name                = "pgs-${var.location_acronym}-${var.application_acronym}-aks-${var.environment_acronym}"
#  zone_name           = "privatelink.postgres.database.azure.com"
#  resource_group_name = azurerm_resource_group.aks[0].name # indexing since resource group is created with count
#  ttl                 = 300
#  records             = ["${azurerm_private_endpoint.pgs-aks-core[0].private_service_connection[0].private_ip_address}"]
#}

resource "azurerm_postgresql_database" "artifactorydb" {
  count = 1
  name                = "artifactorydb"
  resource_group_name = azurerm_resource_group.aks[0].name # indexing since resource group is created with count
  server_name         = "pgs-${var.location_acronym}-${var.application_acronym}-aks-${var.environment_acronym}"
  charset             = "UTF8"
  collation           = "English_United States.1252"
}

resource "azurerm_postgresql_database" "xraydb" {
  count = 1
  name                = "xraydb"
  resource_group_name = azurerm_resource_group.aks[0].name # indexing since resource group is created with count
  server_name         = "pgs-${var.location_acronym}-${var.application_acronym}-aks-${var.environment_acronym}"
  charset             = "UTF8"
  collation           = "English_United States.1252"
}

resource "azurerm_postgresql_database" "missioncontroldb" {
  count = 1
  name                = "missioncontroldb"
  resource_group_name = azurerm_resource_group.aks[0].name # indexing since resource group is created with count
  server_name         = "pgs-${var.location_acronym}-${var.application_acronym}-aks-${var.environment_acronym}"
  charset             = "UTF8"
  collation           = "English_United States.1252"
}