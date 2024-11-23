# Private Endpoint for Client Storage Account
resource "azurerm_private_endpoint" "pep_sa" {
  name                = "pep-use-${var.application_acronym}-${var.client}-sto-${var.environment_acronym}"
  resource_group_name = module.mathworks_rg_client.resource_group_name
  location            = module.mathworks_rg_client.resource_group_location
  subnet_id           = module.subnet_private_link.subnet_id

  private_service_connection {
    name                           = "psc-use-${var.application_acronym}-${var.client}-sto-${var.environment_acronym}"
    private_connection_resource_id = module.mathworksclientsa.id
    is_manual_connection           = false
    subresource_names              = ["file"]
  }

  private_dns_zone_group {
    name                 = data.azurerm_private_dns_zone.dns_zone_storage_file.name
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_storage_file.id]
  }

  tags = var.tags
}

# Container Registry
resource "azurerm_private_endpoint" "private_endpoint_conregistry" {
  name                = "pep-use-${var.application_acronym}-${var.client}-acr-${var.environment_acronym}"
  resource_group_name = module.mathworks_rg_client.resource_group_name
  location            = module.mathworks_rg_client.resource_group_location
  subnet_id           = module.subnet_private_link.subnet_id

  private_service_connection {
    name                           = "psc-use-${var.application_acronym}-${var.client}-acr-${var.environment_acronym}"
    private_connection_resource_id = azurerm_container_registry.mipacr.id
    subresource_names              = ["registry"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "dns_zone_containerregistry"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_registry.id]
  }

  tags = var.tags
}

#Private Endpoint for PostgreSQL DB pep-use-mip-stifel-aps-dv
resource "azurerm_private_endpoint" "private_endpoint_postgresql" {
  name                = "pep-use-${var.application_acronym}-${var.client}-aps-${var.environment_acronym}"
  resource_group_name = module.mathworks_rg_client.resource_group_name
  location            = module.mathworks_rg_client.resource_group_location
  subnet_id           = module.subnet_private_link.subnet_id

  private_service_connection {
    name                           = "psc-use-${var.application_acronym}-${var.client}-aps-${var.environment_acronym}"
    private_connection_resource_id = azurerm_postgresql_server.mathworks_Postgresql_server.id
    is_manual_connection           = false
    subresource_names              = ["postgresqlServer"]
  }

  private_dns_zone_group {
    name                 = "dns_zone_postgresql"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_postgresql.id]
  }

  tags = var.tags
}

# Private Endpoint for Client KeyVault
resource "azurerm_private_endpoint" "private_endpoint_keyvault" {
  name                = "pep-use-${var.application_acronym}-${var.client}-kvl-${var.environment_acronym}"
  resource_group_name = module.mathworks_rg_client.resource_group_name
  location            = module.mathworks_rg_client.resource_group_location
  subnet_id           = module.subnet_private_link.subnet_id

  private_service_connection {
    name                           = "psc-use-${var.application_acronym}-${var.client}-kvl-${var.environment_acronym}"
    private_connection_resource_id = azurerm_key_vault.mipkv.id
    is_manual_connection           = false
    subresource_names              = ["vault"]
  }

  private_dns_zone_group {
    name                 = data.azurerm_private_dns_zone.dns_zone_keyvault.name
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_keyvault.id]
  }

  tags = var.tags
}

#Private Endpoint for AKS Cluster subnet
resource "azurerm_private_endpoint" "private_endpoint_aks" {
  name                = "pep-${var.location_acronym}-${var.application_acronym}-aks-${var.environment_acronym}"
  resource_group_name = module.mathworks_rg_client.resource_group_name
  location            = module.mathworks_rg_client.resource_group_location
  subnet_id           = module.subnet_aks.subnet_id

  private_service_connection {
    name                           = "pesc-${azurerm_kubernetes_cluster.aks_mip.name}-${var.environment_acronym}"
    private_connection_resource_id = azurerm_kubernetes_cluster.aks_mip.id
    subresource_names              = ["management"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = "dns_zone_management"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone_azmk8s.id]
  }

  tags = var.tags
}