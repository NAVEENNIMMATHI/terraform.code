resource "azurerm_storage_account" "storage_account" {
  name                      = var.storage_account_name
  resource_group_name       = var.resource_group_name
  location                  = var.resource_group_location
  account_tier              = var.account_tier
  account_replication_type  = var.account_replication_type
  enable_https_traffic_only = var.enable_https_traffic_only
  account_kind              = var.account_kind
  is_hns_enabled            = var.is_hns_enabled
  #allow_blob_public_access  = var.allow_blob_public_access
  min_tls_version           = "TLS1_2"
  #enable_advanced_threat_protection = var.enable_advanced_threat_protection #only works on BlobStorage not Storage or StorageV2
  large_file_share_enabled  = var.large_file_share_enabled

  dynamic "blob_properties" {
    for_each = var.delete_retention_policy_days == null ? [] : tolist([var.delete_retention_policy_days])
    content {
      delete_retention_policy {
        days = var.delete_retention_policy_days
      }
    }
  }

  tags = var.tags

  network_rules {
    default_action             = var.network_rule_default_action
    ip_rules                   = var.kpmg_nat_ip_list
    virtual_network_subnet_ids = var.virtual_network_subnet_ids

    dynamic "private_link_access" {
    for_each = var.private_link_accesses
    content {
        endpoint_resource_id   = private_link_access.value
      }
    }
  }

  dynamic "azure_files_authentication" {
    for_each = var.azure_files_authentication_directory_type == null ? [] : tolist([var.azure_files_authentication_directory_type])
    content {
        directory_type         = var.azure_files_authentication_directory_type
      }
  }
}