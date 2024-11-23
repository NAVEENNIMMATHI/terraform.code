module "adsyncsa" {
  source                     		= "../../modules/storage_account"
  storage_account_name       		= "sto${lower(var.location_acronym)}${lower(var.application_acronym)}${lower(var.environment_acronym)}"
  resource_group_location    		= module.adsyncrg.resource_group_location
  resource_group_name        		= module.adsyncrg.resource_group_name
  account_replication_type   		= "LRS"
  enable_https_traffic_only  		= true
  account_kind               		= "StorageV2"
  virtual_network_subnet_ids 		= [data.azurerm_subnet.core_ase.id]
  tags                       		= var.tags
}