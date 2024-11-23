#locals {
#  node_resource_group = "RGP-${upper(var.location_acronym)}-${upper(var.application_acronym)}-${upper(var.engagement_name)}${var.separator}AKS-NODE-${upper(var.environment_acronym)}"
#  aks_resource_group  = module.ignite_rg.resource_group_name
#  aks_cluster_name    = module.kubernetes_cluster_build.kubernetes_cluster_name
#}


# Private AKS cluster

resource "azurerm_kubernetes_cluster" "kubernetes_cluster" {
  name                            = var.kubernetes_cluster_name
  resource_group_name             = var.resource_group_name
  location                        = var.resource_group_location
  dns_prefix                      = var.aks_prefix #verify the value and requirement
  #api_server_authorized_ip_ranges = var.api_server_auth_ips
  kubernetes_version              = var.kubernetes_version
  private_cluster_enabled         = true
  node_resource_group             = var.node_resource_group
  http_application_routing_enabled = true
  azure_policy_enabled = true
  

  tags = var.tags

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name                = var.aks_node_pool_name
    node_count          = var.aks_node_count
    vm_size             = var.aks_node_size
    vnet_subnet_id      = var.cluster_subnet_id
    orchestrator_version = var.kubernetes_version
    enable_auto_scaling = var.enable_auto_scaling
    min_count           = var.enable_auto_scaling == false ? null : var.min_count
    max_count          =  var.enable_auto_scaling == false ? null : var.max_count
    type                = var.default_node_pool_type
    zones  = var.availability_zones
  }

 # role_based_access_control {
 #   azure_active_directory {
 #     managed                = true
 #     admin_group_object_ids = var.aks_admin_group_object_ids
 #   }
  #  enabled = true
 # }
  
  azure_active_directory_role_based_access_control {
     managed = true
	 admin_group_object_ids = var.aks_admin_group_object_ids
	 azure_rbac_enabled = true
	 
	 }
	 
	 

 # addon_profile {
  #  kube_dashboard {
   #   enabled = false
   # }
#}
   # http_application_routing {
    #  enabled = true
    #}

    oms_agent {
     # enabled                    = true
      log_analytics_workspace_id = var.log_analytics_workspace_id
    }

    #azure_policy {
     # enabled = true
    #}

  

  network_profile {
    network_plugin = "azure"
    network_policy = "azure" # Sets up network policy to be used with Azure CNI
    outbound_type  = var.network_profile_outbound_type
  }

  #  depends_on = [azurerm_subnet_route_table_association.mdp_aks_route_association[0]]

}



































