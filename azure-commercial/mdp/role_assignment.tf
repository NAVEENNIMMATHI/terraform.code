#Azure Data Factory Assignments on ADLS -- currently these are not required hence commented
/*
resource "azurerm_role_assignment" "adf_datalake1_contribute_access" {
  scope                = module.mdp_dls_main.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_data_factory.mdpadf.identity[0].principal_id
}

resource "azurerm_role_assignment" "adf_datalake1_blob_contribute_access" {
  scope                = module.mdp_dls_main.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_data_factory.mdpadf.identity[0].principal_id
}

resource "azurerm_role_assignment" "adf_datalake1_blob_reader_access" {
  scope                = module.mdp_dls_main.id
  role_definition_name = "Storage Blob Data Reader"
  principal_id         = azurerm_data_factory.mdpadf.identity[0].principal_id
}
*/

resource "azurerm_role_assignment" "synapse_administrator" {
  scope                = azurerm_synapse_workspace.mdpsynapse.id
  role_definition_name = "contributor"
  principal_id         = data.azuread_service_principal.spnforsynpaseaccess.object_id
}


resource "azurerm_role_assignment" "synapse_contributortoadls" {
  scope                = azurerm_synapse_workspace.mdpsynapse.id
  role_definition_name = "contributor"
  principal_id         = azurerm_synapse_workspace.mdpsynapse.identity[0].principal_id
  
}

/*
resource "azurerm_role_assignment" "storage_contributor_access" {
  scope                = module.mdpsa.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_data_factory.mdpadf.identity[0].principal_id
}
*/

resource "azurerm_role_assignment" "adf_datalake1_contributor_access" {
  scope                = module.mdp_dls_main.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_data_factory.mdpadf.identity[0].principal_id
}

resource "azurerm_role_assignment" "iics_contributor_access" {
  scope                = module.vmdiagnosticslogs.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_data_factory.mdpadf.identity[0].principal_id
}

#SQL Server
resource "azurerm_role_assignment" "sqlTostorage" {
  scope = module.mdpsa.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_mssql_server.mdp_srv_mssql_server.identity[0].principal_id
}
  
/* https://docs.microsoft.com/en-us/azure/synapse-analytics/security/how-to-grant-workspace-managed-identity-permissions */
resource "azurerm_role_assignment" "adf_datalake1_blob_contribute_access" {
  scope                = module.mdp_dls_main.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_synapse_workspace.mdpsynapse.identity[0].principal_id
}

