resource "azurerm_log_analytics_linked_service" "dsc" {
  resource_group_name = azurerm_resource_group.loganalytics.name
  workspace_id        = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? azurerm_log_analytics_workspace.core1[0].id : azurerm_log_analytics_workspace.hub.id 
  read_access_id      = azurerm_automation_account.ama-use-dsc.id
}