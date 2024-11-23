resource "azurerm_role_assignment" "storageaccount_preprocess" {
  scope                            = module.storageaccount_preprocess.id
  role_definition_name             = "Contributor"
  principal_id                     = azurerm_user_assigned_identity.identity.principal_id  
}

resource "azurerm_role_assignment" "storageaccount_postprocess" {
  scope                            = module.storageaccount_postprocess.id
  role_definition_name             = "Contributor"
  principal_id                     = azurerm_user_assigned_identity.identity.principal_id  
}

resource "azurerm_role_assignment" "appservice" {
  count                            = var.environment == "development" || var.environment == "qa" ? "1" : "0"

  scope                            = module.appservice.app_service_id
  role_definition_name             = "Website Contributor"
  principal_id                     = azuread_service_principal.KRTWebapplication.object_id  
}