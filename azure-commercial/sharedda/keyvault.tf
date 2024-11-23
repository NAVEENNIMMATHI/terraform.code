module "keyvault" {
  source                                  = "../../modules/key_vault"
  keyvault_name                           = "kvl-${lower(var.location_acronym)}-shared-${lower(var.application_acronym)}-${lower(var.environment_acronym)}"
  resource_group_location                 = "${module.applicationrg.resource_group_location}"
  resource_group_name                     = "${module.applicationrg.resource_group_name}"
  encryptapp_sp_obj_id                    = "${data.azuread_service_principal.encryptApp.id}"
  cloudops_ad_group_object_id             = data.azuread_group.cloudops_keyvault_admin.object_id
  client_ad_group_object_id               = azuread_group.da_keyvault_admins.object_id
  soft_delete_enabled                     = true
  tags                                    = "${var.tags}"
}