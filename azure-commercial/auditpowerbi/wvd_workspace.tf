resource "azurerm_virtual_desktop_workspace" "workspace" {
  name                = "wsp-${var.location_acronym}-audit-${var.environment_acronym}"
  location            = module.auditpbirg.resource_group_location
  resource_group_name = module.auditpbirg.resource_group_name

  friendly_name       = "CloudOps Audit-PowerBI ${var.tags.Environment}"
  description         = "Audit Team PowerBI enabled workstations"
  tags = var.tags
}

data "azurerm_monitor_diagnostic_categories" "workspace_logs" {
  resource_id = azurerm_virtual_desktop_workspace.workspace.id
}

resource "azurerm_monitor_diagnostic_setting" "workspace_diag" {
  name                           = "${azurerm_virtual_desktop_workspace.workspace.name}-diag"
  target_resource_id             = azurerm_virtual_desktop_workspace.workspace.id
  log_analytics_workspace_id     = data.azurerm_log_analytics_workspace.loganalyticsworkspace.id
  #eventhub_authorization_rule_id = data.azurerm_eventhub_namespace_authorization_rule.event_hub_namespace.id
  #eventhub_name                  = var.eventhub_paas_diag

  dynamic "log" {
    for_each = data.azurerm_monitor_diagnostic_categories.workspace_logs.logs
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
    for_each = data.azurerm_monitor_diagnostic_categories.workspace_logs.metrics
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