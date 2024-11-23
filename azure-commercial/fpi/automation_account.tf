module "fpiaa" {
  source                  = "../../modules12/automation_account"
  automation_account_name = var.environment=="production" ? "ama-use-fpi-auto-pd" : "ama-${var.location_acronym}-${var.application_acronym}-auto-${var.environment_acronym}"
  resource_group_location = module.rgfpi.resource_group_location
  resource_group_name     = module.rgfpi.resource_group_name
  tags                    = var.tags
}