resource "azurerm_automation_schedule" "once_everyday" {
  name                    = "once_everyday"
  resource_group_name     = module.applicationrg.resource_group_name
  automation_account_name = module.automationaccount.automation_account_name
  start_time              = timeadd(timestamp(), "15m")
  frequency               = "Day"
  interval                = 1
  timezone                = "America/New_York"
  description             = "once_everyday"
}

resource "azurerm_automation_schedule" "once_everyhour" {
  name                    = "once_everyhour"
  resource_group_name     = module.applicationrg.resource_group_name
  automation_account_name = module.automationaccount.automation_account_name
  start_time              = timeadd(timestamp(), "15m")
  frequency               = "Hour"
  interval                = 1
  timezone                = "America/New_York"
  description             = "once_everyhour"
}

locals {
  current_time           = timestamp()
  start_wallclock_time   = "18.00"
  current_wallclock_time = formatdate("hh.mm", local.current_time)
  schedule_tomorrow      = (local.current_wallclock_time >= local.start_wallclock_time)
  today                  = formatdate("YYYY-MM-DD", local.current_time)
  tomorrow               = formatdate("YYYY-MM-DD", timeadd(local.current_time, "24h"))
}

resource "azurerm_automation_schedule" "once_everyfriday" {
  count                   = var.environment == "development" || var.environment == "qa" ? 1 : 0
  
  automation_account_name = module.automationaccount.automation_account_name
  description             = "Initiate DB Clean-Up RunBook"
  frequency               = "Week"
  interval                = 1
  name                    = "once_everyfriday"
  resource_group_name     = module.applicationrg.resource_group_name
  start_time             = "${local.schedule_tomorrow ? local.tomorrow : local.today}T18:00:00Z"
  timezone                = "America/Denver"
  week_days               = ["Friday"]
}

resource "azurerm_automation_schedule" "once_everyfriday2" {
  count                   = var.environment == "development" || var.environment == "qa" ? 1 : 0
  
  automation_account_name = module.automationaccount.automation_account_name
  description             = "Initiate Runbook to Clean-Up Cubes"
  frequency               = "Week"
  interval                = 1
  name                    = "once_everyfriday2"
  resource_group_name     = module.applicationrg.resource_group_name
  start_time             = "${local.schedule_tomorrow ? local.tomorrow : local.today}T18:30:00Z"
  timezone                = "America/Denver"
  week_days               = ["Friday"]
}
