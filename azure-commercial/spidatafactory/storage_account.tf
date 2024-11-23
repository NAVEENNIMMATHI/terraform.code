locals {
  legacy_prefix_dlstore  = "co${var.application_acronym}datalakestore"
  common_prefix_dlstore  = "sto${var.location_acronym}dl${var.application_acronym}${var.environment_acronym}"
  common_prefix_diagstore  = "sto${var.location_acronym}df${var.application_acronym}diag${var.environment_acronym}"
}


resource "azurerm_storage_account" "cospidatalakestore" {
  name                      = var.environment ==  "production" ? "${local.legacy_prefix_dlstore}" : "${local.common_prefix_dlstore}"
  resource_group_name       = azurerm_resource_group.cospidatalakerg.name
  location                  = var.location
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  access_tier               = "Hot"
  account_replication_type  = "RAGRS"
  enable_https_traffic_only = true
  is_hns_enabled            = true
  #large_file_share_enabled = true
  network_rules {
    bypass                     = ["AzureServices"]
    default_action             = "Deny"
  #  ip_rules                   = []
    virtual_network_subnet_ids = [var.controlplanesubnet,var.databrickssubnet,var.datafactorysubnet,var.spiappsubnet,var.kipadfsubnet]
  }

  tags = var.environment ==  "production" ?  var.tags_sto : var.tags
}


## Storage Accounts Related to Logging

resource "azurerm_storage_account" "diagnosticslogssa" {
  name                      = var.environment=="production" ? "copeuscospidiaglog01sa" : "${local.common_prefix_diagstore}"
  resource_group_name       = var.loganalyticsresourcegroupname
   location                  = var.location
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  access_tier               = "Hot"
  account_replication_type  = "RAGRS"
  enable_https_traffic_only = true
  is_hns_enabled            = false
  #large_file_share_enabled = true
  network_rules {
    bypass                     = ["AzureServices"]
    default_action             = "Deny"
    ip_rules                   = ["199.207.253.96"]
    virtual_network_subnet_ids = [var.bastion1subnet,var.spiappsubnet,var.spiappgwsubnet,var.spiase1subnet ,var.spidb1subnet ,var.spitabextsubnet,var.spiweb1subnet,var.gatewaysubnet]
  }

  tags = var.environment ==  "production" ? var.tags_diag : var.tags
}


