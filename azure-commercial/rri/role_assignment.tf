resource "azurerm_role_assignment" "appservice_web" {
  scope              = module.storage_account.id
  role_definition_name = "Owner"
  principal_id       = azurerm_app_service.appservice_web.identity[0].principal_id
}

resource "azurerm_role_assignment" "appservice_rest" {
  scope              = module.storage_account.id
  role_definition_name = "Owner"
  principal_id       = azurerm_app_service.appservice_rest.identity[0].principal_id
} 