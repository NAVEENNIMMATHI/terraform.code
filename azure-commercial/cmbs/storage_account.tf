module "cmbssa" {
  source                     = "../../modules/storage_account"
  storage_account_name       = "sto${var.location_acronym}${var.application_acronym}${var.environment_acronym}"
  resource_group_name        = module.cmbsrg.resource_group_name
  resource_group_location    = module.cmbsrg.resource_group_location
  account_replication_type   = "LRS"
  account_kind               = "StorageV2"
  virtual_network_subnet_ids = var.environment == "dev" ? [data.terraform_remote_state.shared.outputs.ase_subnet_id,data.terraform_remote_state.shared.outputs.privatelink_subnet_id, var.agent_subnet_id, var.core_aks_subnet_id, var.wvd_subnet_id, data.terraform_remote_state.shared.outputs.app_gatewaysubnet_id] : [data.terraform_remote_state.shared.outputs.ase_subnet_id, data.terraform_remote_state.shared.outputs.privatelink_subnet_id, data.terraform_remote_state.shared.outputs.build_subnet_id, data.terraform_remote_state.shared.outputs.app_gatewaysubnet_id, var.agent_subnet_id, var.core_aks_subnet_id]
  kpmg_nat_ip_list           = ["103.58.118.81", "199.206.0.0/25", "199.207.253.0/25"]

  tags = var.tags
}

resource "azurerm_advanced_threat_protection" "advanced_threat_protection" {
  target_resource_id = module.cmbssa.id
  enabled            = true
}

resource "azurerm_private_endpoint" "cmbs-sa-pe" {
  name                = "${var.application_acronym}-pe-${var.environment_acronym}"
  location            = module.cmbsrg.resource_group_location
  resource_group_name = module.cmbsrg.resource_group_name
  subnet_id           = data.terraform_remote_state.shared.outputs.privatelink_subnet_id

  private_service_connection {
    name                           = "privatelink.blob.core.windows.net"
    private_connection_resource_id = module.cmbssa.id
    is_manual_connection           = false
    subresource_names              = ["blob"]
  }

  tags = var.tags
}

resource "azurerm_storage_queue" "cmbs_storage_queue" {
  name                 = "que-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  storage_account_name = module.cmbssa.storage_account_name
  depends_on           = [module.cmbssa]
}