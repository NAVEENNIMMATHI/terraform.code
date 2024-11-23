module "container_registry" {
  isEngagement             = var.isEngagement
  source                   = "../../azure-commercial/ignite/ignite_container_registry"
  aks_subnet               = module.ignite_aks_subnet.subnet_id
  container_registry_name  = "k${var.location}${var.project_name}acr${var.engagement_name}${var.environment}"
  resource_group_location  = module.ignite_rg.resource_group_location
  resource_group_name      = module.ignite_rg.resource_group_name
  allowed_ip_range_list    = var.acr_allowed_ip_list
  georeplication_locations = ["westus"]
  devops_spn_appid         = var.client_id
  devops_spn_secret        = var.client_secret
  tenant_id                = data.azurerm_client_config.current.tenant_id
  subnet_id_list           = [module.ignite_aks_subnet.subnet_id]
  #depends_on = [module.ignite_aks_subnet.subnet_id]
  
  

  tags                     = var.tags
}

 resource "azurerm_monitor_diagnostic_setting" "az_acr_diag" {
  count = var.isEngagement == true ? 0 : 1
  name                       = "k${var.location}${var.project_name}acr${var.engagement_name}${var.environment}diag"
  target_resource_id         = module.container_registry[0].id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.log_analytics_workspace.id

  log {
    category = "ContainerRegistryRepositoryEvents"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  log {
    category = "ContainerRegistryLoginEvents"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = false
    }
  }
}