## Storage Accounts Related to Data Lake

locals {
  common_prefix_dls = "dls${var.location_acronym}${var.application_acronym}"
}
module "mdp_dls_main" {
  source                            = "../../modules/storage_account"
  storage_account_name              = var.environment == "production" ? "${local.common_prefix_dls}${var.environment_acronym}" :  "${local.common_prefix_dls}mdp${var.environment_acronym}" 
  resource_group_name               = module.mdp_rg_main.resource_group_name
  resource_group_location           = module.mdp_rg_main.resource_group_location
  account_tier                      = var.mdp_adls_main.account_tier
  account_replication_type          = var.mdp_adls_main.replication_type
  enable_advanced_threat_protection = "true"
  is_hns_enabled                    = "true"
  virtual_network_subnet_ids        = var.environment == "development" ? [var.wvd_subnet_id, module.mdp_subnet_pep.subnet_id, var.core_aks_subnet_id, var.agent_subnet_id,module.mdp_clamav_fap_subnet.subnet_id,module.mdp_clamav_wap_subnet.subnet_id,module.mdp_subnet_avscan.subnet_id] : [var.wvd_subnet_id, module.mdp_subnet_pep.subnet_id, var.core_aks_subnet_id, var.agent_subnet_id] 
  kpmg_nat_ip_list                  = var.environment == "development" ? ["168.149.160.18", "168.149.160.194","168.149.160.3","168.149.160.33","168.149.160.48","168.149.161.48","199.247.45.212","199.247.45.51","199.207.253.101/30", "199.206.0.5/30", "103.133.112.80/28", "103.58.118.80/28", "103.216.201.96/28", "103.58.118.81/28","168.149.146.52/30","168.149.160.224/30","199.247.33.6/30"] : ["199.207.253.101/30", "199.206.0.5/30", "103.133.112.80/28", "103.58.118.80/28", "103.216.201.96/28", "103.58.118.81/28","168.149.146.52/30","168.149.160.224/30","199.247.33.6/30"] 

  tags = var.tags
}

resource "azurerm_storage_container" "mdp_dls_main" {
  for_each              = toset(var.mdp_adls_main.containers)
  name                  = lower(each.key)
  storage_account_name  = module.mdp_dls_main.storage_account_name
  container_access_type = "private"
  depends_on = [
    azurerm_private_endpoint.mdp_pep_app_blob,
    azurerm_private_endpoint.private_endpoint_dl_dfs
  ]
}
