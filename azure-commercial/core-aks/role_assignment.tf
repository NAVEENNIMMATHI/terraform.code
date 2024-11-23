resource "azurerm_role_assignment" "spn_cloudockit_subscription_reader" {
  count = 1
  scope                = data.azurerm_subscription.current.id
  role_definition_name = "Reader"
  principal_id         = azuread_service_principal.spn_cloudockit[0].object_id
}

resource "azurerm_role_assignment" "spn_cloudockit_storage_contributor" {
  count = 1
  scope                = azurerm_storage_account.cloudockit-stg[0].id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azuread_service_principal.spn_cloudockit[0].object_id
}

resource "azurerm_role_assignment" "spn_cloudockit_storage_full_contributor" {
  scope                = azurerm_storage_account.cloudockit-stg[0].id
  role_definition_name = "Contributor"
  principal_id         = azuread_service_principal.spn_cloudockit[0].object_id
}