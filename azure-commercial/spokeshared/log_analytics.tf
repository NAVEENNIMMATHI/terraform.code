module "loganalytics" {
  source                       = "../../modules12/log_analytics"
  log_analytics_workspace_name = var.log_analytics_workspace_name
  resource_group_name          = module.sharedrg.resource_group_name
  resource_group_location      = module.sharedrg.resource_group_location
  tags                         = var.tags
}

