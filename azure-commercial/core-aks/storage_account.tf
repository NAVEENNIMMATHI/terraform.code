resource "azurerm_storage_account" "artifactory-stg" {
  count                     = 1
  name                      = "sto${var.location_acronym}art${var.environment_acronym}"
  location                  = azurerm_resource_group.aks[0].location
  resource_group_name       = azurerm_resource_group.aks[0].name # indexing since resource group is created with count
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "RAGRS"
  enable_https_traffic_only = true
  min_tls_version           = "TLS1_2"
  allow_blob_public_access  = false

  network_rules {
    default_action             = "Deny"
    ip_rules                   = []
    virtual_network_subnet_ids = []
  }

  blob_properties {
    change_feed_enabled = true
    versioning_enabled = true
    delete_retention_policy {
      days = 31
    }
  }

  tags = var.tags_Artifactory
}

resource "azurerm_private_endpoint" "artifactory-pe" {
  count               = 1
  name                = "pe-${var.location_acronym}-art-${var.environment_acronym}"
  location            = azurerm_resource_group.aks[0].location
  resource_group_name = azurerm_resource_group.aks[0].name # indexing since resource group is created with count
  subnet_id           = azurerm_subnet.aks[0].id           # indexing since subnet is created with count

  private_service_connection {
    name                           = "psc-${var.location_acronym}-art-${var.environment_acronym}"
    private_connection_resource_id = azurerm_storage_account.artifactory-stg[0].id
    is_manual_connection           = false
    subresource_names              = ["blob"]
  }

  tags = var.tags_Artifactory
}

resource "azurerm_storage_account" "cloudockit-stg" {
  count                     = 1
  name                      = "sto${var.location_acronym}cdkt${var.environment_acronym}"
  location                  = azurerm_resource_group.aks[0].location
  resource_group_name       = azurerm_resource_group.aks[0].name # indexing since resource group is created with count
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "RAGRS"
  enable_https_traffic_only = true
  min_tls_version           = "TLS1_2"
  allow_blob_public_access  = false

  network_rules {
    default_action             = "Deny"
    ip_rules                   = [ "199.207.253.0/24", "203.199.72.210", "199.206.0.5"]
    virtual_network_subnet_ids = []
  }

  tags = var.tags_Cloudockit
}

resource "azurerm_private_endpoint" "cloudockit-pe" {
  count               = 1
  name                = "pe-${var.location_acronym}-cdkt-${var.environment_acronym}"
  location            = azurerm_resource_group.aks[0].location
  resource_group_name = azurerm_resource_group.aks[0].name # indexing since resource group is created with count
  subnet_id           = azurerm_subnet.aks[0].id           # indexing since subnet is created with count

  private_service_connection {
    name                           = "psc-${var.location_acronym}-cdkt-${var.environment_acronym}"
    private_connection_resource_id = azurerm_storage_account.cloudockit-stg[0].id
    is_manual_connection           = false
    subresource_names              = ["blob"]
  }

  tags = var.tags_Cloudockit
}