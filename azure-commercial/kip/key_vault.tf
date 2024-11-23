module "keyvault" {
  source                                  = "../../modules/key_vault"
  keyvault_name                           = var.environment == "production" ? "copdeuskey01kip" : "kvl-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_location                 = module.backuprecoveryrg.resource_group_location
  resource_group_name                     = module.backuprecoveryrg.resource_group_name
  encryptapp_sp_obj_id                    = data.azuread_service_principal.encryptappsp.id
  cloudops_ad_group_object_id             = azuread_group.RDPUsers.object_id
  client_ad_group_object_id               = azuread_group.RDPUsers.object_id
  soft_delete_enabled                     = true

  tags                                    = var.tags
}

#Databricks KeyVault
module "keyvaultdbricks" {
  source                                  = "../../modules/key_vault"
  keyvault_name                           = "kvl-${var.location_acronym}-${var.application_acronym}-dbricks-${var.environment_acronym}"
  resource_group_location                 = module.applicationrg.resource_group_location
  resource_group_name                     = module.applicationrg.resource_group_name
  encryptapp_sp_obj_id                    = data.azuread_service_principal.encryptappsp.id
  cloudops_ad_group_object_id             = azuread_group.RDPUsers.object_id
  client_ad_group_object_id               = azuread_group.RDPUsers.object_id
  soft_delete_enabled                     = true
  
  tags                                    = var.tags
}

#Application KeyVault
module "keyvaultapplication" {
  source                                  = "../../modules/key_vault"
  keyvault_name                           = "kvl-${var.location_acronym}-${var.application_acronym}-app-${var.environment_acronym}"
  resource_group_location                 = module.applicationrg.resource_group_location
  resource_group_name                     = module.applicationrg.resource_group_name
  encryptapp_sp_obj_id                    = data.azuread_service_principal.encryptappsp.id
  cloudops_ad_group_object_id             = azuread_group.RDPUsers.object_id
  client_ad_group_object_id               = azuread_group.RDPUsers.object_id
  soft_delete_enabled                     = true
  
  tags                                    = var.tags
}