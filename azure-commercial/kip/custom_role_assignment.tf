locals {
  mngdinstance       = azurerm_template_deployment.mi_arm_deployment.parameters.managedInstanceName
}

#Custom Storage Account Contributor Role Assignments
resource "azurerm_role_assignment" "production_CustomStorageAccountContributor_role_1" {
  scope              = module.rawandcuratedsa.id
  role_definition_id = azurerm_role_definition.CustomStorageAccountContributor.role_definition_resource_id
  principal_id       = var.environment == "production" ? data.azuread_service_principal.kip_sp[0].id : azuread_service_principal.KIPApplication.id
}

resource "azurerm_role_assignment" "production_CustomStorageAccountContributor_role_2" {
  scope              = module.rawandcuratedsa.id
  role_definition_id = azurerm_role_definition.CustomStorageAccountContributor.role_definition_resource_id
  principal_id       = var.environment == "production" ? data.azuread_service_principal.kiprest_sp[0].id : azuread_service_principal.KIPRESTApplication.id
}
resource "azurerm_role_assignment" "kipspn_rawandcuratedsa" {
  scope              = module.rawandcuratedsa.id
  role_definition_name = "Storage Blob Data Owner"
  principal_id       = var.environment == "production" ? data.azuread_service_principal.kip_sp[0].id : azuread_service_principal.KIPApplication.id
}

resource "azurerm_role_assignment" "kiprestspn_rawandcuratedsa" {
  scope              = module.rawandcuratedsa.id
  role_definition_name = "Storage Blob Data Owner"
  principal_id       = var.environment == "production" ? data.azuread_service_principal.kiprest_sp[0].id : azuread_service_principal.KIPRESTApplication.id
}

resource "azurerm_role_assignment" "production_CustomStorageAccountContributor_role_3" {
  scope              = module.rawandcuratedsa.id
  role_definition_id = azurerm_role_definition.CustomStorageAccountContributor.role_definition_resource_id
  principal_id       = var.environment == "production" ? data.azuread_service_principal.mep-kip_sp[0].id : azuread_service_principal.MEP-KIPApplication.id
}

resource "azurerm_role_assignment" "production_CustomStorageAccountContributor_role_4" {
  scope              = module.rawandcuratedsa.id
  role_definition_id = azurerm_role_definition.CustomStorageAccountContributor.role_definition_resource_id
  principal_id       = var.environment == "production" ? data.azuread_service_principal.meprest-kip_sp[0].id : azuread_service_principal.MEPREST-KIPApplication.id
}

resource "azurerm_role_assignment" "production_CustomStorageAccountContributor_role_5" {
  scope              = module.datavaultsa.id
  role_definition_id = azurerm_role_definition.CustomStorageAccountContributor.role_definition_resource_id
  principal_id       = var.environment == "production" ? data.azuread_service_principal.kip_sp[0].id : azuread_service_principal.KIPApplication.id
}

resource "azurerm_role_assignment" "production_CustomStorageAccountContributor_role_6" {
  scope              = module.datavaultsa.id
  role_definition_id = azurerm_role_definition.CustomStorageAccountContributor.role_definition_resource_id
  principal_id       = var.environment == "production" ? data.azuread_service_principal.kiprest_sp[0].id : azuread_service_principal.KIPRESTApplication.id
}

resource "azurerm_role_assignment" "production_CustomStorageAccountContributor_role_7" {
  scope              = module.datavaultsa.id
  role_definition_id = azurerm_role_definition.CustomStorageAccountContributor.role_definition_resource_id
  principal_id       = var.environment == "production" ? data.azuread_service_principal.mep-kip_sp[0].id : azuread_service_principal.MEP-KIPApplication.id
}

resource "azurerm_role_assignment" "production_CustomStorageAccountContributor_role_8" {
  scope              = module.datavaultsa.id
  role_definition_id = azurerm_role_definition.CustomStorageAccountContributor.role_definition_resource_id
  principal_id       = var.environment == "production" ? data.azuread_service_principal.meprest-kip_sp[0].id : azuread_service_principal.MEPREST-KIPApplication.id
}

resource "azurerm_role_assignment" "production_CustomStorageAccountContributor_role_9" {
  scope              = module.rawandcuratedsa.id
  role_definition_id = azurerm_role_definition.CustomStorageAccountContributor.role_definition_resource_id
  principal_id       = var.environment == "production" ? data.azuread_service_principal.functionapp_prod_sp[0].id : azurerm_function_app.app_service_function.identity[0].principal_id
}

