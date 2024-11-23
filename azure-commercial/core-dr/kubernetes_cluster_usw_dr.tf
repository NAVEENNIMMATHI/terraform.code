/*

To promote the cluster to production we need to:
    - Remove the count attribute from all resources related to the AKS deployment (subnet, route tables, NSG, NSG rules, etc.)
    - Update references to resources that were previously created with count (i.e. no need to index a resource if there is no count attribute)

*/

locals {
  usw_node_resource_group     = var.aks_usw["usw_node_resource_group"]
  usw_application_acronym_aks = var.aks_usw["usw_application_acronym_aks"]
  usw_environment_acronym_aks = var.aks_usw["usw_environment_acronym_aks"]
  usw_location_acronym_aks    = var.aks_usw["usw_location_acronym_aks"]
}

# AAD Group for AKS Cluster Admins
resource "azuread_group" "aks_core_dr_usw_ad_group" {
  count = 1
  name  = "aks-${local.usw_application_acronym_aks}-admins-${local.usw_environment_acronym_aks}"
}

resource "azurerm_kubernetes_cluster" "aks_core_dr_usw" {
  count                           = 1
  name                            = "aks-${local.usw_location_acronym_aks}-${local.usw_application_acronym_aks}-${local.usw_environment_acronym_aks}"
  resource_group_name             = var.aks_usw["aks_rg_name"]
  location                        = var.aks_usw["location"]
  dns_prefix                      = "aks-${local.usw_location_acronym_aks}-${local.usw_application_acronym_aks}-${local.usw_environment_acronym_aks}-dns"
  kubernetes_version              = var.aks_usw["aks_version"] # Control plane's kubernetes version
  private_cluster_enabled         = false
  node_resource_group             = local.usw_node_resource_group
  sku_tier                        = "Paid" # AKS recommends use of Uptime SLA in production workloads to ensure availability of control plane components
  api_server_authorized_ip_ranges = []
  enable_pod_security_policy      = false
  local_account_disabled          = false
  //private_link_enabled            = false


  tags = var.aks_tags

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    enable_host_encryption       = false
    enable_node_public_ip        = false
    fips_enabled                 = false
    node_taints                  = []
    only_critical_addons_enabled = false
    //os_sku                       = "Ubuntu"
    tags                         = var.aks_tags
    name                         = var.aks_usw["aks_default_node_pool_name"]
    node_count                   = var.aks_usw["aks_default_node_count"]
    max_count                    = var.aks_usw["aks_default_max_count"]
    min_count                    = var.aks_usw["aks_default_min_count"]
    vm_size                      = var.aks_usw["aks_default_node_size"]
    vnet_subnet_id               = "/subscriptions/da272037-3e65-4b59-b94c-b923105b56c5/resourceGroups/RGP-USW-CORE-DR-DV/providers/Microsoft.Network/virtualNetworks/vnt-usw-aks-dr-dv/subnets/default"
    enable_auto_scaling          = var.aks_usw["aks_default_auto_scaling"]
    type                         = var.aks_usw["aks_default_pool_type"]
    availability_zones           = ["1", "2", "3"]
    //zones                = ["1", "2", "3"]
    os_disk_type         = var.aks_usw["aks_os_dist_type"]
    os_disk_size_gb      = var.aks_usw["aks_os_disk_size"]
    orchestrator_version = var.aks_usw["aks_version"] # Node pool's kubernetes version
  }

  role_based_access_control {
    azure_active_directory {
      managed                = true
      admin_group_object_ids = ["${azuread_group.aks_core_dr_usw_ad_group[0].id}"] # indexing since AD group is created with count
    }
    enabled = true
  }

  addon_profile {
 
    kube_dashboard {
      enabled = false
    }

    http_application_routing {
      enabled                            = false
    }

    oms_agent {
      enabled                    = true
      log_analytics_workspace_id = "/subscriptions/da272037-3e65-4b59-b94c-b923105b56c5/resourceGroups/RGP-USW-CORE-DR-DV/providers/Microsoft.OperationalInsights/workspaces/law-usw-dr-dv"
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
    network_plugin    = "kubenet"
    network_policy    = "calico"
    outbound_type     = "loadBalancer"
    load_balancer_sku = "Standard"
  }

  #depends_on = [azurerm_subnet_route_table_association.aks[0]]

}

# We need to link the cluster's DNS Zone to the DNS server's Vnet since we use custom DNS servers on our Vnet
# See: https://docs.microsoft.com/en-us/azure/aks/private-clusters
// resource "null_resource" "dns_zone_link" {
//   count = var.environment_acronym == "pd" ? 0 : 1 # Don't change this because we are deploying AKS to the core VNet, where the custom DNS servers are in

//   provisioner "local-exec" {
//     interpreter = ["PowerShell", "-Command"]
//     command     = "PowerShell -file dns_zone_link.ps1 -DNS_VNET ${var.dns_vnet} -NODE_RGP ${local.usw_node_resource_group}"
//   }
// }

# Network Contributor
resource "azurerm_role_assignment" "aks_core_dr_usw_network" {
  count                = 1
  scope                = data.azurerm_subscription.current.id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_kubernetes_cluster.aks_core_dr_usw[0].identity.0.principal_id # indexing since aks_core is created with count
}

# ACRPull
// resource "azurerm_role_assignment" "aks_core_dr_usw_acrpull" {
//   count = 1
//   scope                = module.container_registry.id
//   role_definition_name = "AcrPull"
//   principal_id         = azurerm_kubernetes_cluster.aks_core_dr_usw[0].identity.0.principal_id # indexing since aks_core is created with count
// }

