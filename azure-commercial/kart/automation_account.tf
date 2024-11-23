module "automationaccount" {
  source                  = "../../modules/automation_account"
  automation_account_name = var.environment == "production" ? "copeuskrtautacc1" : "ama-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name     = module.applicationrg.resource_group_name
  resource_group_location = module.applicationrg.resource_group_location
  tags                    = var.tags
}

