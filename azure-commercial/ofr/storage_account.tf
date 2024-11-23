resource "azurerm_storage_account" "ofr" {
  name                      = "sto${var.location_acronym}${var.application_acronym}${var.environment_acronym}"
  resource_group_name       = azurerm_resource_group.ofr.name
  location                  = azurerm_resource_group.ofr.location
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  enable_https_traffic_only = true
  account_kind              = "StorageV2"
  is_hns_enabled            = false
  min_tls_version           = "TLS1_2"

  blob_properties {
    delete_retention_policy {
      days = 7
    }
  }

  tags = var.tags

  network_rules {
    default_action             = "Deny"
    ip_rules                   = ["199.207.253.96","199.207.253.101","199.206.0.5"]
    virtual_network_subnet_ids = [azurerm_subnet.agw.id, azurerm_subnet.build.id, azurerm_subnet.app.id, var.ase_subnet_id, var.build_agent_subnet_id, var.aks_agent_subnet_id]
  }
}


resource "azurerm_role_assignment" "spn_devops" {
  scope                = azurerm_storage_account.ofr.id
  role_definition_name = "Owner"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_storage_share" "ofrshare" {
  name                 = "${var.application_acronym}share${var.environment_acronym}"
  storage_account_name = azurerm_storage_account.ofr.name
  quota                = 50
}