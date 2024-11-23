module "loganalytics" {
  source                       = "../../modules12/log_analytics"
  log_analytics_workspace_name = var.environment == "production" ? "co-p-eastus-rcd1-workspace" : "law-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_location      = module.loganalyticsrg.resource_group_location
  resource_group_name          = module.loganalyticsrg.resource_group_name
  
  tags                         = var.tags
}

