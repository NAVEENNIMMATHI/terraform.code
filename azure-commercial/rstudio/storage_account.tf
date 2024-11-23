
module "vmdiagnosticslogs" {
  source                      = "../../modules/storage_account"
  storage_account_name        = var.environment == "production" ? "${var.cloudops_global_prefix}${var.environment_acronym}${var.application_acronym}vmlog01sa" : "stg${var.location_acronym}${var.application_acronym}vmlog01sa${var.environment_acronym}"
  resource_group_name         = var.environment == "production" ? "co-p-eastus-rstdloganalytics-rg" : "${module.loganalyticsrg.resource_group_name}"
  resource_group_location     = "${module.loganalyticsrg.resource_group_location}"
  account_tier                = "Standard"
  account_replication_type    = "RAGRS"
  account_kind                = "StorageV2"
  enable_https_traffic_only   = true
  network_rule_default_action = "Allow"
  virtual_network_subnet_ids  = []
  tags                        = "${var.tags}"
}
