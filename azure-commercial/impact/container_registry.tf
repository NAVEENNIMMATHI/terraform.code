
resource "azurerm_container_registry" "impactacr" {
  name                = "acr${var.location_acronym}${var.application_acronym}${var.environment_acronym}"
  resource_group_name = module.impact_rg.resource_group_name
  location            = module.impact_rg.resource_group_location
  sku                 = "Premium"
  admin_enabled       = "true"

  public_network_access_enabled = "false"

  identity {
    type = "SystemAssigned"
  }
  network_rule_set {
    default_action = "Deny"

    virtual_network = [{
        action    = "Allow"
        subnet_id = module.impact_function_subnet.subnet_id
    }]
  }

  trust_policy {
    enabled = "true"
  }

  tags = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "az-acr-comm-diag" {

  name                       = "${azurerm_container_registry.impactacr.name}diag"
  target_resource_id         = azurerm_container_registry.impactacr.id
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
