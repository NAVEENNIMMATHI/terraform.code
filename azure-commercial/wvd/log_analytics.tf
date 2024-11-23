module "coabla" {
  source                       = "../../modules/log_analytics"
  log_analytics_workspace_name = "${var.abla_workspace_name}"
  resource_group_location      = "${module.loganalyticsrg.resource_group_location}"
  resource_group_name          = "${module.loganalyticsrg.resource_group_name}"
  tags                         = "${var.tags}"
}

