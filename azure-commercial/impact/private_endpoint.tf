resource "azurerm_private_endpoint" "impact_filedata_endpoint" {
  name                = lower("pep-${var.location_acronym}-${var.application_acronym}-stouseimpactfile-${var.environment_acronym}")
  location            = module.impact_rg.resource_group_location
  resource_group_name = module.impact_rg.resource_group_name
  subnet_id           = module.impact_pep_subnet.subnet_id
  private_service_connection {
    name                           = lower("pep-${var.location_acronym}-${var.application_acronym}-stouseimpactfile-${var.environment_acronym}")
    private_connection_resource_id = module.impactfiledata01sa.id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = data.azurerm_private_dns_zone.dns_zone_storage_blob.name
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_storage_blob.id]
  }

  depends_on = [module.impactfiledata01sa]

  tags = var.tags
}


resource "azurerm_private_endpoint" "impact_clientupload_endpoint" {
  name                = lower("pep-${var.location_acronym}-${var.application_acronym}-stouseimpactupload-${var.environment_acronym}")
  location            = module.impact_rg.resource_group_location
  resource_group_name = module.impact_rg.resource_group_name
  subnet_id           = module.impact_pep_subnet.subnet_id
  private_service_connection {
    name                           = lower("pep-${var.location_acronym}-${var.application_acronym}-stouseimpactupload-${var.environment_acronym}")
    private_connection_resource_id = azurerm_storage_account.client_upload.id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = data.azurerm_private_dns_zone.dns_zone_storage_blob.name
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_storage_blob.id]
  }
  tags = var.tags
}

resource "azurerm_private_endpoint" "impact_dfsdata_endpoint" {
  name                = lower("pep-${var.location_acronym}-${var.application_acronym}-dfsimpactfile-${var.environment_acronym}")
  location            = module.impact_rg.resource_group_location
  resource_group_name = module.impact_rg.resource_group_name
  subnet_id           = module.impact_pep_subnet.subnet_id
  private_service_connection {
    name                           = lower("pep-${var.location_acronym}-${var.application_acronym}-dfsimpactfile-${var.environment_acronym}")
    private_connection_resource_id = module.impactfiledata01sa.id
    subresource_names              = ["dfs"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = "dns_zone_dfs"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_dfs.id]
  }

  depends_on = [module.impactfiledata01sa]
  
  tags = var.tags
}
resource "azurerm_private_endpoint" "impact_dls_endpoint" {
  name                = lower("pep-${var.location_acronym}-${var.application_acronym}-dls-${var.environment_acronym}")
  location            = module.impact_rg.resource_group_location
  resource_group_name = module.impact_rg.resource_group_name
  subnet_id           = module.impact_pep_subnet.subnet_id
  private_service_connection {
    name                           = lower("pep-${var.location_acronym}-${var.application_acronym}-dls-${var.environment_acronym}")
    private_connection_resource_id = module.impactdatalake01sa.id
    subresource_names              = ["dfs"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = "dns_zone_dls"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_dfs.id]
  }
  tags = var.tags
}


resource "azurerm_private_endpoint" "kvl_endpoint" {
  name                = lower("pep-${var.location_acronym}-${var.application_acronym}-impactvault-${var.environment_acronym}")
  location            = module.impact_rg.resource_group_location
  resource_group_name = module.impact_rg.resource_group_name
  subnet_id           = module.impact_pep_subnet.subnet_id
  private_service_connection {
    name                           = lower("pe-${var.location_acronym}-${var.application_acronym}-impactvault-${var.environment_acronym}")
    private_connection_resource_id = azurerm_key_vault.impact_key_vault.id
    subresource_names              = ["vault"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = data.azurerm_private_dns_zone.dns_zone_keyvault.name
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_keyvault.id]
  }


  tags = var.tags
}

