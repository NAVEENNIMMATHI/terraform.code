#Private Endpoint for MDP App Storage Blob
resource "azurerm_private_endpoint" "mdp_pep_app_blob" {
  name                = "pep-blob-${module.mdp_dls_main.storage_account_name}"
  resource_group_name = module.mdp_rg_main.resource_group_name
  location            = module.mdp_rg_main.resource_group_location
  subnet_id           = module.mdp_subnet_pep.subnet_id

  private_service_connection {
    name                           = "pep-blob-${module.mdp_dls_main.storage_account_name}"
    private_connection_resource_id = module.mdp_dls_main.id
    is_manual_connection           = false
    subresource_names              = ["blob"]
  }

  private_dns_zone_group {
    name                 = "dns_zone_dls"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_storage_blob.id]
  }

  tags = var.tags
}

#resource "azurerm_private_endpoint" "mdp_pep_adb" {
#  name                = "pep-${var.location_acronym}-mdp-adb-${var.environment_acronym}"
#  resource_group_name = module.mdp_rg_main.resource_group_name
#  location            = module.mdp_rg_main.resource_group_location
#  subnet_id           = module.mdp_subnet_pep.subnet_id
#
#  private_service_connection {
#    name                           = "pep-${var.location_acronym}-mdp-adb-${var.environment_acronym}"
#    private_connection_resource_id = azurerm_databricks_workspace.mdp_adb.id
#    is_manual_connection           = false
#    subresource_names              = ["databricks_ui_api"]
#  }
#
#  private_dns_zone_group {
#    name                 = data.azurerm_private_dns_zone.dns_zone_databricks.name
#    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_databricks.id]
#  }
#
#  tags = var.tags
#}

/*
#Private Endpoint for ODP App Storage Blob
resource "azurerm_private_endpoint" "mdp_pep_app_blob" 
  name                = "pep-${var.location_acronym}-mdp-adf-${var.environment_acronym}"
  resource_group_name = module.mdp_rg_main.resource_group_name
  location            = module.mdp_rg_main.resource_group_location
  subnet_id           = module.mdp_subnet_pep.subnet_id

  private_service_connection {
    name                           = "pep-${var.location_acronym}-mdp-adf-${var.environment_acronym}"
    private_connection_resource_id = azurerm_data_factory.mdpadf.id
    is_manual_connection           = false
    subresource_names              = ["blob"]
  }

#  private_dns_zone_group {
#    name                 = data.azurerm_private_dns_zone.privatelink_blob_core_usgovcloudapi_net.name
#    private_dns_zone_ids = [data.azurerm_private_dns_zone.privatelink_blob_core_usgovcloudapi_net.id]
#  }

  tags = var.tags
}
*/

#Private Endpoint for MDP Data factory
resource "azurerm_private_endpoint" "private_endpoint_df" {
  name                = "pep-${var.location_acronym}-${var.application_acronym}-adf-${var.environment_acronym}"
  resource_group_name = module.mdp_rg_main.resource_group_name
  location            = module.mdp_rg_main.resource_group_location
  subnet_id           = module.mdp_subnet_pep.subnet_id

  private_service_connection {
    name                           = "pesc-${var.location_acronym}-${var.application_acronym}-df-${var.environment_acronym}"
    private_connection_resource_id = azurerm_data_factory.mdpadf.id
    subresource_names              = ["dataFactory"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = "dns_zone_datafactory"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_datafactory.id]
  }

  tags = var.tags
}


#Private Endpoint for MDP Synapse analytics

resource "azurerm_private_endpoint" "private_endpoint_synapse" {
  name                = "pep-${var.location_acronym}-${var.application_acronym}-saw-${var.environment_acronym}"
  resource_group_name = module.mdp_rg_main.resource_group_name
  location            = module.mdp_rg_main.resource_group_location
  subnet_id           = module.mdp_subnet_pep.subnet_id

  private_service_connection {
    name                           = "pep-${var.location_acronym}-${var.application_acronym}-saw-${var.environment_acronym}"
    private_connection_resource_id = azurerm_synapse_workspace.mdpsynapse.id

    subresource_names    = ["Sql"]
    is_manual_connection = false
  }
  private_dns_zone_group {
    name                 = "dns_zone_synapse"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_synapse.id]
  }

  tags = var.tags
}

#Private Endpoint for MDP Synapse development endpoint 
resource "azurerm_private_endpoint" "private_endpoint_dev_synapse" {
  name                = "pep-${var.location_acronym}-${var.application_acronym}-saw-dev-${var.environment_acronym}"
  resource_group_name = module.mdp_rg_main.resource_group_name
  location            = module.mdp_rg_main.resource_group_location
  subnet_id           = module.mdp_subnet_pep.subnet_id

  private_service_connection {
    name                           = "pep-${var.location_acronym}-${var.application_acronym}-saw-dev-${var.environment_acronym}"
    private_connection_resource_id = azurerm_synapse_workspace.mdpsynapse.id

    subresource_names    = ["Dev"]
    is_manual_connection = false
  }
  private_dns_zone_group {
    name                 = "dns_dev_zone_synapse"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_dev_synapse.id]
  }

  tags = var.tags
}


