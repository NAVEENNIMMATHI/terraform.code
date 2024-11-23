resource "azurerm_storage_account" "cspsa" {
  name                      = "sto${var.location_acronym}${var.application_acronym}${var.environment_acronym}"
  resource_group_name       = module.csp_rg_main.resource_group_name
  location                  = module.csp_rg_main.resource_group_location
  access_tier               = "Hot"
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "ZRS"
  enable_https_traffic_only = true
  is_hns_enabled            = true
  min_tls_version           = "TLS1_2"
  #infrastructure_encryption_enabled = true
  #allow_blob_public_access  = false

#  network_rules {
#   default_action = "Deny"
#    ip_rules       = setunion(var.kpmg_nat_ip_list, var.powerapps_whitelist_ips)
#  }

  tags = var.tags
}

resource "azurerm_advanced_threat_protection" "advanced_threat_protection" {
  target_resource_id = azurerm_storage_account.cspsa.id
  enabled            = true
}

resource "azurerm_role_assignment" "storageAccountRoleAssignment" {
  scope                = azurerm_storage_account.cspsa.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = data.azuread_service_principal.defaultpipeline.object_id
}

resource "azurerm_storage_container" "csp-sync" {
  name                  = "cspsynccontainer"
  storage_account_name  = azurerm_storage_account.cspsa.name
  container_access_type = "private"
}


resource "azurerm_monitor_diagnostic_setting" "csp_storage_diag" {
  name                       = "sto${var.location_acronym}${var.application_acronym}${var.environment_acronym}-diag"
  target_resource_id         = azurerm_storage_account.cspsa.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.spoke_law.id

  /*log {
    category = "StorageRead"
    enabled  = true
  }*/

  /*log {
    category = "StorageWrite"
    enabled  = true
  }*/

  /*log {
    category = "StorageDelete"
    enabled  = true
  }*/

  metric {
    category = "Transaction"
    enabled  = true
  }
}