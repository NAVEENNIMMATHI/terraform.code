module "storage_account" {
  source                      = "../../modules/storage_account"
  storage_account_name        = "sto${var.location_acronym}${lower(var.application_acronym)}kme${lower(var.environment_acronym)}"
  resource_group_name         = module.applicationrg.resource_group_name
  resource_group_location     = module.applicationrg.resource_group_location
  account_tier                = "Standard"
  account_replication_type    = "RAGRS"
  account_kind                = "StorageV2"
  enable_https_traffic_only   = true
  virtual_network_subnet_ids  = var.environment_acronym != "dv" ? [data.terraform_remote_state.shared.outputs.build_subnet_id,data.terraform_remote_state.shared.outputs.mgmt_subnet_id,data.terraform_remote_state.shared.outputs.ase_subnet_id,data.terraform_remote_state.shared.outputs.agw_subnet_id,"${var.agent_subnet_id}","${var.core_aks_subnet_id}"] : [data.terraform_remote_state.shared.outputs.build_subnet_id,data.terraform_remote_state.shared.outputs.mgmt_subnet_id,data.terraform_remote_state.shared.outputs.ase_subnet_id,data.terraform_remote_state.shared.outputs.agw_subnet_id,var.agent_subnet_id,var.wvd_subnet_id,var.core_aks_subnet_id]
  kpmg_nat_ip_list            = ["103.216.201.101","199.206.0.0/25","199.207.253.0/25"]
  tags                        = var.tags
}

resource "azurerm_storage_container" "webappBackup" {
  name                  = "webapp-backup"
  storage_account_name  = module.storage_account.storage_account_name
  container_access_type = "private"
}
resource "azurerm_storage_container" "images" {
  name                  = "images"
  storage_account_name  = module.storage_account.storage_account_name
  container_access_type = "private"
}
resource "azurerm_storage_container" "app" {
  name                  = "kmeapp"
  storage_account_name  = module.storage_account.storage_account_name
  container_access_type = "private"
}