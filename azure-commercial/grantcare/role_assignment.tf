resource "azurerm_role_assignment" "spn_d365_sub_reader" {
  scope                = data.azurerm_subscription.current.id
  role_definition_name = "Reader"
  principal_id         = azuread_service_principal.spn_dataexport_d365.object_id
}

resource "azurerm_role_assignment" "spn_devops_gc_app_service_reader" {
  scope                = data.azurerm_subscription.current.id
  role_definition_name = "Reader"
  principal_id         = azuread_service_principal.spn_devops_gc_app_service.object_id
}
resource "azurerm_role_assignment" "spn_storage_contributor" {
  scope                = "${data.azurerm_subscription.current.id}/resourceGroups/${module.grantcarerg.resource_group_name}"
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azuread_service_principal.spn_devops_gc_app_service.object_id
}
/*
Give Key Vault access to your storage account
New-AzRoleAssignment -ApplicationId $keyVaultSpAppId -RoleDefinitionName 'Storage Account Key Operator Service Role' -Scope $storageAccount.Id
*/

resource "azurerm_role_assignment" "keyvaultaccesstoStorage" {
  scope                = module.grantcaresa.id
  role_definition_name = "Storage Account Key Operator Service Role"
  principal_id         = data.azuread_service_principal.key_vault.object_id
}





