module "keyvault" {
  source                                  = "../../modules12/key_vault"
  keyvault_name                           = "${var.key_vault_name}${var.uniqueresourcesuffix}"
  resource_group_location                 = module.backuprecoveryrg.resource_group_location
  resource_group_name                     = module.backuprecoveryrg.resource_group_name
  encryptapp_sp_obj_id                    = data.azuread_service_principal.encryptappsp.id
  cloudops_ad_group_object_id             = data.azuread_group.cloudops_keyvault_admin.object_id
  client_ad_group_object_id               = data.azuread_group.client_keyvault_admin.object_id
  tags                                    = var.tags
}

