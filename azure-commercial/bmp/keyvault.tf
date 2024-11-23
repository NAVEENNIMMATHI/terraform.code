module "keyvault" {
  source                      = "../../modules/key_vault"
  keyvault_name               = var.environment == "production" ? "copeuskey01cobmp" : "kvl-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_location     = module.backuprecoveryrg.resource_group_location
  resource_group_name         = module.backuprecoveryrg.resource_group_name
  encryptapp_sp_obj_id        = data.azuread_service_principal.encryptapp.id
  cloudops_ad_group_object_id = data.azuread_group.cloudops_keyvault_admin.object_id
  client_ad_group_object_id   = data.azuread_group.cloudops_keyvault_admin.object_id
  tags                        = var.tags
}

module "keyvault_main" {
  source                      = "../../modules/key_vault"
  keyvault_name               = "kvl-${var.location_acronym}-${var.application_acronym}-app-${var.environment_acronym}"
  resource_group_location     = module.applicationrg.resource_group_location
  resource_group_name         = module.applicationrg.resource_group_name
  encryptapp_sp_obj_id        = data.azuread_service_principal.encryptapp.id
  cloudops_ad_group_object_id = data.azuread_group.cloudops_keyvault_admin.object_id
  client_ad_group_object_id   = data.azuread_group.cloudops_keyvault_admin.object_id
  tags                        = var.tags
}