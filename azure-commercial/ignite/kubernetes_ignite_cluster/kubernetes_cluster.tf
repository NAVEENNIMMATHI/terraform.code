resource "azurerm_kubernetes_cluster" "kubernetes_cluster" {
  depends_on                      = [var.rtable_id]
  name                            = var.kubernetes_cluster_name
  resource_group_name             = var.resource_group_name
  location                        = var.resource_group_location
  dns_prefix                      = var.aks_prefix #verify the value and requirement
  api_server_authorized_ip_ranges = var.api_server_auth_ips
  kubernetes_version              = var.kubernetes_version

  tags = var.tags

  identity {
    type = var.identity_type
  }

  default_node_pool {
    name                = var.aks_node_pool_name
    node_count          = var.aks_node_count
    vm_size             = var.aks_node_size
    vnet_subnet_id      = var.cluster_subnet_id
    enable_auto_scaling = var.enable_auto_scaling
    min_count           = var.enable_auto_scaling == false ? null : var.min_count
    max_count          =  var.enable_auto_scaling == false ? null : var.max_count
    type                = var.default_node_pool_type
    availability_zones  = var.availability_zones
  }

  role_based_access_control {
    #### as of 8/7/2020 below still requires feature flag although MS Docs do not suggest it. as Github forum it's delayed and will be available in couple of days
    azure_active_directory {
      managed                = true
      admin_group_object_ids = var.aks_admin_group_object_ids
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
      log_analytics_workspace_id = var.log_analytics_workspace_id
    }

    azure_policy {
      enabled = true
          }
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "azure" # Sets up network policy to be used with Azure CNI
    outbound_type  = var.network_profile_outbound_type
  }
}