resource "azurerm_container_registry" "eccmacr" {
  name                = "acr${var.location_acronym}${var.application_acronym}${var.environment_acronym}"
  resource_group_name = module.eccm_rg.resource_group_name
  location            = module.eccm_rg.resource_group_location
  sku                 = "Premium"
  admin_enabled       = "true"
  public_network_access_enabled = "false"
  
  identity {
    type = "SystemAssigned"
  }
  network_rule_set {
    default_action    = "Allow"
  }

  lifecycle {
    ignore_changes = [network_rule_set, public_network_access_enabled]
  }

  tags                = var.tags
}


resource "azurerm_monitor_diagnostic_setting" "az-acr-comm-diag" {
  

  name                           = "${azurerm_container_registry.eccmacr.name}diag"
  target_resource_id             = azurerm_container_registry.eccmacr.id
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
