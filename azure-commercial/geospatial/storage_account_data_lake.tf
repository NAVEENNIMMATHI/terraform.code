## Storage Accounts Related to Data Lake
/*
locals {
  common_prefix_dls = "dls${var.location_acronym}${var.application_acronym}${var.environment_acronym}"
}
module "arcgis_dls_main" {
  source                            = "../../azure-commercial/geospatial/storage_account"
  storage_account_name              = "${local.common_prefix_dls}"
  resource_group_name               = module.geospatial_rg.resource_group_name
  resource_group_location           = module.geospatial_rg.resource_group_location
  account_tier                      = var.arcgis_adls_main.account_tier
  account_replication_type          = var.arcgis_adls_main.replication_type
  enable_advanced_threat_protection = "true"
  is_hns_enabled                    = "true"
  virtual_network_subnet_ids        = [var.wvd_subnet_id, module.geospatial_pep_subnet.subnet_id, var.core_aks_subnet_id, var.agent_subnet_id] 
  kpmg_nat_ip_list                  = var.kpmg_nat_ip_list
  
  tags = var.tags
}

resource "azurerm_storage_container" "arcgis_blob" {
  for_each              = toset(var.arcgis_adls_main.containers)
  name                  = lower(each.key)
  storage_account_name  = module.arcgis_dls_main.storage_account_name
  container_access_type = "private"
  depends_on = [
    azurerm_private_endpoint.arcgis_pep_app_blob,
    azurerm_private_endpoint.private_endpoint_dl_dfs
  ]
}
*/
