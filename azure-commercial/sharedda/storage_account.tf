module "vmdiagnosticslogs" {
  source                      = "../../modules/storage_account"
  storage_account_name        = "sto${lower(var.location_acronym)}${lower(var.application_acronym)}vmshared${lower(var.environment_acronym)}"
  resource_group_name         = module.applicationrg.resource_group_name
  resource_group_location     = module.applicationrg.resource_group_location
  account_tier                = "Standard"
  account_replication_type    = "RAGRS"
  account_kind                = "StorageV2"
  enable_https_traffic_only   = true
  virtual_network_subnet_ids  = [module.asesubnet.subnet_id,module.mgmtsubnet.subnet_id,module.buildsubnet.subnet_id]
  kpmg_nat_ip_list            = ["199.206.0.0/25"]
  tags                        = var.tags
}

resource "azurerm_storage_account" "smbfileshare" {
  name                      = "sto${lower(var.location_acronym)}${lower(var.application_acronym)}smb${lower(var.environment_acronym)}"
  resource_group_name       = module.applicationrg.resource_group_name
  location                  = module.applicationrg.resource_group_location
  account_tier              = "Standard"
  account_replication_type  = "ZRS"
  enable_https_traffic_only = true
  account_kind              = "StorageV2"
  is_hns_enabled            = false
  allow_blob_public_access  = false
  min_tls_version           = "TLS1_2"
  large_file_share_enabled  = true

  network_rules {
    default_action             = "Deny"
    ip_rules                   = []
    virtual_network_subnet_ids = [module.wstsubnet.subnet_id,module.mgmtsubnet.subnet_id,module.buildsubnet.subnet_id,var.agent_subnet_id,var.core_aks_subnet_id]
  }

  azure_files_authentication {
    directory_type = "AADDS"
  }

  tags = var.tags
}