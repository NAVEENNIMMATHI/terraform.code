module "automation_account" {
    source                  = "../../modules/automation_account"
    automation_account_name = "ama-usc-${var.application_acronym}-${var.environment_acronym}"
    resource_group_name     = module.applicationrg.resource_group_name
    resource_group_location = module.applicationrg.resource_group_location
    
    tags                    = var.tags
}