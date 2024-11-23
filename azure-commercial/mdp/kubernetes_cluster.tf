resource "azuread_group" "mdp_aks_admin" {
  name = "mdp-${var.application_acronym}-aks-admins-${var.environment_acronym}"
}



locals {
  node_resource_group = "RGP-${upper(var.location_acronym)}-${upper(var.application_acronym)}-AKS-NODE-${upper(var.environment_acronym)}"
  aks_resource_group  = "RGP-${upper(var.location_acronym)}-${upper(var.application_acronym)}-${upper(var.environment_acronym)}"
  aks_cluster_name    = "aks-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
}


# AAD Group for AKS Cluster Admins

resource "azurerm_kubernetes_cluster" "aks_mdp" {
  name                    = "aks-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name     = module.mdp_rg_main.resource_group_name
  location                = module.mdp_rg_main.resource_group_location
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
    vnet_subnet_id      = module.mdp_aks_subnet.subnet_id
    enable_auto_scaling = var.aks_default_auto_scaling
    type                = var.aks_default_pool_type
    availability_zones  = var.aks_default_avail_zones
  }

  role_based_access_control {
    azure_active_directory {
      managed                = true
      admin_group_object_ids = ["${azuread_group.mdp_aks_admin.id}"]
    }
    enabled = true
  }

  addon_profile {
    kube_dashboard {
      enabled = false
    }

    http_application_routing {
      enabled = true
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

  #  depends_on = [azurerm_subnet_route_table_association.mdp_aks_route_association[0]]

}

# We need to link the cluster's DNS Zone to the DNS server's Vnet since we use custom DNS servers on our Vnet
# See: https://docs.microsoft.com/en-us/azure/aks/private-clusters
#resource "null_resource" "dns_zone_link" {
#  count = var.environment_acronym == "pd" ? 0 : 1 # Don't change this because we are deploying AKS to the core VNet, where the custom DNS servers are in

# provisioner "local-exec" {
#  command     = 'dns_zone_link.ps1' -DNS_VNET ${var.dns_vnet} -NODE_RGP ${local.node_resource_group}
# interpreter = ["pwsh", "-Command"]
#}
#}


resource "null_resource" "dns_zone_link_sh" {

  provisioner "local-exec" {
    interpreter = ["bash"]
    command     = "dns_zone_link.sh"

    environment = {
      DNS_VNET            = "${var.DNS_VNET}"
      AKS_RESOURCE_GROUP  = local.aks_resource_group
      AKS_CLUSTER_NAME    = local.aks_cluster_name
      NODE_RESOURCE_GROUP = local.node_resource_group
    }
  }
  depends_on = [
    azurerm_kubernetes_cluster.aks_mdp,
    azurerm_kubernetes_cluster_node_pool.windows_agent_pool
  ]
}

# Network Contributor
resource "azurerm_role_assignment" "aks_mdp_network" {
  scope                = data.azurerm_subscription.current.id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_kubernetes_cluster.aks_mdp.identity.0.principal_id
}

# ACRPull
resource "azurerm_role_assignment" "aks_mdp_acrpull" {
  scope                = azurerm_container_registry.mdpacr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.aks_mdp.identity.0.principal_id
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
  scope                = module.mdp_rg_main.resource_group_id
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

## Managed Identity Operator (over the mdp KVL)
#resource "azurerm_role_assignment" "mdp_kvl_mio" {
#  scope                = module.mdp_rg_main.resource_group_id
#  role_definition_name = "Managed Identity Operator"
#  principal_id         = data.azurerm_user_assigned_identity.agentpool.principal_id
#
#  # TF will perpetually recreate since Scope and Principal ID (two attributes that force recreation) are read from a data source
#  lifecycle {
#    ignore_changes = [
#        principal_id,
#        scope
#    ]
#  }
#}

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
  scope                = module.mdp_rg_main.resource_group_id
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

resource "azurerm_monitor_diagnostic_setting" "aks_mdp_diag" {

  name                       = "mdp-aks-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}-diag"
  target_resource_id         = azurerm_kubernetes_cluster.aks_mdp.id
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
  log {
    category = "cloud-controller-manager"
    enabled  = false

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
      log
    ]
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "windows_agent_pool" {


  name                  = var.aks_win_node_pool_name
  node_count            = var.aks_win_node_count
  vm_size               = var.aks_win_node_size
  vnet_subnet_id        = module.mdp_aks_subnet.subnet_id
  enable_auto_scaling   = var.aks_win_auto_scaling
  availability_zones    = var.aks_win_avail_zones
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_mdp.id
  os_type               = "Windows"
}


