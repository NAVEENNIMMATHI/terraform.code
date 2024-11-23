resource "azurerm_virtual_desktop_workspace" "workspace" {
  count    = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? 1 : 0

  name                = "wsp-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  location            = azurerm_resource_group.wvd[0].location
  resource_group_name = azurerm_resource_group.wvd[0].name

  tags = var.tags
}

data "azurerm_monitor_diagnostic_categories" "workspace_logs" {
  count    = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? 1 : 0
  resource_id = azurerm_virtual_desktop_workspace.workspace[0].id
}

resource "azurerm_monitor_diagnostic_setting" "workspace_diag" {
  count    = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? 1 : 0
  name                           = "${azurerm_virtual_desktop_workspace.workspace[0].name}-diag"
  target_resource_id             = azurerm_virtual_desktop_workspace.workspace[0].id
  log_analytics_workspace_id     = azurerm_log_analytics_workspace.hub.id
  #eventhub_authorization_rule_id = data.azurerm_eventhub_namespace_authorization_rule.event_hub_namespace.id
  #eventhub_name                  = var.eventhub_paas_diag

  dynamic "log" {
    for_each = data.azurerm_monitor_diagnostic_categories.workspace_logs[0].logs
    content {
      category = log.value
      enabled  = true

      retention_policy {
        days    = 0
        enabled = false
      }
    }
  }

  dynamic "metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.workspace_logs[0].metrics
    content {
      category = metric.value
      enabled  = false

      retention_policy {
        days    = 0
        enabled = false
      }
    }
  }
}