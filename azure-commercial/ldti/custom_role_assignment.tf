resource "azurerm_role_assignment" "Custom_role_applicationdeveloper" {
  count              = var.target_deployment_environment == "development" ? 1 : 0

  scope              = module.applicationrg.resource_group_id
  role_definition_id = "/subscriptions/c72acede-d539-45d9-963d-3464ec4ddae0/providers/Microsoft.Authorization/roleDefinitions/1fc28dcd-9dce-c1fd-a3d0-436d287cbb5c"
  principal_id       = azuread_group.ldtidevelopers.object_id
}
