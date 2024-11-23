module "storage_account" {
  source                     = "../../modules12/storage_account"
  storage_account_name       = lower("sto${var.location_acronym}${var.application_acronym}${var.environment_acronym}")
  resource_group_name        = module.vmap_resource_group.resource_group_name
  resource_group_location    = module.vmap_resource_group.resource_group_location
  account_tier               = "Standard"
  account_replication_type   = "RAGRS"
  account_kind               = "StorageV2"
  enable_https_traffic_only  = true
  virtual_network_subnet_ids = []
  kpmg_nat_ip_list = [
    "103.216.201.101",
    "199.206.0.0/25",
  "199.207.253.0/25"]
  tags = var.tags
}
