module "vmdiagnosticslogssa" {
  source                     = "../../modules/storage_account"
  storage_account_name       = "sto${var.location_acronym}${var.application_acronym}diag${var.environment_acronym}"
  resource_group_location    = module.loganalyticsrg.resource_group_location
  resource_group_name        = module.loganalyticsrg.resource_group_name
  tags                       = var.tags
  account_replication_type   = "RAGRS"
  virtual_network_subnet_ids = [module.applicationsubnet.subnet_id]
}

module "timappsa" {
  source                     = "../../modules/storage_account"
  storage_account_name       = "sto${var.location_acronym}${var.application_acronym}app${var.environment_acronym}"
  resource_group_location    = module.timrg.resource_group_location
  resource_group_name        = module.timrg.resource_group_name
  tags                       = var.tags
  account_replication_type   = "RAGRS"
  virtual_network_subnet_ids = [module.applicationsubnet.subnet_id]
}

