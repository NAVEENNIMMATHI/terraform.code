module "projectops_sa" {
  source                     = "../../modules/storage_account"
  storage_account_name       = "sto${var.location_acronym}${var.application_acronym}1${var.environment_acronym}"
  resource_group_name        = module.projectops_rg.resource_group_name
  resource_group_location    = module.projectops_rg.resource_group_location
  account_tier               = "Standard"
  account_replication_type   = "RAGRS"
  account_kind               = "StorageV2"
  enable_https_traffic_only  = true
  virtual_network_subnet_ids = [var.wvd_subnet_id, var.agent_subnet_id]
  kpmg_nat_ip_list           = setunion(var.kpmg_nat_ip_list, var.powerapps_whitelist_ips)

  tags = var.tags
}