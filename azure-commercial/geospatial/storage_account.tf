#Storage Acc for ARCGIS VM
module "vmdiagnosticslogs" {
  source                      = "../../azure-commercial/geospatial/storage_account"
  storage_account_name        = "sto${lower(var.location_acronym)}${lower(var.application_acronym)}${lower(var.environment_acronym)}"
  resource_group_name         = module.geospatial_rg.resource_group_name
  resource_group_location     = module.geospatial_rg.resource_group_location
  account_kind                = "FileStorage"
  account_tier                = "Premium"
  account_replication_type    = "ZRS"
  enable_https_traffic_only   = false
  azure_files_authentication_directory_type = "AADDS"
  #network_rule_default_action = "Allow"
  virtual_network_subnet_ids  = [var.agent_subnet_id,module.geospatial_vm_subnet.subnet_id,module.geospatial_aks_subnet.subnet_id]
  kpmg_nat_ip_list            = ["103.58.118.81", "199.206.0.0/25", "199.207.253.0/25"]
  tags                        = var.tags
}

resource "azurerm_advanced_threat_protection" "advanced_threat_protection" {
  target_resource_id = module.vmdiagnosticslogs.id
  enabled            = true
}
/*
resource "azurerm_storage_share" "arcgis_fileshare" {
  name                 = "${var.application_acronym}nfs${var.environment_acronym}"
  storage_account_name = module.vmdiagnosticslogs.storage_account_name
  quota                = 500
  depends_on           = [module.vmdiagnosticslogs]
}
*/

