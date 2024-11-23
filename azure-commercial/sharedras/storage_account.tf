module "vmdiagnosticslogs" {
  source                      = "../../modules/storage_account"
  storage_account_name        = "sto${var.location_acronym}${lower(var.application_acronym)}vm${lower(var.environment_acronym)}"
  resource_group_name         = module.sharedrg.resource_group_name
  resource_group_location     = module.sharedrg.resource_group_location
  account_tier                = "Standard"
  account_replication_type    = "RAGRS"
  account_kind                = var.storage_account_kind
  enable_https_traffic_only   = true
  virtual_network_subnet_ids  = [module.asesubnet.subnet_id,module.mgmtsubnet.subnet_id,module.buildsubnet.subnet_id]
  kpmg_nat_ip_list            = ["199.206.0.0/25"]
  tags                        = var.tags
}