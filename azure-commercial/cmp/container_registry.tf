resource "azurerm_container_registry" "cmpacr" {
  name                = "acr${var.location_acronym}${var.application_acronym}${var.environment_acronym}"
  resource_group_name = module.cmp_rg_shared.resource_group_name
  location            = module.cmp_rg_shared.resource_group_location
  sku                 = "Premium"
  admin_enabled       = "true"

  public_network_access_enabled = "false"
  
  identity {
    type = "SystemAssigned"
  }
  network_rule_set {
    default_action    = "Deny"
  }

  lifecycle {
    ignore_changes = [network_rule_set, public_network_access_enabled]
  }

  trust_policy{
    enabled  = "true"
  }

  tags                = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "az-acr-comm-diag" {
  
  name                           = "${azurerm_container_registry.cmpacr.name}diag"
  target_resource_id             = azurerm_container_registry.cmpacr.id
  #log_analytics_workspace_id    = azurerm_log_analytics_workspace.hub.id
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