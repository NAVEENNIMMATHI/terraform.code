resource "azurerm_kubernetes_cluster" "eccm_akscluster" {
  name                    = "aks-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  location                = module.eccm_rg.resource_group_location
  resource_group_name     = module.eccm_rg.resource_group_name
  dns_prefix              = "aks-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}-dns"
  private_cluster_enabled = true
  kubernetes_version      = var.aks_version
  node_resource_group     = "RGP-${upper(var.location_acronym)}-${upper(var.application_acronym)}-AKS-NODE-${upper(var.environment_acronym)}"
  
  tags = var.tags

  default_node_pool {
    name                = var.aks_default_node_pool_name
    node_count          = var.aks_default_node_count
    vm_size             = var.aks_default_node_size
    vnet_subnet_id      = module.eccm_aks_subnet.subnet_id
    enable_auto_scaling = var.aks_default_auto_scaling
    type                = var.aks_default_pool_type
    # availability_zones  = var.aks_default_avail_zones
  }

  identity {
    type = "SystemAssigned"
  }
  
  # role_based_access_control {
  #   azure_active_directory {
  #     managed                = true
  #     admin_group_object_ids = ["${azuread_group.aks_admins.id}"]
  #   }
  #   enabled = true
  # }

  # addon_profile {
  #   kube_dashboard {
  #     enabled = false
  #   }

  #   http_application_routing {
  #     enabled = false
  #   }

  #   oms_agent {
  #     enabled                    = true
  #     log_analytics_workspace_id = data.azurerm_log_analytics_workspace.spoke_law.id
  #   }

  #   azure_policy {
  #     enabled = true
  #   }

  #   /*ingress_application_gateway {
  #     enabled    = true
  #     gateway_id = azurerm_application_gateway.this.id
  #   }*/
  # }

  network_profile {
    network_plugin = "azure"
    network_policy = "calico"
    outbound_type  = "userDefinedRouting"
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "node_agent_pool" {
  name                  = var.aks_lin_node_pool_name
  node_count            = var.aks_lin_node_count
  vm_size               = var.aks_lin_node_size
  vnet_subnet_id        = module.eccm_aks_subnet.subnet_id
  enable_auto_scaling   = var.aks_lin_auto_scaling
  # availability_zones    = var.aks_lin_avail_zones
  kubernetes_cluster_id = azurerm_kubernetes_cluster.eccm_akscluster.id
  os_type               = "Linux"
}



resource "azurerm_monitor_diagnostic_setting" "aks_mip_diag" {
  name                       = "aks-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}-diag"
  target_resource_id         = azurerm_kubernetes_cluster.eccm_akscluster.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.spoke_law.id
  log_analytics_destination_type = "AzureDiagnostics"
  log {
    category = "kube-apiserver"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  log {
    category = "kube-controller-manager"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  log {
    category = "kube-scheduler"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  log {
    category = "kube-audit"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  log {
    category = "kube-audit-admin"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  log {
    category = "guard"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  log {
    category = "cluster-autoscaler"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      days    = 0
      enabled = false
    }
  }
  lifecycle {
     ignore_changes = [
       log_analytics_destination_type
     ]
   }
}



# Virtual Machine Contributor
resource "azurerm_role_assignment" "aks_rgp_vmc" {
  scope                = module.eccm_rg.resource_group_id
  role_definition_name = "Virtual Machine Contributor"
  principal_id         = data.azurerm_user_assigned_identity.agentpool.principal_id

  # TF will perpetually recreate since Scope and Principal ID (two attributes that force recreation) are read from a data source
  lifecycle {
    ignore_changes = [
      principal_id,
      scope
    ]
  }
}

# Virtual Machine Contributor
resource "azurerm_role_assignment" "node_rgp_vmc" {
  scope                = module.eccm_rg.resource_group_id
  role_definition_name = "Virtual Machine Contributor"
  principal_id         = data.azurerm_user_assigned_identity.agentpool.principal_id

  # TF will perpetually recreate since Scope and Principal ID (two attributes that force recreation) are read from a data source
  lifecycle {
    ignore_changes = [
      principal_id,
      scope
    ]
  }
}

# ACRPull
resource "azurerm_role_assignment" "aks_eccm_acrpull" {
  scope                = azurerm_container_registry.eccmacr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.eccm_akscluster.identity.0.principal_id
  #principal_id          = "9b6aa630-4529-4d4f-9b51-bf7def3b821c"
}

resource "azurerm_role_assignment" "aks_mip_identity_acrpull" {
  scope                = azurerm_container_registry.eccmacr.id
  role_definition_name = "AcrPull"
  principal_id         = data.azurerm_user_assigned_identity.agentpool.principal_id
  lifecycle {
    ignore_changes = [
      principal_id,
      scope
    ]
  }
}
