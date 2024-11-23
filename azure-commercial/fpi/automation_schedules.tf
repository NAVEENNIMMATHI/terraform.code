resource "azurerm_automation_schedule" "five_minutes" {
  count                   = 12
  name                    = "5-minute-automation-schedule-${count.index}"
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  start_time              = timeadd(timestamp(), "${(count.index + 1) * 5 + 5}m")
  frequency               = "Hour"
  interval                = 1
  timezone                = "America/New_York"
  description             = "Runs Every 5 minutes"

  lifecycle {
    ignore_changes = [
        start_time
    ]
  }
}