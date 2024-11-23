module "vmdiagnosticslogs" {
  source                      = "../../modules/storage_account"
  storage_account_name        = "sto${lower(var.location_acronym)}${lower(var.application_acronym)}vmiics${lower(var.environment_acronym)}"
  resource_group_name         = module.mdp_rg_main.resource_group_name
  resource_group_location     = module.mdp_rg_main.resource_group_location
  account_tier                = "Standard"
  account_replication_type    = "RAGRS"
  account_kind                = "StorageV2"
  enable_https_traffic_only   = true
  virtual_network_subnet_ids  = [module.iicssubnet.subnet_id,var.wvd_subnet_id,module.mdp_subnet_pep.subnet_id,var.core_aks_subnet_id,var.agent_subnet_id]
  kpmg_nat_ip_list            = ["199.206.0.0/25","103.133.112.80/28","103.58.118.80/28","103.216.201.96/28","103.58.118.81/28","199.247.33.6/28"]
  
  tags                        = var.tags
}


module "mdpsa" {
  source                     = "../../modules/storage_account"
  storage_account_name       = "sto${var.location_acronym}${var.application_acronym}func${var.environment_acronym}"
  resource_group_name        = module.mdp_rg_main.resource_group_name
  resource_group_location    = module.mdp_rg_main.resource_group_location
  account_replication_type   = "LRS"
  account_kind               = "StorageV2"
  virtual_network_subnet_ids = [var.wvd_subnet_id,module.mdp_subnet_pep.subnet_id,var.core_aks_subnet_id,var.agent_subnet_id] 
  kpmg_nat_ip_list           = ["199.207.253.101/30","199.206.0.5/30","103.133.112.80/28","103.58.118.80/28","103.216.201.96/28","103.58.118.81/28"]

  tags = var.tags
}

resource "azurerm_advanced_threat_protection" "advanced_threat_protection" {
  target_resource_id = module.mdpsa.id
  enabled            = true
}

module "avmdpsa" {
  source                     = "../../modules/storage_account"
  storage_account_name       = "sto${var.location_acronym}${var.application_acronym}avfap${var.environment_acronym}"
  resource_group_name        = module.mdp_rg_main.resource_group_name
  resource_group_location    = module.mdp_rg_main.resource_group_location
  account_replication_type   = "LRS"
  account_kind               = "StorageV2"
  virtual_network_subnet_ids = [var.wvd_subnet_id,module.mdp_subnet_pep.subnet_id,var.core_aks_subnet_id,var.agent_subnet_id, module.mdp_clamav_fap_subnet.subnet_id]
  kpmg_nat_ip_list           = ["199.207.253.101/30","199.206.0.5/30","103.133.112.80/28","103.58.118.80/28","103.216.201.96/28","103.58.118.81/28"]

  tags = var.tags
}

resource "azurerm_advanced_threat_protection" "av_advanced_threat_protection" {
  target_resource_id = module.avmdpsa.id
  enabled            = true
}

#EventGrid for CLamav WebApp

#resource "azurerm_eventgrid_event_subscription" "egsavmdp" {
#  name                    = "eg-${var.location_acronym}-${var.application_acronym}-av-${var.environment_acronym}"
#  scope                   = module.mdp_dls_main.id
#  event_delivery_schema   = "EventGridSchema"
#  included_event_types    = ["Microsoft.Storage.BlobCreated"]
#
#  azure_function_endpoint {
#    function_id           = "${azurerm_function_app.avfunctionapp.id}/functions/${var.clamav_eventgrid_function_name}"
#
#  }
#
#}
