
module "impactfiledata01sa" {
  source                            = "../../modules/storage_account"
  storage_account_name              = "sto${lower(var.location_acronym)}${lower(var.application_acronym)}file${lower(var.environment_acronym)}"
  resource_group_name               = module.impact_rg.resource_group_name
  resource_group_location           = module.impact_rg.resource_group_location
  account_tier                      = var.account_tier
  account_replication_type          = var.replication_type
  enable_advanced_threat_protection = "true"
  virtual_network_subnet_ids        = [var.coreinfrasubnetid, var.core_aks_subnet_id, module.impact_pep_subnet.subnet_id, module.impact_function_subnet.subnet_id]
  kpmg_nat_ip_list                  = []
  tags                              = var.tags
}
module "impactdatalake01sa" {
  source                            = "../../modules/storage_account"
  storage_account_name              = "dls${lower(var.location_acronym)}${lower(var.application_acronym)}${lower(var.environment_acronym)}"
  resource_group_name               = module.impact_rg.resource_group_name
  resource_group_location           = module.impact_rg.resource_group_location
  account_tier                      = var.account_tier
  account_replication_type          = var.dls_replication_type
  enable_advanced_threat_protection = "true"
  is_hns_enabled                    = "true"
  virtual_network_subnet_ids        = [module.impact_pep_subnet.subnet_id, module.impact_function_subnet.subnet_id]
  kpmg_nat_ip_list                  = []
  tags                              = var.tags
}

/*
resource "azurerm_storage_container" "impact_dls_containers" {
  for_each              = toset(var.impact_multi_tenant_clients.clients)
  name                  = lower(each.key)
  storage_account_name  = module.impactdatalake01sa.storage_account_name
  container_access_type = "blob"

  depends_on = [
    module.impactdatalake01sa.storage_account_name
  ]
}


resource "azurerm_storage_blob" "cxl-raw" {
for_each               = toset(var.impact_multi_tenant_clients.clients)
name                   = "cxl-raw/readme.txt"
storage_account_name   = module.impactdatalake01sa.storage_account_name
storage_container_name = lower(azurerm_storage_container.impact_dls_containers[each.key].name)
type                   = "Block"
source_content         = ""
}

resource "azurerm_storage_blob" "cxl-re-trigger" {
for_each               = toset(var.impact_multi_tenant_clients.clients)
name                   = "cxl-re-trigger/readme.txt"
storage_account_name   = module.impactdatalake01sa.storage_account_name
storage_container_name = lower(azurerm_storage_container.impact_dls_containers[each.key].name)
type                   = "Block"
source_content         = ""
}

resource "azurerm_storage_blob" "cxl-scripts" {
for_each               = toset(var.impact_multi_tenant_clients.clients)
name                   = "cxl-scripts/readme.txt"
storage_account_name   = module.impactdatalake01sa.storage_account_name
storage_container_name = lower(azurerm_storage_container.impact_dls_containers[each.key].name)
type                   = "Block"
source_content         = ""
}

resource "azurerm_storage_blob" "cxl-error-files" {
for_each               = toset(var.impact_multi_tenant_clients.clients)
name                   = "cxl-error-files/readme.txt"
storage_account_name   = module.impactdatalake01sa.storage_account_name
storage_container_name = lower(azurerm_storage_container.impact_dls_containers[each.key].name)
type                   = "Block"
source_content         = ""
}
*/

#Client Upload Storage Account
resource "azurerm_storage_account" "client_upload" {
  name                      = "sto${lower(var.location_acronym)}${lower(var.application_acronym)}upload${lower(var.environment_acronym)}"
  resource_group_name       = module.impact_rg.resource_group_name
  location                  = module.impact_rg.resource_group_location
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  enable_https_traffic_only = true
  account_kind              = "StorageV2"
  min_tls_version           = "TLS1_2"
  #shared_access_key_enabled = false

  tags = var.tags

  network_rules {
    default_action = "Deny"
    bypass         = ["AzureServices"]
    virtual_network_subnet_ids = [
      var.coreinfrasubnetid, 
      var.core_aks_subnet_id, 
      module.impact_pep_subnet.subnet_id
    ]
  }
}