resource "azurerm_role_assignment" "production_CustomStorageAccountContributor_role_10" {
  scope              = module.datavaultsa.id
  role_definition_id = azurerm_role_definition.CustomStorageAccountContributor.role_definition_resource_id
  principal_id       = var.environment == "production" ? data.azuread_service_principal.functionapp_prod_sp[0].id : azurerm_function_app.app_service_function.identity[0].principal_id
}

resource "azurerm_role_assignment" "kip_app_data_Storage_Account_security_group_role" {
  scope                = module.kipappdatasa.id
  role_definition_name = (var.environment == "development" || var.environment == "qa") ? "Contributor" : "Reader"
  principal_id         = azuread_group.MIAdmins.object_id
}

resource "azurerm_role_assignment" "kip_app_data_Storage_Account_security_group_role2" {
  scope                = module.kipappdatasa.id
  role_definition_name = "Contributor"
  principal_id         = azuread_group.KIPSAAppdataAdmins.object_id
}

resource "azurerm_role_assignment" "kip_app_data_Storage_Account_managed_identity_role" {
  scope                = module.kipappdatasa.id
  role_definition_name = "Contributor" 
  principal_id         = var.environment == "production" ? data.azuread_service_principal.kip_sp[0].id : azuread_service_principal.KIPApplication.id
}

resource "azurerm_role_assignment" "kip_app_data_Storage_Account_managed_identity_role2" {
  scope                = module.kipappdatasa.id
  role_definition_name = "Contributor" 
  principal_id         = var.environment == "production" ? data.azuread_service_principal.kiprest_sp[0].id : azuread_service_principal.KIPRESTApplication.id
}

#Custom SQL Managed Instance Contributor Role Assignment
resource "azurerm_role_assignment" "production_CustomSQLManagedInstanceContributor_role_1" {
  scope              = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${module.applicationrg.resource_group_name}/providers/Microsoft.Sql/managedInstances/${local.mngdinstance}"
  role_definition_id = azurerm_role_definition.CustomSQLManagedInstanceContributor.role_definition_resource_id
  principal_id       = var.environment == "production" ? data.azuread_service_principal.kip_sp[0].id : azuread_service_principal.KIPApplication.id
}

resource "azurerm_role_assignment" "production_CustomSQLManagedInstanceContributor_role_2" {
  scope              = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${module.applicationrg.resource_group_name}/providers/Microsoft.Sql/managedInstances/${local.mngdinstance}"
  role_definition_id = azurerm_role_definition.CustomSQLManagedInstanceContributor.role_definition_resource_id
  principal_id       = var.environment == "production" ? data.azuread_service_principal.kiprest_sp[0].id : azuread_service_principal.KIPRESTApplication.id
}

resource "azurerm_role_assignment" "production_CustomSQLManagedInstanceContributor_role_3" {
  scope              = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${module.applicationrg.resource_group_name}/providers/Microsoft.Sql/managedInstances/${local.mngdinstance}"
  role_definition_id = azurerm_role_definition.CustomSQLManagedInstanceContributor.role_definition_resource_id
  principal_id       = var.environment == "production" ? data.azuread_service_principal.mep-kip_sp[0].id : azuread_service_principal.MEP-KIPApplication.id
}

resource "azurerm_role_assignment" "production_CustomSQLManagedInstanceContributor_role_4" {
  scope              = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${module.applicationrg.resource_group_name}/providers/Microsoft.Sql/managedInstances/${local.mngdinstance}"
  role_definition_id = azurerm_role_definition.CustomSQLManagedInstanceContributor.role_definition_resource_id
  principal_id       = var.environment == "production" ? data.azuread_service_principal.meprest-kip_sp[0].id : azuread_service_principal.MEPREST-KIPApplication.id
}

resource "azurerm_role_assignment" "production_CustomSQLManagedInstanceContributor_role_5" {
  scope              = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${module.applicationrg.resource_group_name}/providers/Microsoft.Sql/managedInstances/${local.mngdinstance}"
  role_definition_id = azurerm_role_definition.CustomSQLManagedInstanceContributor.role_definition_resource_id
  principal_id       = var.environment == "production" ? data.azuread_service_principal.functionapp_prod_sp[0].id : azurerm_function_app.app_service_function.identity[0].principal_id
}


#Custom SQL DB Contributor Role Assignment
resource "azurerm_role_assignment" "production_CustomSQLDBContributor_role_1" {
  scope              = module.sqlserver.sql_server_id
  role_definition_id = azurerm_role_definition.CustomSQLDBContributor.role_definition_resource_id
  principal_id       = var.environment == "production" ? data.azuread_service_principal.kip_sp[0].id : azuread_service_principal.KIPApplication.id
}