resource "azurerm_private_endpoint" "private_endpoint_conregistry" {
  name                = "pep-use-impact-acr-${var.environment_acronym}"
  resource_group_name = module.impact_rg.resource_group_name
  location            = module.impact_rg.resource_group_location
  subnet_id           = module.impact_pep_subnet.subnet_id

  private_service_connection {
    name                           = "psc-use-impact-acr-${var.environment_acronym}"
    private_connection_resource_id = azurerm_container_registry.impactacr.id
    subresource_names              = ["registry"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = "dns_zone_containerregistry"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_registry.id]
  }

  tags = var.tags
}

resource "azurerm_private_endpoint" "impact_synapse_endpoint" {
  name                = lower("pep-${var.location_acronym}-${var.application_acronym}-synapse-${var.environment_acronym}")
  location            = module.impact_rg.resource_group_location
  resource_group_name = module.impact_rg.resource_group_name
  subnet_id           = module.impact_pep_subnet.subnet_id
  private_service_connection {
    name                           = lower("pep-${var.location_acronym}-${var.application_acronym}-synapse-${var.environment_acronym}")
    private_connection_resource_id = azurerm_synapse_workspace.impact_synapse.id
    subresource_names              = ["Dev"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = "dns_dev_zone_synapse"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_dev_synapse.id]
  }
  tags = var.tags
}

resource "azurerm_private_endpoint" "private_endpoint_synapse" {
  name                = "pep-${var.location_acronym}-${var.application_acronym}-saw-${var.environment_acronym}"
  resource_group_name = module.impact_rg.resource_group_name
  location            = module.impact_rg.resource_group_location
  subnet_id           = module.impact_pep_subnet.subnet_id

  private_service_connection {
    name                           = "pep-${var.location_acronym}-${var.application_acronym}-saw-${var.environment_acronym}"
    private_connection_resource_id = azurerm_synapse_workspace.impact_synapse.id

    subresource_names    = ["Sql"]
    is_manual_connection = false
  }
  private_dns_zone_group {
    name                 = "dns_zone_synapse"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_synapse.id]
  }

  tags = var.tags
}

resource "azurerm_private_endpoint" "private_endpoint_sql" {
  name                = "pep-use-impact-sql-${var.environment_acronym}"
  resource_group_name = module.impact_rg.resource_group_name
  location            = module.impact_rg.resource_group_location
  subnet_id           = module.impact_pep_subnet.subnet_id

  private_service_connection {
    name                           = "psc-use-impact-sql-${var.environment_acronym}"
    private_connection_resource_id = azurerm_mssql_server.impact_srv_mssql_server.id
    subresource_names              = ["sqlServer"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = "dns_zone_srv_sql"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_database.id]
  }

  tags = var.tags
}

resource "azurerm_private_endpoint" "private_endpoint_func" {
  name                = "pep-use-impact-func-${var.environment_acronym}"
  resource_group_name = module.impact_rg.resource_group_name
  location            = module.impact_rg.resource_group_location
  subnet_id           = module.impact_pep_subnet.subnet_id

  private_service_connection {
    name                           = "psc-use-impact-func-${var.environment_acronym}"
    private_connection_resource_id = azurerm_function_app.main.id
    subresource_names              = ["sites"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = "dns_zone_azurewebsites"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_azurewebsites.id]
  }

  tags = var.tags
}

resource "azurerm_private_endpoint" "private_endpoint_ui_app" {
  name                = "pep-use-impact-ui-appp-${var.environment_acronym}"
  resource_group_name = module.impact_rg.resource_group_name
  location            = module.impact_rg.resource_group_location
  subnet_id           = module.impact_pep_subnet.subnet_id

  private_service_connection {
    name                           = "psc-use-impact-ui-app-${var.environment_acronym}"
    private_connection_resource_id = azurerm_app_service.main.id
    subresource_names              = ["sites"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = "dns_zone_azurewebsites"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_azurewebsites.id]
  }

  tags = var.tags
}
