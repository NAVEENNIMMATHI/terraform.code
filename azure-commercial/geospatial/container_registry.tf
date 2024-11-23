// Azure Container Registry
resource "azurerm_container_registry" "arcgis_acr" {
 
  name                = "acr${var.location_acronym}${var.application_acronym}${var.environment_acronym}"
  resource_group_name = module.geospatial_rg.resource_group_name
  location            = module.geospatial_rg.resource_group_location
  sku                 = "Premium"
  admin_enabled       = "true"
  public_network_access_enabled = "false"

  trust_policy {
    enabled = true
  }
  
  identity {
    type = "SystemAssigned"
  }
  network_rule_set {
    default_action    = "Deny"
  }

  lifecycle {
    ignore_changes = [network_rule_set, public_network_access_enabled]
  }

  tags                = var.tags
}

 resource "azurerm_monitor_diagnostic_setting" "az_acr_diag" {
  name                       = "acr-${var.location_acronym}-${var.application_acronym}-diag-${var.environment_acronym}"
  target_resource_id         = azurerm_container_registry.arcgis_acr.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.spoke_law.id

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