module "fastpathautomationaccount" {
  source                  = "../../modules/automation_account"
  automation_account_name = "ama-${var.location_acronym}-${var.application_name}-${var.environment_acronym}"
  resource_group_name     = module.apprg.resource_group_name
  resource_group_location = "East US 2"
  tags                    = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "fastpathautomationaccount" {
  name                        = "FastpathDaignostic"
  target_resource_id          = module.fastpathautomationaccount.automation_account_id
  log_analytics_workspace_id  = data.azurerm_log_analytics_workspace.law.id

  log {
    category = "DscNodeStatus"
    enabled  = false

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  log {
    category = "JobLogs"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  log {
    category = "JobStreams"
    enabled  = true

    retention_policy {
      days    = 0
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
