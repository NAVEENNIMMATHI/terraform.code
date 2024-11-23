resource "azurerm_role_assignment" "functionToStorage1" {
  scope                = module.cmbssa.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_function_app.functionapp.identity[0].principal_id
}

resource "azurerm_role_assignment" "functionToStorage2" {
  scope                = module.cmbssa.id
  role_definition_name = "Storage Account Key Operator Service Role"
  principal_id         = azurerm_function_app.functionapp.identity[0].principal_id
}

resource "azurerm_role_assignment" "functionToStorage3" {
  scope                = module.cmbssa.id
  role_definition_name = "Reader and Data Access"
  principal_id         = azurerm_function_app.functionapp.identity[0].principal_id
}

resource "azurerm_role_assignment" "spn_sub_reader" {
  scope                = data.azurerm_subscription.current.id
  role_definition_name = "Reader"
  principal_id         = azuread_service_principal.spn_devops_cmbs_app_service.object_id
}

resource "azurerm_role_assignment" "spn_website_contributor" {
  scope                = "${data.azurerm_subscription.current.id}/resourceGroups/${module.cmbsrg.resource_group_name}"
  role_definition_name = "Website Contributor"
  principal_id         = azuread_service_principal.spn_devops_cmbs_app_service.object_id
}

resource "azurerm_role_assignment" "sqlTostorage" {
  scope = module.cmbssa.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_mssql_server.cmbs_srv_mssql_server.identity[0].principal_id

}


/*resource "azurerm_role_assignment" "functionToSqlserver1" {
  scope = module.cmbssa.id
  role_definition_name = "Storage Blob Data Owner"
  principal_id         = azurerm_mssql_server.cmbs_mssql_server.identity[0].principal_id


}

resource "azurerm_role_assignment" "functionToSqlserver2" {
  scope = module.cmbssa.id
  role_definition_name = "Owner"
  principal_id         = azurerm_mssql_server.cmbs_mssql_server.identity[0].principal_id


}
 */