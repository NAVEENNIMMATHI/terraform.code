resource "azurerm_application_insights" "application_insights" {
  name                = "ais-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name = module.csp_rg_main.resource_group_name
  location            = module.csp_rg_main.resource_group_location
  workspace_id        = data.azurerm_log_analytics_workspace.spoke_law.id
  application_type    = var.application_type


  tags = var.tags

}

resource "azurerm_monitor_diagnostic_setting" "csp_ais_logging" {
  name                       = "aiscsp-logs"
  target_resource_id         = azurerm_application_insights.application_insights.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.spoke_law.id

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = false
    }
  }
}