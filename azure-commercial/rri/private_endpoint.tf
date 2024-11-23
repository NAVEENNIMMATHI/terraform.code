data "azurerm_private_dns_zone" "storage"{
  name = "privatelink.blob.core.windows.net"
  resource_group_name = "rgp-use-core-private-dnszone-${var.pvt_dns_environment_acronym}" # DEV/QA & UAT/PD share a DNS Zone with each other
  provider            = azurerm.pvt_dns_subscription
}

data "azurerm_private_dns_zone" "vault"{
  name = "privatelink.vaultcore.azure.net"
  resource_group_name = "rgp-use-core-private-dnszone-${var.pvt_dns_environment_acronym}" # DEV/QA & UAT/PD share a DNS Zone with each other
  provider            = azurerm.pvt_dns_subscription
}

data "azurerm_private_dns_zone" "sql"{
  name = "privatelink.database.windows.net"
  resource_group_name = "rgp-use-core-private-dnszone-${var.pvt_dns_environment_acronym}" # DEV/QA & UAT/PD share a DNS Zone with each other
  provider            = azurerm.pvt_dns_subscription
}

data "azurerm_private_dns_zone" "storage_dfs"{
  name = "privatelink.dfs.core.windows.net"
  resource_group_name = "rgp-use-core-private-dnszone-${var.pvt_dns_environment_acronym}" # DEV/QA & UAT/PD share a DNS Zone with each other
  provider            = azurerm.pvt_dns_subscription
}

#Private Endpoint for Storage Account
resource "azurerm_private_endpoint" "storage_endpoint" {
  name                = lower("pe-sto-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}")
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  subnet_id           = azurerm_subnet.rridbsubnet.id

  private_dns_zone_group {
    name                 = "blob.core"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.storage.id]
  }

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
  name                = lower("pe-kvl-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}")
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  subnet_id           = azurerm_subnet.rridbsubnet.id

  private_dns_zone_group {
    name                 = "vaultcore"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.vault.id]
  }

  private_service_connection {
    name                           = lower("pe-kvl-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}")
    private_connection_resource_id = azurerm_key_vault.app_key_vault.id
    subresource_names              = ["vault"]
    is_manual_connection           = false
  }

  tags = var.tags
}

#Private Endpoint for SQL Server
resource "azurerm_private_endpoint" "sql_endpoint" {
  name                = lower("pe-sql-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}")
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  subnet_id           = azurerm_subnet.rridbsubnet.id

  private_dns_zone_group {
    name                 = "database"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.sql.id]
  }

  private_service_connection {
    name                           = lower("pe-sql-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}")
    private_connection_resource_id = module.mssql_server.sql_server_id
    subresource_names              = ["sqlServer"]
    is_manual_connection           = false
  }

  tags = var.tags
}

resource "azurerm_private_endpoint" "storage_endpoint_dfs" {
  name                = lower("pe-sto-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}-dfs")
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  subnet_id           = azurerm_subnet.rridbsubnet.id

  private_dns_zone_group {
    name                 = "dfs.core"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.storage_dfs.id]
  }

  private_service_connection {
    name                           = lower("pe-sto-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}-dfs")
    private_connection_resource_id = module.storage_account.id
    subresource_names              = ["dfs"] #"blob","file","queue","table","web"
    is_manual_connection           = false
  }

  tags = var.tags
}