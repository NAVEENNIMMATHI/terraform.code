module "spipaaswebappbackup01sa" {
  source                            = "../../modules/storage_account"
  for_each = var.storage_account_logs
  storage_account_name              = "sto${lower(each.value.location_acronym)}${lower(var.application_acronym)}backupsa${lower(var.Storage_environment_acronym)}"
  resource_group_name               = module.applicationrg[each.key].resource_group_name
  resource_group_location           = module.applicationrg[each.key].resource_group_location
  account_tier                      = each.value.account_tier
  network_rule_default_action       = "Allow"
  account_replication_type          = each.value.replication_type
  enable_advanced_threat_protection = "true"
  #virtual_network_subnet_ids       = [azurerm_subnet.spipaasappgw_subnet[each.key].id,azurerm_subnet.spipaaswst_subnet[each.key].id]
  kpmg_nat_ip_list                  = []
  tags                              = var.tags
}

module "spipaasappdata01sa" {
  for_each = var.storage_account_data
  source                                    = "../../modules/storage_account"
  storage_account_name                      = "sto${lower(each.value.location_acronym)}${lower(var.application_acronym)}${each.value.region}storage${lower(var.Storage_environment_acronym)}"
  resource_group_name                       = module.applicationrg[each.key].resource_group_name
  resource_group_location                   = module.applicationrg[each.key].resource_group_location
  account_tier                              = var.account_tier
  account_replication_type                  = var.replication_type
  enable_advanced_threat_protection         = "true"
  virtual_network_subnet_ids                = [azurerm_subnet.spipaasappgw_subnet[each.key].id,azurerm_subnet.spipaaswst_subnet[each.key].id]
  #kpmg_nat_ip_list                         = var.environment=="production" ? [] : ["199.207.253.101/30","199.206.0.5/30","103.133.112.80/28","103.58.118.80/28","103.216.201.96/28"]
  azure_files_authentication_directory_type = "AADDS"
  kpmg_nat_ip_list                          = []
  tags                                      = var.tags
}
module "spipaasfunctionappsa" {
  for_each = var.storage_account_functionapp
  source                            = "../../modules/storage_account"
  storage_account_name              = "sto${lower(each.value.location_acronym)}${lower(var.application_acronym)}${each.value.region}fnp01sa${lower(var.Storage_environment_acronym)}"
  resource_group_name               = module.applicationrg[each.key].resource_group_name
  resource_group_location           = module.applicationrg[each.key].resource_group_location
  account_tier                      = var.account_tier
  account_replication_type          = var.replication_type
  enable_advanced_threat_protection = "true"
  virtual_network_subnet_ids        = [azurerm_subnet.spipaasappgw_subnet[each.key].id,azurerm_subnet.spipaaswst_subnet[each.key].id]
  #kpmg_nat_ip_list                 = var.environment=="production" ? [] : ["199.207.253.101/30","199.206.0.5/30","103.133.112.80/28","103.58.118.80/28","103.216.201.96/28"]
  kpmg_nat_ip_list                  = []
  tags                              = var.tags
}
module "spipaasvmdiagnosticslogssa" {
  for_each = var.storage_account_vmlogs
  source                            = "../../modules/storage_account"
  storage_account_name              = "sto${lower(each.value.location_acronym)}${lower(var.application_acronym)}${each.value.region}log01sa${lower(var.Storage_environment_acronym)}"
  resource_group_name               = module.applicationrg[each.key].resource_group_name
  resource_group_location           = module.applicationrg[each.key].resource_group_location
  account_tier                      = var.account_tier
  account_replication_type          = var.replication_type
  virtual_network_subnet_ids        = [azurerm_subnet.spipaasappgw_subnet[each.key].id,azurerm_subnet.spipaaswst_subnet[each.key].id]
  enable_advanced_threat_protection = "true"
  #virtual_network_subnet_ids        = []
  tags                              = var.tags
}