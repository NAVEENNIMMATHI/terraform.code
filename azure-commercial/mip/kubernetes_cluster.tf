locals {
  node_resource_group = "RGP-${upper(var.location_acronym)}-${upper(var.application_acronym)}-${upper(var.client)}-AKS-NODE-${upper(var.environment_acronym)}"
  aks_resource_group  = module.mathworks_rg_client.resource_group_name
  aks_cluster_name    = "aks-${var.location_acronym}-${var.application_acronym}-${var.client}-${var.environment_acronym}"
}

# AKS Cluster
resource "azurerm_kubernetes_cluster" "aks_mip" {
  name                    = local.aks_cluster_name
  resource_group_name     = module.mathworks_rg_client.resource_group_name
  location                = module.mathworks_rg_client.resource_group_location
  dns_prefix              = "aks-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}-dns"
  kubernetes_version      = var.aks_version
  private_cluster_enabled = true
  node_resource_group     = local.node_resource_group

  tags = var.tags

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name                = var.aks_default_node_pool_name
    node_count          = var.aks_default_node_count
    vm_size             = var.aks_default_node_size
    vnet_subnet_id      = module.subnet_aks.subnet_id
    enable_auto_scaling = var.aks_default_auto_scaling
    type                = var.aks_default_pool_type
    availability_zones  = var.aks_default_avail_zones
  }

  role_based_access_control {
    azure_active_directory {
      managed                = true
      admin_group_object_ids = ["${azuread_group.aad_mip_cluster_admin.id}"]
    }
    enabled = true
  }

  addon_profile {
    kube_dashboard {
      enabled = false
    }

    http_application_routing {
      enabled = false
    }

    oms_agent {
      enabled                    = true
      log_analytics_workspace_id = data.azurerm_log_analytics_workspace.spoke_law.id
    }

    azure_policy {
      enabled = true
    }

    ingress_application_gateway {
      enabled    = true
      gateway_id = azurerm_application_gateway.this.id
    }
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "calico"
    outbound_type  = "userDefinedRouting"
  }
}


# Network Contributor
resource "azurerm_role_assignment" "aks_mip_network" {
  scope                = data.azurerm_subscription.current.id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_kubernetes_cluster.aks_mip.identity.0.principal_id
  #principal_id          = "9b6aa630-4529-4d4f-9b51-bf7def3b821c"
}

# ACRPull
resource "azurerm_role_assignment" "aks_mip_acrpull" {
  scope                = azurerm_container_registry.mipacr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.aks_mip.identity.0.principal_id
  #principal_id          = "9b6aa630-4529-4d4f-9b51-bf7def3b821c"
}

resource "azurerm_role_assignment" "aks_mip_identity_acrpull" {
  scope                = azurerm_container_registry.mipacr.id
  role_definition_name = "AcrPull"
  principal_id         = data.azurerm_user_assigned_identity.agentpool.principal_id
  #principal_id          = "9b6aa630-4529-4d4f-9b51-bf7def3b821c"
    # TF will perpetually recreate since Scope and Principal ID (two attributes that force recreation) are read from a data source
  lifecycle {
    ignore_changes = [
      principal_id,
      scope
    ]
  }
}

# AGIC
resource "azurerm_role_assignment" "aks_agic_identity_agw_contributor" {
  scope                = azurerm_application_gateway.this.id
  role_definition_name = "Contributor"
  principal_id         = data.azurerm_user_assigned_identity.agic_identity.principal_id
  
    # TF will perpetually recreate since Scope and Principal ID (two attributes that force recreation) are read from a data source
  lifecycle {
    ignore_changes = [
      principal_id,
      scope
    ]
  }
}

resource "azurerm_role_assignment" "aks_agic_identity_agw_mio" {
  scope                = azurerm_application_gateway.this.id
  role_definition_name = "Managed Identity Operator"
  principal_id         = data.azurerm_user_assigned_identity.agic_identity.principal_id
  
    # TF will perpetually recreate since Scope and Principal ID (two attributes that force recreation) are read from a data source
  lifecycle {
    ignore_changes = [
      principal_id,
      scope
    ]
  }
}

resource "azurerm_role_assignment" "aks_agic_identity_rgp_mio" {
  scope                = module.mathworks_rg_shared.resource_group_id
  role_definition_name = "Managed Identity Operator"
  principal_id         = data.azurerm_user_assigned_identity.agic_identity.principal_id
  
    # TF will perpetually recreate since Scope and Principal ID (two attributes that force recreation) are read from a data source
  lifecycle {
    ignore_changes = [
      principal_id,
      scope
    ]
  }
}

resource "azurerm_role_assignment" "aks_agic_identity_agw_rg_reader" {
  scope                = module.mathworks_rg_shared.resource_group_id
  role_definition_name = "Reader"
  principal_id         = data.azurerm_user_assigned_identity.agic_identity.principal_id
  
    # TF will perpetually recreate since Scope and Principal ID (two attributes that force recreation) are read from a data source
  lifecycle {
    ignore_changes = [
      principal_id,
      scope
    ]
  }
}

# Managed Identity Operator (over the node RGP)
resource "azurerm_role_assignment" "node_rgp_mio" {
  scope                = data.azurerm_resource_group.aks_node.id
  role_definition_name = "Managed Identity Operator"
  principal_id         = data.azurerm_user_assigned_identity.agentpool.principal_id

  # TF will perpetually recreate since Scope and Principal ID (two attributes that force recreation) are read from a data source
  lifecycle {
    ignore_changes = [
      principal_id,
      scope
    ]
  }
}

# Managed Identity Operator (over the AKS RGP)
resource "azurerm_role_assignment" "aks_rgp_mio" {
  scope                = module.mathworks_rg_client.resource_group_id
  role_definition_name = "Managed Identity Operator"
  principal_id         = data.azurerm_user_assigned_identity.agentpool.principal_id

  # TF will perpetually recreate since Scope and Principal ID (two attributes that force recreation) are read from a data source
  lifecycle {
    ignore_changes = [
      principal_id,
      scope
    ]
  }
}

# # Managed Identity Operator (over the mdp KVL)
# resource "azurerm_role_assignment" "mip_kvl_mio" {
#   scope                = module.mathworks_rg_client.resource_group_id
#   role_definition_name = "Managed Identity Operator"
#   principal_id         = data.azurerm_user_assigned_identity.agentpool.principal_id

#   # TF will perpetually recreate since Scope and Principal ID (two attributes that force recreation) are read from a data source
#   lifecycle {
#     ignore_changes = [
#       principal_id,
#       scope
#     ]
#   }
# }

# Virtual Machine Contributor
resource "azurerm_role_assignment" "node_rgp_vmc" {
  scope                = data.azurerm_resource_group.aks_node.id
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
resource "azurerm_role_assignment" "aks_rgp_vmc" {
  scope                = module.mathworks_rg_client.resource_group_id
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

resource "azurerm_monitor_diagnostic_setting" "aks_mip_diag" {
  name                       = "aks-${var.location_acronym}-${var.application_acronym}-${var.client}-${var.environment_acronym}-diag"
  target_resource_id         = azurerm_kubernetes_cluster.aks_mip.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.spoke_law.id
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
}

resource "azurerm_kubernetes_cluster_node_pool" "linux_agent_pool" {
  name                  = var.aks_lin_node_pool_name
  node_count            = var.aks_lin_node_count
  vm_size               = var.aks_lin_node_size
  vnet_subnet_id        = module.subnet_aks.subnet_id
  enable_auto_scaling   = var.aks_lin_auto_scaling
  availability_zones    = var.aks_lin_avail_zones
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_mip.id
  os_type               = "Linux"
}