/*

To promote the cluster to production we need to:
    - Remove the count attribute from all resources related to the AKS deployment (subnet, route tables, NSG, NSG rules, etc.)
    - Update references to resources that were previously created with count (i.e. no need to index a resource if there is no count attribute)

*/

locals {
  node_resource_group_paired = "RGP-${upper(var.location_acronym_paired)}-${upper(var.application_acronym)}-AKS-NODE-${upper(var.environment_acronym)}"
}

# AAD Group for AKS Cluster Admins
resource "azuread_group" "aks_core_ad_paired_group" {
  count = var.environment_acronym == "dv" || var.environment_acronym == "pd" ? 1 : 0

  name  = "aks-${var.location_acronym_paired}-${var.application_acronym}-admins-${var.environment_acronym}"
}

resource "azurerm_kubernetes_cluster" "aks_core_paired" {
  count = var.environment_acronym == "dv" || var.environment_acronym == "pd" ? 1 : 0

  name                            = "aks-${var.location_acronym_paired}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name             = azurerm_resource_group.aks_paired[0].name # indexing since resource group is created with count
  location                        = azurerm_resource_group.aks_paired[0].location
  dns_prefix                      = "aks-${var.location_acronym_paired}-${var.application_acronym}-${var.environment_acronym}-dns"
  kubernetes_version              = var.aks_version_paired # Control plane's kubernetes version
  private_cluster_enabled         = true
  node_resource_group             = local.node_resource_group_paired
  sku_tier                        = "Paid" # AKS recommends use of Uptime SLA in production workloads to ensure availability of control plane components

  tags = var.tags

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name                 = var.aks_default_node_pool_name
    node_count           = var.aks_default_node_count
    max_count            = var.aks_default_max_count
    min_count            = var.aks_default_min_count
    vm_size              = var.aks_default_node_size
    vnet_subnet_id       = azurerm_subnet.aks_paired[0].id # indexing since subnet is created with count
    enable_auto_scaling  = var.aks_default_auto_scaling
    type                 = var.aks_default_pool_type
    os_disk_type         = var.environment_acronym == "uat" || var.environment_acronym == "pd" ? "Managed" : "Ephemeral"
    os_disk_size_gb      = var.aks_os_disk_size
    orchestrator_version = var.aks_version_paired # Node pool's kubernetes version
  }

  role_based_access_control {
    azure_active_directory {
      managed = true
      admin_group_object_ids = ["${azuread_group.aks_core_ad_paired_group[0].id}"] # indexing since AD group is created with count
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
      enabled = var.environment_acronym == "uat" || var.environment_acronym == "pd" ? true : false
      log_analytics_workspace_id = var.environment_acronym == "uat" || var.environment_acronym == "pd" ? data.azurerm_log_analytics_workspace.hub.id : null
    }

    azure_policy {
      enabled = true
    }

    // ingress_application_gateway {
    //   enabled = true
    //   gateway_id = azurerm_application_gateway.aks[0].id
    // }

  }

  network_profile {
    network_plugin  = "azure"
    network_policy  = "calico"
    outbound_type   = "userDefinedRouting"
  }

    depends_on = [
        azurerm_subnet_route_table_association.aks_paired_rt[0],
        azurerm_subnet.aks_paired[0]
    ]
}

# We need to link the cluster's DNS Zone to the DNS server's Vnet since we use custom DNS servers on our Vnet
# See: https://docs.microsoft.com/en-us/azure/aks/private-clusters
resource "null_resource" "dns_zone_link_paired" {
  count = var.environment_acronym == "dv" || var.environment_acronym == "pd" ? 1 : 0

     provisioner "local-exec" {
     interpreter = ["pwsh", "-Command"]
     command     = "./dns_zone_link.ps1 -DNS_VNET ${var.dns_vnet_paired} -NODE_RGP ${local.node_resource_group_paired}"
    } 

   depends_on = [azurerm_kubernetes_cluster.aks_core_paired[0]]
}

# Network Contributor
resource "azurerm_role_assignment" "aks_core_network_paired" {
  count = var.environment_acronym == "dv" || var.environment_acronym == "pd" ? 1 : 0
  scope                = data.azurerm_subscription.current.id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_kubernetes_cluster.aks_core_paired[0].identity.0.principal_id # indexing since aks_core is created with count
}

# ACRPull
resource "azurerm_role_assignment" "aks_core_acrpull_paired" {
  count = var.environment_acronym == "dv" || var.environment_acronym == "pd" ? 1 : 0
  scope                = module.container_registry.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.aks_core_paired[0].identity.0.principal_id # indexing since aks_core is created with count
}

