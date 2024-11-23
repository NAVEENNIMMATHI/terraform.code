resource "azurerm_private_endpoint" "pep_sa" {
  name                = "pep-${var.location}-${var.project_acronym}-${var.engagement_name}${var.separator}sto-${var.environment_acronym}"
  location            = module.ignite_rg.resource_group_location
  resource_group_name = module.ignite_rg.resource_group_name
  subnet_id           = data.azurerm_subnet.ignite_pep_subnet.id

  private_service_connection {
    name                           = "pep-${var.location}-${var.project_acronym}-${var.engagement_name}${var.separator}sto-${var.environment_acronym}"
    private_connection_resource_id = module.ignite_stg.id
    is_manual_connection           = false
    subresource_names              = ["blob"]
  }

  private_dns_zone_group {
    name                 = "dns_zone_ignite${var.engagement_name}"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.storage_blob.id]
  } 

     tags = var.tags

}


###### Postgresql Private Endpoint ######

resource "azurerm_private_endpoint" "pep_psql" {
  name                = "pep-${var.location}-${var.project_acronym}-${var.engagement_name}${var.separator}psql-${var.environment_acronym}"
  location            = module.ignite_rg.resource_group_location
  resource_group_name = module.ignite_rg.resource_group_name
  subnet_id           = data.azurerm_subnet.ignite_pep_subnet.id

# modfiy the subnet resource name
  private_service_connection {
    name                           = "pep-${var.location}-${var.project_acronym}-${var.engagement_name}${var.separator}psql-${var.environment_acronym}"
    private_connection_resource_id = azurerm_postgresql_server.ignite_Postgresql_server.id
    is_manual_connection           = false
    subresource_names              = ["postgresqlServer"]

  }

  private_dns_zone_group {
    name                 = "dns_zone_ignitepsql${var.engagement_name}"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.postgresql_database.id]
  } 

   tags = var.tags

}

# Azure Container Registry Dev Spoke Sub - Private End Point
resource "azurerm_private_endpoint" "pep_ignitecp_acr" {
  name                = "pep-acr-${var.location}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name = module.ignite_rg.resource_group_name
  location            = module.ignite_rg.resource_group_location
  subnet_id           = data.azurerm_subnet.ignite_pep_subnet.id

  private_service_connection {
    name                           = "pesc-acr-${var.location}-${var.application_acronym}-${var.environment_acronym}"
    private_connection_resource_id = azurerm_container_registry.ignitecp_acr.id
    subresource_names              = ["registry"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = "dns_zone_containerregistry"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_cp_acr.id]
  }

  tags = var.tags

  depends_on = [ azurerm_container_registry.ignitecp_acr ]
}

#Private Endpoint for KeyVault
resource "azurerm_private_endpoint" "kvl_endpoint" {
  name                = "pep-${var.location}-${var.project_acronym}-${var.engagement_name}${var.separator}kvl-${var.environment_acronym}"
  location            = module.ignite_rg.resource_group_location
  resource_group_name = module.ignite_rg.resource_group_name
  subnet_id           = data.azurerm_subnet.ignite_pep_subnet.id

  private_service_connection {
    name                           = "pep-${var.location}-${var.project_acronym}-${var.engagement_name}${var.separator}kvl-${var.environment_acronym}"
    private_connection_resource_id = azurerm_key_vault.ignite_key_vault.id
    subresource_names              = ["vault"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "dns_zone_ignitekvl${var.engagement_name}"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_keyvault.id]
  }


  tags = var.tags
}

# Azure Cognitive service Dev Spoke Sub - Private End Point
resource "azurerm_private_endpoint" "igncp_cog_pe" {
  name                = "pep-css-${var.location}-${var.project_acronym}-${var.engagement_name}${var.separator}${var.environment}"
  location            = module.ignite_rg.resource_group_location
  resource_group_name = module.ignite_rg.resource_group_name
  subnet_id           = data.azurerm_subnet.ignite_pep_subnet.id
  
  private_service_connection {
    name                           = "pep-css-${var.location}-${var.project_acronym}-${var.engagement_name}${var.separator}${var.environment}-diag"
    private_connection_resource_id =  azurerm_cognitive_account.ignitecp-cognitive-account.id
    subresource_names              = ["account"]
	is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = "dns_zone_ignitecongnitive${var.engagement_name}"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_cognitive_account.id]
  }

  tags = var.tags
}

resource "azurerm_private_endpoint" "igncp_drgs_cog_pe" {
  name                = "pep-css-${var.location}-${var.project_acronym}-${var.engagement_name}${var.separator}drgs-${var.environment}"
  location            = module.ignite_rg.resource_group_location
  resource_group_name = module.ignite_rg.resource_group_name
  subnet_id           = data.azurerm_subnet.ignite_pep_subnet.id
  
  private_service_connection {
    name                           = "pep-css-${var.location}-${var.project_acronym}-${var.engagement_name}${var.separator}drgs-${var.environment}-diag"
    private_connection_resource_id =  azurerm_cognitive_account.ignitecp-drgs-cognitive-account.id
    subresource_names              = ["account"]
	is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = "dns_zone_ignitecongnitive_drgs${var.engagement_name}"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_cognitive_account.id]
  }

  tags = var.tags
}