# Managed Identity Operator (over the node RGP)
// resource "azurerm_role_assignment" "node_rgp_mio" {
//   count = 1
//   scope                = data.azurerm_resource_group.aks_node[0].id
//   role_definition_name = "Managed Identity Operator"
//   principal_id         = data.azurerm_user_assigned_identity.agentpool[0].principal_id # indexing since aks_core is created with count

//   # TF will perpetually recreate since Scope and Principal ID (two attributes that force recreation) are read from a data source
//   lifecycle {
//     ignore_changes = [
//         principal_id,
//         scope
//     ]
//   }
// }

# Managed Identity Operator (over the AKS RGP)
// resource "azurerm_role_assignment" "aks_rgp_mio" {
//   count = 1
//   scope                = azurerm_resource_group.aks[0].id
//   role_definition_name = "Managed Identity Operator"
//   principal_id         = data.azurerm_user_assigned_identity.agentpool[0].principal_id # indexing since aks_core is created with count

//   # TF will perpetually recreate since Scope and Principal ID (two attributes that force recreation) are read from a data source
//   lifecycle {
//     ignore_changes = [
//         principal_id,
//         scope
//     ]
//   }
// }

# Managed Identity Operator (over the core KVL)
// resource "azurerm_role_assignment" "core_kvl_mio" {
//   count = 1
//   scope                = data.azurerm_resource_group.core_kvl.id
//   role_definition_name = "Managed Identity Operator"
//   principal_id         = data.azurerm_user_assigned_identity.agentpool[0].principal_id # indexing since aks_core is created with count

//   # TF will perpetually recreate since Scope and Principal ID (two attributes that force recreation) are read from a data source
//   lifecycle {
//     ignore_changes = [
//         principal_id,
//         scope
//     ]
//   }
// }

# Virtual Machine Contributor
// resource "azurerm_role_assignment" "node_rgp_vmc" {
//   count = 1
//   scope                = data.azurerm_resource_group.aks_node[0].id
//   role_definition_name = "Virtual Machine Contributor"
//   principal_id         = data.azurerm_user_assigned_identity.agentpool[0].principal_id # indexing since aks_core is created with count

//   # TF will perpetually recreate since Scope and Principal ID (two attributes that force recreation) are read from a data source
//   lifecycle {
//     ignore_changes = [
//         principal_id,
//         scope
//     ]
//   }
// }

# Virtual Machine Contributor
// resource "azurerm_role_assignment" "aks_rgp_vmc" {
//   count = 1
//   scope                = azurerm_resource_group.aks[0].id
//   role_definition_name = "Virtual Machine Contributor"
//   principal_id         = data.azurerm_user_assigned_identity.agentpool[0].principal_id # indexing since aks_core is created with count

//   # TF will perpetually recreate since Scope and Principal ID (two attributes that force recreation) are read from a data source
//   lifecycle {
//     ignore_changes = [
//         principal_id,
//         scope
//     ]
//   }
// }

// resource "azurerm_monitor_diagnostic_setting" "aks_core_diag" {
//   count = 1

//   name                       = "aks-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}-diag"
//   target_resource_id         = azurerm_kubernetes_cluster.aks_core_dr_usw[0].id # indexing since aks_core is created with count
//   log_analytics_workspace_id = data.azurerm_log_analytics_workspace.corelogs.id
//   log {
//     category = "kube-apiserver"
//     enabled  = true

//     retention_policy {
//       days    = 0
//       enabled = false
//     }
//   }

//   log {
//     category = "kube-controller-manager"
//     enabled  = true

//     retention_policy {
//       days    = 0
//       enabled = false
//     }
//   }

//   log {
//     category = "kube-scheduler"
//     enabled  = true

//     retention_policy {
//       days    = 0
//       enabled = false
//     }
//   }

//   log {
//     category = "kube-audit"
//     enabled  = true

//     retention_policy {
//       days    = 0
//       enabled = false
//     }
//   }

//   log {
//     category = "kube-audit-admin"
//     enabled  = true

//     retention_policy {
//       days    = 0
//       enabled = false
//     }
//   }

//   log {
//     category = "guard"
//     enabled  = true

//     retention_policy {
//       days    = 0
//       enabled = false
//     }
//   }

//   log {
//     category = "cluster-autoscaler"
//     enabled  = true

//     retention_policy {
//       days    = 0
//       enabled = false
//     }
//   }

//   log {
//     category = "cloud-controller-manager"
//     enabled  = false

//     retention_policy {
//       days    = 0
//       enabled = false
//     }
//   }

//   log {
//     category = "csi-azuredisk-controller"
//     enabled  = false

//     retention_policy {
//       days    = 0
//       enabled = false
//     }
//   }

//   log {
//     category = "csi-azurefile-controller"
//     enabled  = false

//     retention_policy {
//       days    = 0
//       enabled = false
//     }
//   }

//   log {
//     category = "csi-snapshot-controller"
//     enabled  = false

//     retention_policy {
//       days    = 0
//       enabled = false
//     }
//   }

//   metric {
//     category = "AllMetrics"

//     retention_policy {
//       days    = 0
//       enabled = false
//     }
//   }
// }

// resource "azurerm_kubernetes_cluster_node_pool" "windows_agent_pool" {
//   count = 1

//   name                  = var.aks_win_node_pool_name
//   node_count            = var.aks_win_node_count
//   vm_size               = var.aks_win_node_size
//   vnet_subnet_id        = azurerm_subnet.aks[0].id # indexing since subnet is created with count
//   enable_auto_scaling   = var.aks_win_auto_scaling
//   availability_zones    = var.aks_win_avail_zones
//   kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_core_dr_usw[0].id #indexing since cluster is created with count
//   os_type               = "Windows"
//   orchestrator_version  = var.aks_version
// }