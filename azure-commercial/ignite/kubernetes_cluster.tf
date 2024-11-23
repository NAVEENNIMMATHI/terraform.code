# Add SPN to custom roles
resource "azurerm_role_assignment" "msi_aks_build_cluster_dv" {
  scope              = data.azurerm_subscription.current.id
  role_definition_id = azurerm_role_definition.limited_network_role.role_definition_resource_id
  principal_id       = module.kubernetes_cluster_build.principal_id
}

resource "azurerm_role_assignment" "msi_aks_build_cluster_dv_storage" {
  scope              = data.azurerm_subscription.current.id
  role_definition_id = azurerm_role_definition.limited_storage_role.role_definition_resource_id
  principal_id       = module.kubernetes_cluster_build.principal_id
}

# Add SPN to ACR role
resource "azurerm_role_assignment" "msi_aks_build_cluster_dv_acr" {
  count = var.isEngagement == true ? 0 :1
  depends_on = [module.container_registry.id]
  scope              = module.container_registry[0].id
  role_definition_name = "AcrPull"
  principal_id       = module.kubernetes_cluster_build.principal_id
}

# Add SPN to VM Contributor role
resource "azurerm_role_assignment" "msi_aks_build_cluster_dv_vmcontri" {
  scope              = data.azurerm_subscription.current.id
  role_definition_name = "Virtual Machine Contributor"
  principal_id       = module.kubernetes_cluster_build.principal_id
}

####### AAD Group for AKS Cluster Admins
module "ignite_aks_cls_admins_ad_group" {
  source       = "../../modules12/ad_group"
  adgroup_name = var.ignite_aks_cluster_admins_group_name
}

###### Create AKS with Managed Service Identity #######
module "kubernetes_cluster_build" {
  source                     = "../../azure-commercial/ignite/kubernetes_ignite_cluster"
  rtable_id                  = azurerm_subnet_route_table_association.aks_subnet.id
  kubernetes_cluster_name    = "aks-${var.location}-${var.project_name}-${var.engagement_name}${var.separator}${var.environment}"
  resource_group_name        = module.ignite_rg.resource_group_name
  resource_group_location    = module.ignite_rg.resource_group_location
  aks_prefix                 = "aks-${var.location}-${var.project_name}-${var.engagement_name}${var.separator}${var.environment}-dns"
  aks_node_pool_name         = var.aks_node_pool_name
  aks_node_count             = var.aks_node_count
  aks_node_size              = var.aks_node_size
  cluster_subnet_id          = module.ignite_aks_subnet.subnet_id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.log_analytics_workspace.id
  api_server_auth_ips        = var.aks_api_allow_ip_list
  kubernetes_version         = var.kubernetes_version
  identity_type              = var.identity_type
  enable_auto_scaling        = var.enable_auto_scaling
  min_count                  = var.min_count
  max_count                  = var.max_count
  default_node_pool_type     = var.default_node_pool_type
  availability_zones         = var.availability_zones
  network_profile_outbound_type = var.network_profile_outbound_type
  aks_admin_group_object_ids = ["${module.ignite_aks_cls_admins_ad_group.ad_group_id}"]

  tags                       = var.tags
  
}

resource "azurerm_monitor_diagnostic_setting" "az_aks_build_diag" {
  name                       = "aks-${var.location}-${var.project_name}-${var.engagement_name}${var.separator}${var.environment}-diag"
  target_resource_id         = module.kubernetes_cluster_build.id
 log_analytics_workspace_id = data.azurerm_log_analytics_workspace.log_analytics_workspace.id
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

