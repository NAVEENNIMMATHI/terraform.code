# CreateNewEPCheckDataSpaceAllocated
resource "azurerm_automation_job_schedule" "CreateNewEPCheckDataSpaceAllocated" {
  count = var.environment=="production" ? 12 : 1

  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  schedule_name           = "5-minute-automation-schedule-${count.index}"
  runbook_name            = azurerm_automation_runbook.CreateNewEPCheckDataSpaceAllocated.name
}