# Managed Identity Operator (over the node RGP)
resource "azurerm_role_assignment" "node_rgp_mio_paired" {
  count = var.environment_acronym == "dv" || var.environment_acronym == "pd" ? 1 : 0
  scope                = data.azurerm_resource_group.aks_node_paired[0].id
  role_definition_name = "Managed Identity Operator"
  principal_id         = data.azurerm_user_assigned_identity.agentpool_paired[0].principal_id # indexing since aks_core is created with count

  # TF will perpetually recreate since Scope and Principal ID (two attributes that force recreation) are read from a data source
  lifecycle {
    ignore_changes = [
        principal_id,
        scope
    ]
  }
}

# Managed Identity Operator (over the AKS RGP)
resource "azurerm_role_assignment" "aks_rgp_mio_paired" {
  count = var.environment_acronym == "dv" || var.environment_acronym == "pd" ? 1 : 0
  scope                = azurerm_resource_group.aks_paired[0].id
  role_definition_name = "Managed Identity Operator"
  principal_id         = data.azurerm_user_assigned_identity.agentpool_paired[0].principal_id # indexing since aks_core is created with count

  # TF will perpetually recreate since Scope and Principal ID (two attributes that force recreation) are read from a data source
  lifecycle {
    ignore_changes = [
        principal_id,
        scope
    ]
  }
}

# Managed Identity Operator (over the core KVL)
resource "azurerm_role_assignment" "core_kvl_mio_paired" {
  count = var.environment_acronym == "dv" || var.environment_acronym == "pd" ? 1 : 0
  scope                = data.azurerm_resource_group.core_kvl_paired[0].id
  role_definition_name = "Managed Identity Operator"
  principal_id         = data.azurerm_user_assigned_identity.agentpool_paired[0].principal_id # indexing since aks_core is created with count

  # TF will perpetually recreate since Scope and Principal ID (two attributes that force recreation) are read from a data source
  lifecycle {
    ignore_changes = [
        principal_id,
        scope
    ]
  }
}

# Virtual Machine Contributor
resource "azurerm_role_assignment" "node_rgp_vmc_paired" {
  count = var.environment_acronym == "dv" || var.environment_acronym == "pd" ? 1 : 0
  scope                = data.azurerm_resource_group.aks_node_paired[0].id
  role_definition_name = "Virtual Machine Contributor"
  principal_id         = data.azurerm_user_assigned_identity.agentpool_paired[0].principal_id # indexing since aks_core is created with count

  # TF will perpetually recreate since Scope and Principal ID (two attributes that force recreation) are read from a data source
  lifecycle {
    ignore_changes = [
        principal_id,
        scope
    ]
  }
}

# Virtual Machine Contributor
resource "azurerm_role_assignment" "aks_rgp_vmc_paired" {
  count = var.environment_acronym == "dv" || var.environment_acronym == "pd" ? 1 : 0
  scope                = azurerm_resource_group.aks_paired[0].id
  role_definition_name = "Virtual Machine Contributor"
  principal_id         = data.azurerm_user_assigned_identity.agentpool_paired[0].principal_id # indexing since aks_core is created with count

  # TF will perpetually recreate since Scope and Principal ID (two attributes that force recreation) are read from a data source
  lifecycle {
    ignore_changes = [
        principal_id,
        scope
    ]
  }
}

resource "azurerm_monitor_diagnostic_setting" "aks_core_diag_paired" {
  count = var.environment_acronym == "pd" ? 1 : 0

  name                       = "aks-${var.location_acronym_paired}-${var.application_acronym}-${var.environment_acronym}-diag"
  target_resource_id         = azurerm_kubernetes_cluster.aks_core_paired[0].id # indexing since aks_core is created with count
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.corelogs.id
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

  log {
    category = "csi-azuredisk-controller"
    enabled  = false

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  log {
    category = "csi-azurefile-controller"
    enabled  = false

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  log {
    category = "csi-snapshot-controller"
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
}

resource "azurerm_kubernetes_cluster_node_pool" "windows_agent_pool_paired" {
  count = var.environment_acronym == "dv" || var.environment_acronym == "pd" ? 1 : 0

  name                  = var.aks_win_node_pool_name
  node_count            = var.aks_win_node_count
  vm_size               = var.aks_win_node_size
  vnet_subnet_id        = azurerm_subnet.aks_paired[0].id # indexing since subnet is created with count
  enable_auto_scaling   = var.aks_win_auto_scaling
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_core_paired[0].id #indexing since cluster is created with count
  os_type               = "Windows"
  orchestrator_version  = var.aks_version_paired
}