module "vmdiagnosticslogssa" {
  source                            = "../../modules/storage_account"
  storage_account_name              = "sto${var.location_acronym}${var.application_acronym}${var.environment_acronym}"
  resource_group_name               = module.midserver-rg.resource_group_name
  resource_group_location           = module.midserver-rg.resource_group_location
  account_tier                      = "Standard"
  account_replication_type          = "RAGRS"
  enable_advanced_threat_protection = "true"
  virtual_network_subnet_ids        = [module.midserver-subnet.subnet_id]
  kpmg_nat_ip_list                   = ["199.207.253.0/24", "203.199.72.210", "199.206.0.5"]

  tags                              = var.tags
}