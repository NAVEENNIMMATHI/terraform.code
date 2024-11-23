
#storage
resource "azurerm_role_assignment" "sqlTostorage" {
  scope = module.impactfiledata01sa.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_mssql_server.impact_srv_mssql_server.identity[0].principal_id

  depends_on = [module.impactfiledata01sa]
}

resource "azurerm_role_assignment" "FuncTostorage" {
  scope = module.impactfiledata01sa.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_function_app.main.identity[0].principal_id

  depends_on = [module.impactfiledata01sa]
}

# Client Upload Storage
resource "azurerm_role_assignment" "FuncToUploadstorage" {
  scope = azurerm_storage_account.client_upload.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_function_app.main.identity[0].principal_id
}

#SQL
resource "azurerm_role_assignment" "FuncToSQL" {
  scope = azurerm_mssql_server.impact_srv_mssql_server.id
  role_definition_name = "SQL Server Contributor"
  principal_id         = azurerm_function_app.main.identity[0].principal_id
}

resource "azurerm_role_assignment" "SynapseToSQL" {
  scope = azurerm_mssql_server.impact_srv_mssql_server.id
  role_definition_name = "SQL Server Contributor"
  principal_id         = azurerm_synapse_workspace.impact_synapse.identity[0].principal_id
  depends_on = [
    azurerm_synapse_workspace.impact_synapse
  ]
}

#ACR
 resource "azurerm_role_assignment" "webapp_acr_pull" {
   scope                = azurerm_container_registry.impactacr.id
   role_definition_name = "AcrPull"
   principal_id         = azurerm_app_service.main.identity[0].principal_id
 }

resource "azurerm_role_assignment" "AppTostorage" {
  scope = module.impactfiledata01sa.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_app_service.main.identity[0].principal_id

  depends_on = [module.impactfiledata01sa]
}

resource "azurerm_role_assignment" "AppToSQL" {
  scope = azurerm_mssql_server.impact_srv_mssql_server.id
  role_definition_name = "SQL Server Contributor"
  principal_id         = azurerm_app_service.main.identity[0].principal_id
}

resource "azurerm_role_assignment" "AppToSQLDB" {
  for_each               = toset(var.impact_multi_tenant_clients.clients)
  scope = azurerm_mssql_database.mdpsql_app_database[each.value].id
  role_definition_name = "SQL Server Contributor"
  principal_id         = azurerm_app_service.main.identity[0].principal_id
}

#resource "azurerm_role_assignment" "SPNToRSG" {
#  scope                = module.impact_rg.id
#  role_definition_name = "Storage Blob Data Owner"
#  principal_id         = var.client_id
#}
