resource "azurerm_postgresql_server" "rstudio_Postgresql_server" {
  name                = var.environment == "production" ? "${var.cloudops_global_prefix}spi-${var.environment_acronym}-${var.application_acronym}-postgresqldb01" : "pgs-${var.location_acronym}-${var.application_acronym}-spi-${var.environment_acronym}"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  sku_name            = var.rstudio_postgresql_sku_name

  storage_profile {
    storage_mb                        = var.rstudio_postgresql_storageprofile_storage_mb
    backup_retention_days             = var.rstudio_postgresql_storageprofile_backup_retention_days
    geo_redundant_backup              = var.rstudio_postgresql_storageprofile_geo_redundant_backup
    auto_grow                         = "Disabled"
  }

  administrator_login               = var.rstudio_postgresql_adminname
  administrator_login_password      = var.rstudio_postgresql_adminpassword
  version                           = var.rstudio_postgresql_PostGresVersion
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = "TLS1_2"
  tags                              = var.tags
  
  lifecycle {
    ignore_changes = [
      threat_detection_policy
    ]
  }

}

resource "azurerm_postgresql_virtual_network_rule" "rstudio_Postgresql_server" {
  name                                 = "postgresql-vnet-rule"
  resource_group_name                  = module.applicationrg.resource_group_name
  server_name                          = azurerm_postgresql_server.rstudio_Postgresql_server.name
  subnet_id                            = module.subnet.subnet_id
  ignore_missing_vnet_service_endpoint = true
}

resource "azurerm_postgresql_virtual_network_rule" "core_build_server" {
  name                                 = "core-build-server-vnet-rule"
  resource_group_name                  = module.applicationrg.resource_group_name
  server_name                          = azurerm_postgresql_server.rstudio_Postgresql_server.name
  subnet_id                            = var.core_build_subnet_id
  ignore_missing_vnet_service_endpoint = true
}

resource "azurerm_postgresql_virtual_network_rule" "core_aks_server" {
  name                                 = "core-aks-vnet-rule"
  resource_group_name                  = module.applicationrg.resource_group_name
  server_name                          = azurerm_postgresql_server.rstudio_Postgresql_server.name
  subnet_id                            = var.core_aks_subnet_id
  ignore_missing_vnet_service_endpoint = true
}

resource "azurerm_postgresql_database" "rstudio_Connect_Postgresql_db" {
  name                = var.environment == "production" ? "${var.application_acronym}connect_db" : "pgd-${var.location_acronym}-${var.application_acronym}-connect-${var.environment_acronym}"
  resource_group_name = module.applicationrg.resource_group_name
  server_name         = azurerm_postgresql_server.rstudio_Postgresql_server.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}
resource "azurerm_postgresql_database" "rstudio_pkgmgr_Postgresql_db" {
  name                = var.environment == "production" ? "${var.application_acronym}pkgmgr_db" : "pgd-${var.location_acronym}-${var.application_acronym}-pkgmgr-${var.environment_acronym}"
  resource_group_name = module.applicationrg.resource_group_name
  server_name         = azurerm_postgresql_server.rstudio_Postgresql_server.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}

################################### ###################
# NEW POSTGRESQL SERVER RESOURCES # # Production only #
################################### ###################

resource "azurerm_postgresql_server" "rstudio_Postgresql2_server" {
  count               = var.environment == "production" ? 1 : 0

  name                = var.environment == "production" ? "pgs-${var.location_acronym}-${var.application_acronym}2-spi-${var.environment_acronym}" : "xxxx"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  sku_name            = var.rstudio_postgresql_sku_name

  storage_profile {
    storage_mb                        = var.rstudio_postgresql_storageprofile_storage_mb
    backup_retention_days             = var.rstudio_postgresql_storageprofile_backup_retention_days
    geo_redundant_backup              = var.rstudio_postgresql_storageprofile_geo_redundant_backup
    auto_grow                         = "Disabled"
  }

  administrator_login               = var.rstudio_postgresql_adminname
  administrator_login_password      = var.rstudio_postgresql_adminpassword
  version                           = var.rstudio_postgresql_PostGresVersion
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = "TLS1_2"
  tags                              = var.tags
  
  lifecycle {
    ignore_changes = [
      threat_detection_policy
    ]
  }
  
}
resource "azurerm_postgresql_virtual_network_rule" "rstudio_Postgresql2_server" {
  count               = var.environment == "production" ? 1 : 0

  name                                 = "postgresql2-vnet-rule"
  resource_group_name                  = module.applicationrg.resource_group_name
  server_name                          = azurerm_postgresql_server.rstudio_Postgresql2_server[0].name
  subnet_id                            = module.subnet.subnet_id
  ignore_missing_vnet_service_endpoint = true
}
resource "azurerm_postgresql_virtual_network_rule" "core_build2_server" {
  count               = var.environment == "production" ? 1 : 0

  name                                 = "core-build2-server-vnet-rule"
  resource_group_name                  = module.applicationrg.resource_group_name
  server_name                          = azurerm_postgresql_server.rstudio_Postgresql2_server[0].name
  subnet_id                            = var.core_build_subnet_id
  ignore_missing_vnet_service_endpoint = true
}
resource "azurerm_postgresql_virtual_network_rule" "core_aks2_server" {
  count               = var.environment == "production" ? 1 : 0

  name                                 = "core-aks2-vnet-rule"
  resource_group_name                  = module.applicationrg.resource_group_name
  server_name                          = azurerm_postgresql_server.rstudio_Postgresql2_server[0].name
  subnet_id                            = var.core_aks_subnet_id
  ignore_missing_vnet_service_endpoint = true
}
resource "azurerm_postgresql_database" "rstudio_Connect_Postgresql2_db" {
  count               = var.environment == "production" ? 1 : 0

  name                = var.environment == "production" ? "pgd-${var.location_acronym}-${var.application_acronym}2-connect-${var.environment_acronym}" : "xxxx"
  resource_group_name = module.applicationrg.resource_group_name
  server_name         = azurerm_postgresql_server.rstudio_Postgresql2_server[0].name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}
resource "azurerm_postgresql_database" "rstudio_pkgmgr2_Postgresql_db" {
  count               = var.environment == "production" ? 1 : 0

  name                = var.environment == "production" ? "pgd-${var.location_acronym}-${var.application_acronym}2-pkgmgr-${var.environment_acronym}" : "xxxx"
  resource_group_name = module.applicationrg.resource_group_name
  server_name         = azurerm_postgresql_server.rstudio_Postgresql2_server[0].name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}

output "FQDN_Postgresql" {
  value = azurerm_postgresql_server.rstudio_Postgresql_server.fqdn
}
output "Postgresql_DB_id" {
  value = azurerm_postgresql_database.rstudio_Connect_Postgresql_db.id
}
