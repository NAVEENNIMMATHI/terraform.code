module "ignite_stg" {
  source                     = "../../azure-commercial/ignite-cp/storage_account"
  resource_group_name        = module.ignite_rg.resource_group_name
  resource_group_location    = module.ignite_rg.resource_group_location
  storage_account_name       = "sto${var.location}${var.project_acronym}${var.engagement_name}${var.environment}"
  account_replication_type   = "LRS"
  account_kind               = "StorageV2"
  kpmg_nat_ip_list           = ["103.58.118.81","199.206.0.5","199.207.253.101","199.207.253.96"]
  virtual_network_subnet_ids = [module.ignite_aks_subnet.subnet_id,var.agent_subnet_id]
  
  tags                       = var.tags
}

resource "azurerm_storage_container" "ign_dbsciencetist_con" {
  depends_on = [
    azurerm_private_endpoint.pep_sa
  ]
  name                  = "data-scientist-${var.environment}"
  storage_account_name  = module.ignite_stg.storage_account_name
  container_access_type = "private"
}

resource "azurerm_storage_container" "ign_dbuser_con" {
  depends_on = [
    azurerm_private_endpoint.pep_sa
  ]
  name                  = "test-folder-${var.environment}"
  storage_account_name  = module.ignite_stg.storage_account_name
  container_access_type = "private"
}