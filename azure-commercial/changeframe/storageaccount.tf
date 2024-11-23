module "storage_account" {
  source                      = "../../modules/storage_account"
  storage_account_name        = "stouse${var.application_acronym}${var.environment_acronym}"
  resource_group_name         = module.applicationrg.resource_group_name
  resource_group_location     = module.applicationrg.resource_group_location
  account_tier                = "Standard"
  account_replication_type    = "RAGRS"
  enable_https_traffic_only   = true
  virtual_network_subnet_ids  = var.environment != "legacy_development" && var.environment != "development"? [data.terraform_remote_state.shared.outputs.build_subnet_id,data.terraform_remote_state.shared.outputs.mgmt_subnet_id,data.terraform_remote_state.shared.outputs.ase_subnet_id,data.terraform_remote_state.shared.outputs.app_gatewaysubnet_id,data.terraform_remote_state.shared.outputs.app_gatewaysubnet_id_cfr,var.agent_subnet_id,var.core_aks_subnet_id] : [data.terraform_remote_state.shared.outputs.build_subnet_id,data.terraform_remote_state.shared.outputs.mgmt_subnet_id,data.terraform_remote_state.shared.outputs.ase_subnet_id,data.terraform_remote_state.shared.outputs.app_gatewaysubnet_id,"${var.agent_subnet_id}","${var.wvd_subnet_id}","${var.core_aks_subnet_id}"]
  kpmg_nat_ip_list            = ["103.58.118.81","199.206.0.0/25"]

  tags                        = var.tags
}

resource "azurerm_storage_container" "webappBackup" {
  name                  = "webapp-backup"
  storage_account_name  = module.storage_account.storage_account_name
  container_access_type = "private"
}

resource "azurerm_storage_container" "db_backup" {
  name                  = "db-backup"
  storage_account_name  = module.storage_account.storage_account_name
  container_access_type = "private"                
}

data "azurerm_storage_account_sas" "storage_account_sas" {
  connection_string = module.storage_account.primary_connection_string
  https_only        = true

  resource_types {
    service   = true
    container = false
    object    = false
  }

  services {
    blob  = true
    queue = false
    table = false
    file  = false
  }

  start  = "2020-01-01"
  expiry = "2023-12-31"

  permissions {
    read    = true
    write   = true
    delete  = false
    list    = false
    add     = true
    create  = true
    update  = true
    process = false
  }
}