resource "azurerm_role_assignment" "production_CustomSQLDBContributor_role_2" {
  scope              = module.sqlserver.sql_server_id
  role_definition_id = azurerm_role_definition.CustomSQLDBContributor.role_definition_resource_id
  principal_id       = var.environment == "production" ? data.azuread_service_principal.kiprest_sp[0].id : azuread_service_principal.KIPRESTApplication.id
}

resource "azurerm_role_assignment" "production_CustomSQLDBContributor_role_3" {
  scope              = module.sqlserver.sql_server_id
  role_definition_id = azurerm_role_definition.CustomSQLDBContributor.role_definition_resource_id
  principal_id       = var.environment == "production" ? data.azuread_service_principal.mep-kip_sp[0].id : azuread_service_principal.MEP-KIPApplication.id
  
}

resource "azurerm_role_assignment" "production_CustomSQLDBContributor_role_4" {
  scope              = module.sqlserver.sql_server_id
  role_definition_id = azurerm_role_definition.CustomSQLDBContributor.role_definition_resource_id
  principal_id       = var.environment == "production" ? data.azuread_service_principal.meprest-kip_sp[0].id : azuread_service_principal.MEPREST-KIPApplication.id
}

resource "azurerm_role_assignment" "production_CustomSQLDBContributor_role_5" {
  scope              = module.sqlserver.sql_server_id
  role_definition_id = azurerm_role_definition.CustomSQLDBContributor.role_definition_resource_id
  principal_id       = var.environment == "production" ? data.azuread_service_principal.functionapp_prod_sp[0].id : azurerm_function_app.app_service_function.identity[0].principal_id
}

#Custom Key Vault Read Role Assignment
resource "azurerm_role_assignment" "production_KeyVaultRead_role_1" {
  scope              = module.keyvault.key_vault_id
  role_definition_id = azurerm_role_definition.KeyVaultRead.role_definition_resource_id
  principal_id       = var.environment == "production" ? data.azuread_service_principal.kip_sp[0].id : azuread_service_principal.KIPApplication.id
}

resource "azurerm_role_assignment" "production_KeyVaultRead_role_2" {
  scope              = module.keyvault.key_vault_id
  role_definition_id = azurerm_role_definition.KeyVaultRead.role_definition_resource_id
  principal_id       = var.environment == "production" ? data.azuread_service_principal.kiprest_sp[0].id : azuread_service_principal.KIPRESTApplication.id
}

resource "azurerm_role_assignment" "production_KeyVaultRead_role_3" {
  scope              = module.keyvault.key_vault_id
  role_definition_id = azurerm_role_definition.KeyVaultRead.role_definition_resource_id
  principal_id       = var.environment == "production" ? data.azuread_service_principal.mep-kip_sp[0].id : azuread_service_principal.MEP-KIPApplication.id
}

resource "azurerm_role_assignment" "production_KeyVaultRead_role_4" {
  scope              = module.keyvault.key_vault_id
  role_definition_id = azurerm_role_definition.KeyVaultRead.role_definition_resource_id
  principal_id       = var.environment == "production" ? data.azuread_service_principal.meprest-kip_sp[0].id : azuread_service_principal.MEPREST-KIPApplication.id
}

# KIPADFContributers Assignments
resource "azurerm_role_assignment" "adf_contributor_role_kipadf" {
  scope                = azurerm_data_factory.kipadf.id
  role_definition_name = "Contributor"
  principal_id         = azuread_group.KIPADFContributers.object_id
}

resource "azurerm_role_assignment" "adf_contributor_role_kipadf_self_hosted" {
  scope                = azurerm_data_factory.kipadf_self_hosted.id
  role_definition_name = "Contributor"
  principal_id         = azuread_group.KIPADFContributers.object_id
}

resource "azurerm_role_assignment" "adf_contributor_role_rawandcuratedsa" {
  scope                = module.rawandcuratedsa.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azuread_group.KIPADFContributers.object_id
}

resource "azurerm_role_assignment" "adf_contributor_role_datavaultsa" {
  scope                = module.datavaultsa.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azuread_group.KIPADFContributers.object_id
}

resource "azurerm_role_assignment" "adf_contributor_role_rawandcuratedsa_key" {
  scope                = module.rawandcuratedsa.id
  role_definition_name = "Storage Account Key Operator Service Role"
  principal_id         = azuread_group.KIPADFContributers.object_id
}

resource "azurerm_role_assignment" "adf_contributor_role_datavaultsa_key" {
  scope                = module.datavaultsa.id
  role_definition_name = "Storage Account Key Operator Service Role"
  principal_id         = azuread_group.KIPADFContributers.object_id
}

resource "azurerm_role_assignment" "adf_contributor_role_resourcegroup" {
  scope                = module.applicationrg.resource_group_id
  role_definition_id   = azurerm_role_definition.CustomDataFactoryDeployer.role_definition_resource_id
  principal_id         = azuread_group.KIPADFContributers.object_id
}

