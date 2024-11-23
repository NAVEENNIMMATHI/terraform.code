resource "azurerm_container_registry" "mipacr" {
  name                          = "acr${var.location_acronym}${var.application_acronym}${var.environment_acronym}"
  resource_group_name           = module.mathworks_rg_shared.resource_group_name
  location                      = module.mathworks_rg_shared.resource_group_location
  sku                           = "Premium"
  admin_enabled                 = "true"
  public_network_access_enabled = "false"

  trust_policy {
    enabled = "true"
  }

  identity {
    type = "SystemAssigned"
  }

  network_rule_set {
    default_action = "Deny"
  }

  tags = var.tags
}


resource "azurerm_monitor_diagnostic_setting" "az-acr-comm-diag" {
  name                           = "${azurerm_container_registry.mipacr.name}diag"
  target_resource_id             = azurerm_container_registry.mipacr.id
  log_analytics_workspace_id     = data.azurerm_log_analytics_workspace.spoke_law.id
  
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