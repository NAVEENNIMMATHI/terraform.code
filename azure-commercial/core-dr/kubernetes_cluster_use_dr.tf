/*

To promote the cluster to production we need to:
    - Remove the count attribute from all resources related to the AKS deployment (subnet, route tables, NSG, NSG rules, etc.)
    - Update references to resources that were previously created with count (i.e. no need to index a resource if there is no count attribute)

*/

locals {
  node_resource_group     = var.aks["aks_node_rg_name"]
  application_acronym_aks = var.aks["application_acronym_aks"]
  environment_acronym_aks = var.aks["environment_acronym_aks"]
  location_acronym_aks    = var.aks["location_acronym_aks"]
}

# AAD Group for AKS Cluster Admins
resource "azuread_group" "aks_core_ad_group" {
  count = 1
  name  = "aks-${local.application_acronym_aks}-admins-${local.environment_acronym_aks}"
}

resource "azurerm_kubernetes_cluster" "aks_core" {
  count                           = 1
  name                            = "aks-${local.location_acronym_aks}-${local.application_acronym_aks}-${local.environment_acronym_aks}"
  resource_group_name             = var.aks["aks_rg_name"]
  location                        = var.aks["location"]
  dns_prefix                      = "aks-${local.location_acronym_aks}-${local.application_acronym_aks}-${local.environment_acronym_aks}-dns"
  kubernetes_version              = var.aks["aks_version"] # Control plane's kubernetes version
  private_cluster_enabled         = false
  node_resource_group             = local.node_resource_group
  sku_tier                        = "Paid" # AKS recommends use of Uptime SLA in production workloads to ensure availability of control plane components
  api_server_authorized_ip_ranges = []
  enable_pod_security_policy      = false
  local_account_disabled          = false
  //private_link_enabled            = false


  tags = var.aks_tags

  identity {
    type = "SystemAssigned"
  }

  // auto_scaler_profile {
  //   balance_similar_node_groups      = false
  //   empty_bulk_delete_max            = "10"
  //   expander                         = "random"
  //   max_graceful_termination_sec     = "600"
  //   max_node_provisioning_time       = "15m"
  //   max_unready_nodes                = 3
  //   max_unready_percentage           = 45
  //   new_pod_scale_up_delay           = "0s"
  //   scale_down_delay_after_add       = "10m"
  //   scale_down_delay_after_delete    = "10s"
  //   scale_down_delay_after_failure   = "3m"
  //   scale_down_unneeded              = "10m"
  //   scale_down_unready               = "20m"
  //   scale_down_utilization_threshold = "0.5"
  //   scan_interval                    = "10s"
  //   skip_nodes_with_local_storage    = false
  //   skip_nodes_with_system_pods      = true
  // }

  default_node_pool {
    enable_host_encryption       = false
    enable_node_public_ip        = false
    fips_enabled                 = false
    node_taints                  = []
    only_critical_addons_enabled = false
    //os_sku                       = "Ubuntu"
    tags                         = var.aks_tags
    name                         = var.aks["aks_default_node_pool_name"]
    node_count                   = var.aks["aks_default_node_count"]
    max_count                    = var.aks["aks_default_max_count"]
    min_count                    = var.aks["aks_default_min_count"]
    vm_size                      = var.aks["aks_default_node_size"]
    vnet_subnet_id               = "/subscriptions/da272037-3e65-4b59-b94c-b923105b56c5/resourceGroups/MC_RGP-USW-CORE-DR-DV_aks-use-dr-dv_eastus/providers/Microsoft.Network/virtualNetworks/aks-vnet-11773182/subnets/aks-subnet"
    enable_auto_scaling          = var.aks["aks_default_auto_scaling"]
    type                         = var.aks["aks_default_pool_type"]
    availability_zones           = ["1", "2", "3"]
    //zones                = ["1", "2", "3"]
    os_disk_type         = var.aks["aks_os_dist_type"]
    os_disk_size_gb      = var.aks["aks_os_disk_size"]
    orchestrator_version = var.aks["aks_version"] # Node pool's kubernetes version
  }

  role_based_access_control {
    azure_active_directory {
      managed                = true
      admin_group_object_ids = ["${azuread_group.aks_core_ad_group[0].id}"] # indexing since AD group is created with count
    }
    enabled = true
  }

  addon_profile {
    // azure_keyvault_secrets_provider {
    //   enabled                 = false
    //   secret_identity         = []
    //   secret_rotation_enabled = false
    // }

    kube_dashboard {
      enabled = false
    }

    http_application_routing {
      enabled                            = false
     // http_application_routing_zone_name = ""
    }

    oms_agent {
      enabled                    = true
      log_analytics_workspace_id = var.aks["log_analtyics_workspace_id_dr"]
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

    // load_balancer_profile {
    //   effective_outbound_ips    = ["/subscriptions/da272037-3e65-4b59-b94c-b923105b56c5/resourceGroups/MC_RGP-USW-CORE-DR-DV_aks-use-dr-dv_eastus/providers/Microsoft.Network/publicIPAddresses/a048e690-cb74-4630-81ac-081d3a3192bd"]
    //   idle_timeout_in_minutes   = 0
    //   managed_outbound_ip_count = 1
    //   outbound_ip_address_ids   = []
    //   outbound_ip_prefix_ids    = []
    //   outbound_ports_allocated  = 0
    // }
  }

  #depends_on = [azurerm_subnet_route_table_association.aks[0]]

}

# We need to link the cluster's DNS Zone to the DNS server's Vnet since we use custom DNS servers on our Vnet
# See: https://docs.microsoft.com/en-us/azure/aks/private-clusters
// resource "null_resource" "dns_zone_link" {
//   count = var.environment_acronym == "pd" ? 0 : 1 # Don't change this because we are deploying AKS to the core VNet, where the custom DNS servers are in

//   provisioner "local-exec" {
//     interpreter = ["PowerShell", "-Command"]
//     command     = "PowerShell -file dns_zone_link.ps1 -DNS_VNET ${var.dns_vnet} -NODE_RGP ${local.node_resource_group}"
//   }
// }

# Network Contributor
resource "azurerm_role_assignment" "aks_core_network" {
  count                = 1
  scope                = data.azurerm_subscription.current.id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_kubernetes_cluster.aks_core[0].identity.0.principal_id # indexing since aks_core is created with count
}

# ACRPull
// resource "azurerm_role_assignment" "aks_core_acrpull" {
//   count = 1
//   scope                = module.container_registry.id
//   role_definition_name = "AcrPull"
//   principal_id         = azurerm_kubernetes_cluster.aks_core[0].identity.0.principal_id # indexing since aks_core is created with count
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
//   target_resource_id         = azurerm_kubernetes_cluster.aks_core[0].id # indexing since aks_core is created with count
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
//   kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_core[0].id #indexing since cluster is created with count
//   os_type               = "Windows"
//   orchestrator_version  = var.aks_version
// }