#Azure Data Explorer Assignments
resource "azurerm_role_assignment" "adx_synapse_contribute_access" {
  scope                = module.sqlserver.sql_server_id
  role_definition_name = "Contributor"
  principal_id         = azurerm_kusto_cluster.kipadx.identity[0].principal_id
}

resource "azurerm_role_assignment" "adx_datalake1_contribute_access" {
  scope                = module.rawandcuratedsa.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_kusto_cluster.kipadx.identity[0].principal_id
}

resource "azurerm_role_assignment" "adx_datalake2_contribute_access" {
  scope                = module.datavaultsa.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_kusto_cluster.kipadx.identity[0].principal_id
}

resource "azurerm_role_assignment" "adx_sqlmi_contribute_access" {
  scope                = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${module.applicationrg.resource_group_name}/providers/Microsoft.Sql/managedInstances/${local.mngdinstance}"
  role_definition_name = "Contributor"
  principal_id         = azurerm_kusto_cluster.kipadx.identity[0].principal_id
}

resource "azurerm_role_assignment" "adx_kipadgroup_contribute_access" {
  scope                = azurerm_kusto_cluster.kipadx.id
  role_definition_name = "Contributor"
  principal_id         = azuread_group.KIPADFContributers.id
}

resource "azurerm_kusto_database_principal_assignment" "adx_database_kipadgroup_admin_access" {
  name                 = var.adx_database_principal_name
  resource_group_name  = module.applicationrg.resource_group_name
  cluster_name         = azurerm_kusto_cluster.kipadx.name
  database_name        = azurerm_kusto_database.adx_database.name
  tenant_id            = data.azurerm_client_config.current.tenant_id
  principal_id         = azuread_group.KIPADFContributers.id
  principal_type       = "Group"
  role                 = "Admin"
}

#Azure Data Factory Assignments

resource "azurerm_role_assignment" "adf_datalake1_contribute_access" {
  scope                = module.rawandcuratedsa.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_data_factory.kipadf.identity[0].principal_id
}

resource "azurerm_role_assignment" "adf_datalake2_contribute_access" {
  scope                = module.datavaultsa.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_data_factory.kipadf.identity[0].principal_id
}

resource "azurerm_role_assignment" "adf_sqlmi_contribute_access" {
  scope                = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${module.applicationrg.resource_group_name}/providers/Microsoft.Sql/managedInstances/${local.mngdinstance}"
  role_definition_name = "Contributor"
  principal_id         = azurerm_data_factory.kipadf.identity[0].principal_id
}

resource "azurerm_role_assignment" "adf_kipadgroup_contribute_access" {
  scope                = azurerm_data_factory.kipadf.id
  role_definition_name = "Contributor"
  principal_id         = azuread_group.KIPADFContributers.id
}

resource "azurerm_role_assignment" "adf_kipadx_contribute_access" {
  scope                = azurerm_kusto_cluster.kipadx.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_data_factory.kipadf.identity[0].principal_id
}

resource "azurerm_role_assignment" "adf_kipsearch_contribute_access" {
  scope                = azurerm_search_service.kipcognitivesearch.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_data_factory.kipadf.identity[0].principal_id
}

resource "azurerm_role_assignment" "adf_kipselfhosted_contribute_access" {
  scope                = azurerm_kusto_cluster.kipadx.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_data_factory.kipadf_self_hosted.identity[0].principal_id
}

resource "azurerm_role_assignment" "adf_datavault_contribute_access" {
  scope                = module.datavaultsa.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_data_factory.kipadf_self_hosted.identity[0].principal_id
}

resource "azurerm_role_assignment" "adf_datavault2_contribute_access" {
  scope                = module.rawandcuratedsa.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_data_factory.kipadf_self_hosted.identity[0].principal_id
}

#Azure Databricks Access Assignments
resource "azurerm_role_assignment" "databricks_datalake1_blob_contributor_access" {
  scope                = module.rawandcuratedsa.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azuread_group.DatabricksContributor.id
}

resource "azurerm_role_assignment" "databricks_datalake1_blob_reader_access" {
  scope                = module.rawandcuratedsa.id
  role_definition_name = "Storage Blob Data Reader"
  principal_id         = azuread_group.DatabricksReader.id
}

resource "azurerm_role_assignment" "databricks_spn_sql_mi_contributor_access" {
  scope                = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${module.applicationrg.resource_group_name}/providers/Microsoft.Sql/managedInstances/${local.mngdinstance}"
  role_definition_id   = azurerm_role_definition.CustomSQLManagedInstanceContributor.role_definition_resource_id
  principal_id         = azuread_service_principal.KIP-Databricks.id
}