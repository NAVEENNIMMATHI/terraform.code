module "log-analytics-workspace" {
  source                       = "../../modules/log_analytics"
  log_analytics_workspace_name = "law-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name          = module.midserver-rg.resource_group_name
  resource_group_location      = module.midserver-rg.resource_group_location
  tags                         = var.tags
}