locals {
  common_prefix_sto                 = "sto${var.location_acronym}${var.application_acronym}"
}

module "vmdiagnosticslogssa" {
  source                            = "../../modules12/storage_account"
  storage_account_name              = var.environment=="production" ? "copeastusvmlog01sa" : "${local.common_prefix_sto}01sa${var.environment_acronym}"
  resource_group_location           = module.loganalyticsrg.resource_group_location
  resource_group_name               = module.loganalyticsrg.resource_group_name
  tags                              = var.tags

  account_replication_type          = "RAGRS"
  enable_advanced_threat_protection = "true"
  network_rule_default_action       = "Allow"
}

resource "azurerm_storage_account" "spifpisa" {
  name                              = var.environment=="production" ? "copspifpifilesharesa" : "${local.common_prefix_sto}fish${var.environment_acronym}"
  location                          = module.rgfpi.resource_group_location
  resource_group_name               = module.rgfpi.resource_group_name
  tags                              = var.tags

  account_tier                      = "Standard"
  account_replication_type          = var.account_replication_type
  account_kind                      = "StorageV2"
  enable_https_traffic_only         = "true"
  min_tls_version                   = "TLS1_2"

  network_rules {
    default_action                  = "Deny"
    ip_rules                        = ["115.114.9.131", "199.207.253.96", "199.207.253.101"]
    virtual_network_subnet_ids      = [azurerm_subnet.backend.id, azurerm_subnet.frontend.id]
  }
}