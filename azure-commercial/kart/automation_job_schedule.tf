
resource "azurerm_automation_job_schedule" "periodic_clean_up_job_schedule" {
  count = var.environment == "development" || var.environment == "qa" ? 1 : 0

  automation_account_name = module.automationaccount.automation_account_name
  resource_group_name     = module.applicationrg.resource_group_name
  runbook_name            = azurerm_automation_runbook.KARTPeriodicCleanUpDEVandQASQLDatabases[0].name
  schedule_name           = azurerm_automation_schedule.once_everyfriday[0].name

  parameters = {
    automationaccountname = module.automationaccount.automation_account_name
    keyvaultname          = var.environment == "production" ? "coprdeuskey01krt" : "kvl-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
    resourcegroupname     = module.applicationrg.resource_group_name
    sqlservername         = var.environment == "production" ? "copeuskrtsqlserver1" : "srv-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  }
}

resource "azurerm_automation_job_schedule" "delete_engagement_cubes_job_schedule" {
  count = var.environment == "development" || var.environment == "qa" ? 1 : 0

  automation_account_name = module.automationaccount.automation_account_name
  resource_group_name     = module.applicationrg.resource_group_name
  runbook_name            = azurerm_automation_runbook.KARTDeleteEngagementCubes[0].name
  schedule_name           = azurerm_automation_schedule.once_everyfriday2[0].name

  parameters = {
    keyvaultname      = var.environment == "production" ? "coprdeuskey01krt" : "kvl-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
    resourcegroupname = module.applicationrg.resource_group_name
    sqlservername     = var.environment == "production" ? "copeuskrtsqlserver1" : "srv-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  }
}
