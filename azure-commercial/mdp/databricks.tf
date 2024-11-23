resource "azurerm_databricks_workspace" "mdp_adb" {
  location                              = module.mdp_rg_main.resource_group_location
  name                                  = lower("adb-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}")
  resource_group_name                   = module.mdp_rg_main.resource_group_name
  sku                                   = var.databricks.workspace.sku
#  public_network_access_enabled         = false
#  network_security_group_rules_required = "NoAzureServiceRules"
  custom_parameters {
    no_public_ip        = true
    public_subnet_name  = module.mdp_subnet_adb_pub.subnet_name
    public_subnet_network_security_group_association_id = module.mdp_nsg_association_databricks_public.network_security_group_subnet_association_id
    private_subnet_name = module.mdp_subnet_adb_private.subnet_name
    private_subnet_network_security_group_association_id = module.mdp_nsg_association_databricks_private.network_security_group_subnet_association_id
    virtual_network_id  = module.mdp_vnet_main.virtual_network_id
  }
  tags = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "mdp_adb_logging" {
  name                       = "dbfs-Logs"
  target_resource_id         = azurerm_databricks_workspace.mdp_adb.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.spoke_law.id

  log {
    category = "RemoteHistoryService"
    enabled  = false

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  log {
    category = "sqlPermissions"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = true
    }
  }
  log {
    category = "accounts"
    enabled  = true

    retention_policy {
      days = 0
      enabled = true
    }
  }
  log {
    category = "dbfs"
    enabled  = true
  
  retention_policy {
    days    =  0
    enabled = false 
  }
}


log {
    category = "notebook"
    enabled  = true

    retention_policy {
      days = 0
      enabled = true
    }
  }

log {
    category = "secrets"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = true
    }
  }

log {
    category = "workspace"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = true
    }
  }
  

log {
  category = "jobs"
  enabled  = true

  retention_policy {
    days = 0
    enabled = true
  }
}

log {
  category = "clusters"
  enabled  = true

  retention_policy {
    days = 0
    enabled = true
    }
  }

  log {
  category = "featureStore"
  enabled  = false

  retention_policy {
    days = 0
    enabled = false
    }
  }

  log {
  category = "genie"
  enabled  = false

  retention_policy {
    days = 0
    enabled = false
    }
  }

  log {
  category = "globalInitScripts"
  enabled  = false

  retention_policy {
    days = 0
    enabled = false
    }
  }

  log {
  category = "iamRole"
  enabled  = false

  retention_policy {
    days = 0
    enabled = false
    }
  }

  log {
  category = "mlflowAcledArtifact"
  enabled  = false

  retention_policy {
    days = 0
    enabled = false
    }
  }

  log {
  category = "mlflowExperiment"
  enabled  = false

  retention_policy {
    days = 0
    enabled = false
    }
  }
  

  
log {
  category = "instancePools"
  enabled  = true

  retention_policy {
    days = 0
    enabled = true
  }
}
log {
    category = "sqlanalytics"
    enabled  = false

    retention_policy {
      days    = 0
      enabled = false
    }
  }

log {
    category = "ssh"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = true
    }
  }
/*
 metric {
    category = "AllMetrics"

    retention_policy {
      enabled = false
    }
  }
  */

  lifecycle {
    ignore_changes = [log]
  }
}