#Private Endpoint for MDP Synapse Serverless SQLOnDemand endpoint endpoint 
resource "azurerm_private_endpoint" "private_endpoint_sqlondemand_synapse" {
  name                = "pep-${var.location_acronym}-${var.application_acronym}-saw-sqlondemand-${var.environment_acronym}"
  resource_group_name = module.mdp_rg_main.resource_group_name
  location            = module.mdp_rg_main.resource_group_location
  subnet_id           = module.mdp_subnet_pep.subnet_id

  private_service_connection {
    name                           = "pep-${var.location_acronym}-${var.application_acronym}-saw-sqlondemand-${var.environment_acronym}"
    private_connection_resource_id = azurerm_synapse_workspace.mdpsynapse.id

    subresource_names    = ["SqlOnDemand"]
    is_manual_connection = false
  }
  private_dns_zone_group {
    name                 = "dns_sqlondemand_zone_synapse"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_synapse.id]
  }

  tags = var.tags
}


#Private Endpoint for MDP Synapse Sql endpoint  
resource "azurerm_private_endpoint" "private_endpoint_sql_synapse" {
  name                = "pep-${var.location_acronym}-${var.application_acronym}-saw-sql-${var.environment_acronym}"
  resource_group_name = module.mdp_rg_main.resource_group_name
  location            = module.mdp_rg_main.resource_group_location
  subnet_id           = module.mdp_subnet_pep.subnet_id

  private_service_connection {
    name                           = "pep-${var.location_acronym}-${var.application_acronym}-saw-sql-${var.environment_acronym}"
    private_connection_resource_id = azurerm_synapse_workspace.mdpsynapse.id

    subresource_names    = ["Sql"]
    is_manual_connection = false
  }
  private_dns_zone_group {
    name                 = "dns_sql_zone_synapse"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_synapse.id]
  }

  tags = var.tags
}



# Private endpoint for Azure Storage #
resource "azurerm_private_endpoint" "mdp-sa-pe" {
  name                = "pep-blob-sto${var.location_acronym}${var.application_acronym}func${var.environment_acronym}"
  location            = module.mdp_rg_main.resource_group_location
  resource_group_name = module.mdp_rg_main.resource_group_name
  subnet_id           = module.mdp_subnet_pep.subnet_id

  private_service_connection {
    name                           = "privatelink.blob.core.windows.net"
    private_connection_resource_id = module.mdpsa.id
    is_manual_connection           = false
    subresource_names              = ["blob"]
  }

  private_dns_zone_group {
     name                 = data.azurerm_private_dns_zone.dns_zone_storage_blob.name
     private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_storage_blob.id]
  }


  tags = var.tags
}

#Private Endpoint for mdp FunctionApp
resource "azurerm_private_endpoint" "mdp_pep_fun" {
  name                = "pep-${azurerm_function_app.main.name}"
  resource_group_name = module.mdp_rg_main.resource_group_name
  location            = module.mdp_rg_main.resource_group_location
  subnet_id           = module.mdp_subnet_pep.subnet_id

  private_service_connection {
    name                           = "pep-sites-${azurerm_function_app.main.name}"
    private_connection_resource_id = azurerm_function_app.main.id
    is_manual_connection           = false
    subresource_names              = ["sites"]
  }

  private_dns_zone_group {
    name                 = data.azurerm_private_dns_zone.dns_zone_azurewebsites.name
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_azurewebsites.id]
  }

  tags = var.tags
}


#Private Endpoint for KeyVault
resource "azurerm_private_endpoint" "kvl_endpoint" {
  name                = "pep-${lower(var.location_acronym)}-${var.application_acronym}-kvl-${lower(var.environment_acronym)}"
  resource_group_name = module.mdp_rg_main.resource_group_name
  location            = module.mdp_rg_main.resource_group_location
  subnet_id           = module.mdp_subnet_pep.subnet_id

  private_service_connection {
    name                           = "pep-${lower(var.location_acronym)}-${var.application_acronym}-kvl-${lower(var.environment_acronym)}"
    private_connection_resource_id = azurerm_key_vault.mdpkv.id
    subresource_names              = ["vault"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = data.azurerm_private_dns_zone.dns_zone_keyvault.name
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_keyvault.id]
  }


  tags = var.tags
}

