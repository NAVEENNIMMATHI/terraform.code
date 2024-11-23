module "loganalytics" {
  source                       = "../../modules/log_analytics"
  log_analytics_workspace_name = var.environment == "production" ? "law-${var.location_acronym}-${var.environment_acronym}" : "law-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name          = module.loganalyticsrg.resource_group_name
  resource_group_location      = module.loganalyticsrg.resource_group_location
  tags                         = var.tags
}


