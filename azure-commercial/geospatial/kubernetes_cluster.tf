
locals {
  node_resource_group = "RGP-${upper(var.location_acronym)}-${upper(var.application_acronym)}-AKS-NODE-${upper(var.environment_acronym)}"
  aks_resource_group  = module.geospatial_rg.resource_group_name
  aks_cluster_name    = "aks-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
}


  ###### ARCGIS AKS ###

module "kubernetes_cluster_build" {
  source                     = "../../azure-commercial/geospatial/kubernetes_arcgis_cluster"
  rtable_id                  = azurerm_subnet_route_table_association.aks_subnet.id
  kubernetes_cluster_name    = "aks-${var.location_acronym}-${var.application_acronym}${var.separator}${var.environment_acronym}"
  resource_group_name        = module.geospatial_rg.resource_group_name
  resource_group_location    = module.geospatial_rg.resource_group_location
  node_resource_group        = local.node_resource_group
  aks_prefix                 = "aks-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}-dns"
  aks_node_pool_name         = var.aks_node_pool_name
  aks_node_count             = var.aks_node_count
  aks_node_size              = var.aks_node_size
  cluster_subnet_id          = module.geospatial_aks_subnet.subnet_id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.spoke_law.id
  kubernetes_version         = var.kubernetes_version
  identity_type              = var.identity_type
  enable_auto_scaling        = var.enable_auto_scaling
  min_count                  = var.min_count
  max_count                  = var.max_count
  default_node_pool_type     = var.default_node_pool_type
  availability_zones         = var.availability_zones
  network_profile_outbound_type = var.network_profile_outbound_type
  aks_admin_group_object_ids    = [azuread_group.aks_cluster_admin_group.object_id]
 #gateway_id                    = azurerm_application_gateway.arcgis_agw.id
 vm_max_map_count           = 262144

  tags                       = var.tags
  
}

resource "null_resource" "dns_zone_link_np" {

 provisioner "local-exec" {
     command     = ".'${path.module}\\dns_zone_link.ps1' -DNS_VNET \"${var.DNS_VNET}\" -NODE_RGP \"${local.node_resource_group}\" "
    interpreter = ["pwsh", "-Command"]
  }
    depends_on = [ module.kubernetes_cluster_build.id ]
}

resource "null_resource" "dns_zone_link_core" {

 provisioner "local-exec" {
     command     = ".'${path.module}\\dns_zone_link_core.ps1' -DNS_VNET_CORE \"${var.DNS_VNET_CORE}\" -NODE_RGP \"${local.node_resource_group}\" "
    interpreter = ["pwsh", "-Command"]
  }
    depends_on = [ module.kubernetes_cluster_build.id ]
}


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

# Add SPN to VM Contributor role
resource "azurerm_role_assignment" "msi_aks_build_cluster_dv_vmcontri" {
  scope              = data.azurerm_subscription.current.id
  role_definition_name = "Virtual Machine Contributor"
  principal_id       = module.kubernetes_cluster_build.principal_id
}

resource "azurerm_monitor_diagnostic_setting" "az_aks_build_diag" {
  name                       = "aks-${var.location_acronym}-${var.application_acronym}-diag-${var.environment_acronym}"
  target_resource_id         = module.kubernetes_cluster_build.id
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
