module "loganalytics" {
  source                       = "../../modules/log_analytics"
  log_analytics_workspace_name = "law-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name          = module.sharedrg.resource_group_name
  resource_group_location      = module.sharedrg.resource_group_location
  tags                         = var.tags
}