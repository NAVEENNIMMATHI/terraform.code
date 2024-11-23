module "log-analytics-workspace" {
  source = "../../modules/log_analytics"
  log_analytics_workspace_name = "law-${lower(var.location_acronym)}-${lower(var.application_acronym)}-shared-${lower(var.environment_acronym)}"
  resource_group_name          = module.applicationrg.resource_group_name
  resource_group_location      = module.applicationrg.resource_group_location
  tags                         = var.tags
}