/* is for the private endpoint of accessing workspace linked Azure Data Lake Storage Gen2 */
resource "azurerm_private_endpoint" "private_endpoint_dl_dfs" {
  name                             = "pe-${var.location_acronym}-${var.application_acronym}-dldfs-${var.environment_acronym}"
  resource_group_name = module.mdp_rg_main.resource_group_name
  location            = module.mdp_rg_main.resource_group_location
  subnet_id           = module.mdp_subnet_pep.subnet_id

  private_service_connection {
    name                           = "pesc-${var.location_acronym}-${var.application_acronym}-dldfs-${var.environment_acronym}"
    private_connection_resource_id = module.mdp_dls_main.id
    subresource_names              = ["dfs"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                           = "dns_zone_dfs"
    private_dns_zone_ids           = [data.azurerm_private_dns_zone.dns_zone_dfs.id]
  }

  tags                             = var.tags
}


#Private Endpoint for MDP container registry

resource "azurerm_private_endpoint" "private_endpoint_conregistry" {
  name                = "pep-${azurerm_container_registry.mdpacr.name}-${var.environment_acronym}"
  resource_group_name = module.mdp_rg_main.resource_group_name
  location            = module.mdp_rg_main.resource_group_location
  subnet_id           = module.mdp_subnet_pep.subnet_id

  private_service_connection {
    name                           = "pesc-${azurerm_container_registry.mdpacr.name}-${var.environment_acronym}"
    private_connection_resource_id = azurerm_container_registry.mdpacr.id
    subresource_names              = ["registry"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = "dns_zone_containerregistry"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_registry.id]
  }

  tags = var.tags
}


#Private Endpoint for AKS Cluster subnet

resource "azurerm_private_endpoint" "private_endpoint_aks" {
  name                = "pep-${var.location_acronym}-${var.application_acronym}-aks-${var.environment_acronym}"
  resource_group_name = module.mdp_rg_main.resource_group_name
  location            = module.mdp_rg_main.resource_group_location
  subnet_id           = module.mdp_aks_subnet.subnet_id

  private_service_connection {
    name                           = "pesc-${azurerm_kubernetes_cluster.aks_mdp.name}-${var.environment_acronym}"
    private_connection_resource_id = azurerm_kubernetes_cluster.aks_mdp.id
    subresource_names              = ["management"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = "dns_zone_management"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_azmk8s.id]
  }

  tags = var.tags
}


resource "azurerm_private_endpoint" "mdp_pep_avfap_blob" {
  name                = "pep-blob-${module.avmdpsa.storage_account_name}"
  resource_group_name = module.mdp_rg_main.resource_group_name
  location            = module.mdp_rg_main.resource_group_location
  subnet_id           = module.mdp_subnet_pep.subnet_id

  private_service_connection {
    name                           = "pep-blob-${module.avmdpsa.storage_account_name}"
    private_connection_resource_id = module.avmdpsa.id
    is_manual_connection           = false
    subresource_names              = ["blob"]
  }

  private_dns_zone_group {
    name                 = "dns_zone_avfap_blob"
    private_dns_zone_ids = [
      data.azurerm_private_dns_zone.dns_zone_storage_blob.id
    ]
  }

  tags = var.tags
}

resource "azurerm_private_endpoint" "mdp_pep_avfap_queue" {
  name                = "pep-queue-${module.avmdpsa.storage_account_name}"
  resource_group_name = module.mdp_rg_main.resource_group_name
  location            = module.mdp_rg_main.resource_group_location
  subnet_id           = module.mdp_subnet_pep.subnet_id

  private_service_connection {
    name                           = "pep-queue-${module.avmdpsa.storage_account_name}"
    private_connection_resource_id = module.avmdpsa.id
    is_manual_connection           = false
    subresource_names              = ["queue"]
  }

  private_dns_zone_group {
    name                 = "dns_zone_avfap_queue"
    private_dns_zone_ids = [
      data.azurerm_private_dns_zone.dns_zone_storage_queue.id
    ]
  }

  tags = var.tags
}

#Private Endpoint for SQL Server
resource "azurerm_private_endpoint" "mdp_pep_sql_appintg" {
  name                = "pep-srv-${var.location_acronym}-${var.application_acronym}-appintg-${var.environment_acronym}"
  resource_group_name = module.mdp_rg_main.resource_group_name
  location            = module.mdp_rg_main.resource_group_location
  subnet_id           = module.mdp_subnet_pep.subnet_id

  private_service_connection {
    name                           = "pep-srv-${var.location_acronym}-${var.application_acronym}-appintg-${var.environment_acronym}"
    private_connection_resource_id = azurerm_mssql_server.mdp_srv_mssql_server.id
    subresource_names              = ["sqlServer"]
    is_manual_connection           = false
  
  }

  private_dns_zone_group {
    name                 = "dns_zone_srv_sql"
    private_dns_zone_ids = [
      data.azurerm_private_dns_zone.dns_zone_database.id
    ]
  }
  tags = var.tags
}

#Private Endpoint for Web Appintg
resource "azurerm_private_endpoint" "mdp_pep_web_appintg" {
  name                = "pep-web-${var.location_acronym}-${var.application_acronym}-appintg-${var.environment_acronym}"
  resource_group_name = module.mdp_rg_main.resource_group_name
  location            = module.mdp_rg_main.resource_group_location
  subnet_id           = module.mdp_subnet_pep.subnet_id

  private_service_connection {
    name                           = "pep-web-${var.location_acronym}-${var.application_acronym}-appintg-${var.environment_acronym}"
    private_connection_resource_id = azurerm_app_service.web_appintg.id
    subresource_names              = ["sites"]
    is_manual_connection           = false
  
  }

  private_dns_zone_group {
    name                 = "dns_zone_appintg"
    private_dns_zone_ids = [
      data.azurerm_private_dns_zone.dns_zone_azurewebsites.id
    ]
  }

  tags = var.tags
}
