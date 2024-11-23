# VM diagnostic logs
module "vmdiagnosticslogs" {
  source                     = "../../modules/storage_account"
  storage_account_name       = "sto${lower(var.location_acronym)}${lower(var.application_acronym)}vm${lower(var.license_manager_acronym)}${lower(var.environment_acronym)}"
  resource_group_name        = module.mathworks_rg_shared.resource_group_name
  resource_group_location    = module.mathworks_rg_shared.resource_group_location
  account_tier               = "Standard"
  account_replication_type   = "RAGRS"
  account_kind               = "StorageV2"
  enable_https_traffic_only  = true
  virtual_network_subnet_ids = [module.subnet_private_link.subnet_id, module.subnet_aks.subnet_id, var.agent_subnet_id]
  kpmg_nat_ip_list           = ["199.206.0.0/25", "103.133.112.80/28", "103.58.118.80/28", "103.216.201.96/28", "103.58.118.81/28", "199.247.33.6/28"]
  depends_on                 = [module.mathworksclientsa]
  tags = var.tags
}

module "mathworksclientsa" {
  source                     = "../../modules/storage_account"
  storage_account_name       = "sto${var.location_acronym}${var.application_acronym}${var.client}${var.environment_acronym}"
  resource_group_name        = module.mathworks_rg_client.resource_group_name
  resource_group_location    = module.mathworks_rg_client.resource_group_location
  account_tier               = "Standard"
  account_replication_type   = "RAGRS"
  account_kind               = "StorageV2"
  enable_https_traffic_only  = true
  virtual_network_subnet_ids = [module.subnet_private_link.subnet_id, module.subnet_aks.subnet_id, var.agent_subnet_id]
  kpmg_nat_ip_list           = ["199.206.0.0/25", "103.133.112.80/28", "103.58.118.80/28", "103.216.201.96/28", "103.58.118.81/28", "199.247.33.6/28"]

  tags = var.tags
}

resource "azurerm_storage_share" "clientshare" {
  name                 = "sto${var.location_acronym}${var.application_acronym}${var.client}${var.environment_acronym}-share"
  storage_account_name = "sto${var.location_acronym}${var.application_acronym}${var.client}${var.environment_acronym}"
  quota                = 50

  depends_on = [
    module.mathworksclientsa
  ]
}

resource "azurerm_storage_share_directory" "data_folder" {
  name                 = "data"
  share_name           = azurerm_storage_share.clientshare.name
  storage_account_name = "sto${var.location_acronym}${var.application_acronym}${var.client}${var.environment_acronym}"

  depends_on = [
    module.mathworksclientsa
  ]
}

resource "azurerm_advanced_threat_protection" "mathworksclientsa_advanced_threat_protection" {
  target_resource_id = module.mathworksclientsa.id
  enabled            = true

  depends_on = [
    module.mathworksclientsa
  ]
}