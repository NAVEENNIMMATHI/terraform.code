#Private Endpoint for CMP container registry

resource "azurerm_private_endpoint" "private_endpoint_conregistry" {
  name                = "pep-use-cmp-shared-acr-${var.environment_acronym}"
  resource_group_name = module.cmp_rg_shared.resource_group_name
  location            = module.cmp_rg_shared.resource_group_location
  subnet_id           = module.cmp_sharedpep_subnet.subnet_id

  private_service_connection {
    name                           = "psc-use-cmp-shared-acr-${var.environment_acronym}"
    private_connection_resource_id = azurerm_container_registry.cmpacr.id
    subresource_names              = ["registry"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = "dns_zone_containerregistry"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_registry.id]
  }

  tags = var.tags
}

#Private Endpoint for KeyVault
resource "azurerm_private_endpoint" "cmp_kvl_endpoint" {
  name                = "pep-${lower(var.location_acronym)}-${var.application_acronym}-shared-kvl-${lower(var.environment_acronym)}"
  resource_group_name = module.cmp_rg_shared.resource_group_name
  location            = module.cmp_rg_shared.resource_group_location
  subnet_id           = module.cmp_sharedpep_subnet.subnet_id

  private_service_connection {
    name                           = "psc-${lower(var.location_acronym)}-${var.application_acronym}-shared-kvl-${lower(var.environment_acronym)}"
    private_connection_resource_id = azurerm_key_vault.cmp_key_vault.id
    subresource_names              = ["vault"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = data.azurerm_private_dns_zone.dns_zone_keyvault.name
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_keyvault.id]
  }


  tags = var.tags
}

#Private Endpoint for azure postgresql
resource "azurerm_private_endpoint" "cmp_aps_endpoint" {
  for_each = var.cmp_clients

  name                = "pep-${lower(var.location_acronym)}-${var.application_acronym}-${each.key}-aps-${lower(var.environment_acronym)}"
  resource_group_name = module.cmp_rg_client[each.key].resource_group_name
  location            = module.cmp_rg_client[each.key].resource_group_location
  subnet_id           = module.cmp_subnet_pep[each.key].subnet_id

  private_service_connection {
    name                           = "pep-${lower(var.location_acronym)}-${var.application_acronym}-${each.key}-aps-${lower(var.environment_acronym)}"
    private_connection_resource_id = azurerm_postgresql_server.aps-cmp-server[each.key].id
    subresource_names              = ["postgresqlServer"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "dns_zone_postgresql"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_postgresql.id]
  }

  tags = var.tags
}



#Private Endpoint for Tenant KeyVaults
resource "azurerm_private_endpoint" "cmp_kvl_tenant_endpoint" {
  for_each = var.cmp_clients

  name                = "pep-${lower(var.location_acronym)}-${var.application_acronym}-${each.key}-kvl-${lower(var.environment_acronym)}"
  resource_group_name = module.cmp_rg_client[each.key].resource_group_name
  location            = module.cmp_rg_client[each.key].resource_group_location
  subnet_id           = module.cmp_subnet_pep[each.key].subnet_id

  private_service_connection {
    name                           = "pep-${lower(var.location_acronym)}-${var.application_acronym}-${each.key}-kvl-${lower(var.environment_acronym)}"
    private_connection_resource_id = azurerm_key_vault.cmp_key_vault_tenant[each.key].id
    subresource_names              = ["vault"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = data.azurerm_private_dns_zone.dns_zone_keyvault.name
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_keyvault.id]
  }


  tags = var.tags
}