#Custom Storage Account Contributor Role Assignments
resource "azurerm_role_assignment" "CustomStorageAccountContributor_role_1" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = module.rawandcuratedsa.id
  role_definition_id = azurerm_role_definition.CustomStorageAccountContributor.id
  principal_id       = data.azuread_service_principal.kipdev_sp[0].id
}

resource "azurerm_role_assignment" "CustomStorageAccountContributor_role_2" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0
  scope              = module.rawandcuratedsa.id
  role_definition_id = azurerm_role_definition.CustomStorageAccountContributor.id
  principal_id       = data.azuread_service_principal.kiprestdev_sp[0].id
}

resource "azurerm_role_assignment" "CustomStorageAccountContributor_role_3" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = module.rawandcuratedsa.id
  role_definition_id = azurerm_role_definition.CustomStorageAccountContributor.id
  principal_id       = data.azuread_service_principal.mep-kipdev_sp[0].id
}

resource "azurerm_role_assignment" "CustomStorageAccountContributor_role_4" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = module.rawandcuratedsa.id
  role_definition_id = azurerm_role_definition.CustomStorageAccountContributor.id
  principal_id       = data.azuread_service_principal.meprest-kipdev_sp[0].id
}

resource "azurerm_role_assignment" "CustomStorageAccountContributor_role_5" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = module.rawandcuratedsa.id
  role_definition_id = azurerm_role_definition.CustomStorageAccountContributor.id
  principal_id       = data.azuread_service_principal.kipqa_sp[0].id
}

resource "azurerm_role_assignment" "CustomStorageAccountContributor_role_6" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = module.rawandcuratedsa.id
  role_definition_id = azurerm_role_definition.CustomStorageAccountContributor.id
  principal_id       = data.azuread_service_principal.kiprestqa_sp[0].id
}

resource "azurerm_role_assignment" "CustomStorageAccountContributor_role_7" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = module.rawandcuratedsa.id
  role_definition_id = azurerm_role_definition.CustomStorageAccountContributor.id
  principal_id       = data.azuread_service_principal.mep-kipqa_sp[0].id
}

resource "azurerm_role_assignment" "CustomStorageAccountContributor_role_8" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = module.rawandcuratedsa.id
  role_definition_id = azurerm_role_definition.CustomStorageAccountContributor.id
  principal_id       = data.azuread_service_principal.meprest-kipqa_sp[0].id
}

resource "azurerm_role_assignment" "CustomStorageAccountContributor_role_9" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = module.rawandcuratedsa.id
  role_definition_id = azurerm_role_definition.CustomStorageAccountContributor.id
  principal_id       = data.azuread_service_principal.dasnp_sp[0].id
}

resource "azurerm_role_assignment" "CustomStorageAccountContributor_role_10" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = module.rawandcuratedsa.id
  role_definition_id = azurerm_role_definition.CustomStorageAccountContributor.id
  principal_id       = data.azuread_service_principal.dasrestnp_sp[0].id
}

resource "azurerm_role_assignment" "CustomStorageAccountContributor_role_11" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = module.datavaultsa.id
  role_definition_id = azurerm_role_definition.CustomStorageAccountContributor.id
  principal_id       = data.azuread_service_principal.kipdev_sp[0].id
}

resource "azurerm_role_assignment" "CustomStorageAccountContributor_role_12" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = module.datavaultsa.id
  role_definition_id = azurerm_role_definition.CustomStorageAccountContributor.id
  principal_id       = data.azuread_service_principal.kiprestdev_sp[0].id
}

resource "azurerm_role_assignment" "CustomStorageAccountContributor_role_13" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = module.datavaultsa.id
  role_definition_id = azurerm_role_definition.CustomStorageAccountContributor.id
  principal_id       = data.azuread_service_principal.mep-kipdev_sp[0].id
}

resource "azurerm_role_assignment" "CustomStorageAccountContributor_role_14" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = module.datavaultsa.id
  role_definition_id = azurerm_role_definition.CustomStorageAccountContributor.id
  principal_id       = data.azuread_service_principal.meprest-kipdev_sp[0].id
}

resource "azurerm_role_assignment" "CustomStorageAccountContributor_role_15" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = module.datavaultsa.id
  role_definition_id = azurerm_role_definition.CustomStorageAccountContributor.id
  principal_id       = data.azuread_service_principal.kipqa_sp[0].id
}

resource "azurerm_role_assignment" "CustomStorageAccountContributor_role_16" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = module.datavaultsa.id
  role_definition_id = azurerm_role_definition.CustomStorageAccountContributor.id
  principal_id       = data.azuread_service_principal.kiprestqa_sp[0].id
}

resource "azurerm_role_assignment" "CustomStorageAccountContributor_role_17" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = module.datavaultsa.id
  role_definition_id = azurerm_role_definition.CustomStorageAccountContributor.id
  principal_id       = data.azuread_service_principal.mep-kipqa_sp[0].id
}

resource "azurerm_role_assignment" "CustomStorageAccountContributor_role_18" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = module.datavaultsa.id
  role_definition_id = azurerm_role_definition.CustomStorageAccountContributor.id
  principal_id       = data.azuread_service_principal.meprest-kipqa_sp[0].id
}

resource "azurerm_role_assignment" "CustomStorageAccountContributor_role_19" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = module.datavaultsa.id
  role_definition_id = azurerm_role_definition.CustomStorageAccountContributor.id
  principal_id       = data.azuread_service_principal.dasnp_sp[0].id
}

resource "azurerm_role_assignment" "CustomStorageAccountContributor_role_20" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = module.datavaultsa.id
  role_definition_id = azurerm_role_definition.CustomStorageAccountContributor.id
  principal_id       = data.azuread_service_principal.dasrestnp_sp[0].id
}

resource "azurerm_role_assignment" "CustomStorageAccountContributor_role_21" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = module.rawandcuratedsa.id
  role_definition_id = azurerm_role_definition.CustomStorageAccountContributor.id
  principal_id       = data.azuread_service_principal.functionapp_dev_sp[0].id
}

resource "azurerm_role_assignment" "CustomStorageAccountContributor_role_22" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = module.rawandcuratedsa.id
  role_definition_id = azurerm_role_definition.CustomStorageAccountContributor.id
  principal_id       = data.azuread_service_principal.functionapp_qa_sp[0].id
}

resource "azurerm_role_assignment" "CustomStorageAccountContributor_role_23" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = module.datavaultsa.id
  role_definition_id = azurerm_role_definition.CustomStorageAccountContributor.id
  principal_id       = data.azuread_service_principal.functionapp_dev_sp[0].id
}

resource "azurerm_role_assignment" "CustomStorageAccountContributor_role_24" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = module.datavaultsa.id
  role_definition_id = azurerm_role_definition.CustomStorageAccountContributor.id
  principal_id       = data.azuread_service_principal.functionapp_qa_sp[0].id
}

#Custom SQL Managed Instance Contributor Role Assignment
resource "azurerm_role_assignment" "CustomSQLManagedInstanceContributor_role_1" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${module.applicationrg.resource_group_name}/providers/Microsoft.Sql/managedInstances/${var.managedInstanceName}"
  role_definition_id = azurerm_role_definition.CustomSQLManagedInstanceContributor.id
  principal_id       = data.azuread_service_principal.kipdev_sp[0].id
}

resource "azurerm_role_assignment" "CustomSQLManagedInstanceContributor_role_2" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${module.applicationrg.resource_group_name}/providers/Microsoft.Sql/managedInstances/${var.managedInstanceName}"
  role_definition_id = azurerm_role_definition.CustomSQLManagedInstanceContributor.id
  principal_id       = data.azuread_service_principal.kiprestdev_sp[0].id
}

resource "azurerm_role_assignment" "CustomSQLManagedInstanceContributor_role_3" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${module.applicationrg.resource_group_name}/providers/Microsoft.Sql/managedInstances/${var.managedInstanceName}"
  role_definition_id = azurerm_role_definition.CustomSQLManagedInstanceContributor.id
  principal_id       = data.azuread_service_principal.mep-kipdev_sp[0].id
}

resource "azurerm_role_assignment" "CustomSQLManagedInstanceContributor_role_4" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${module.applicationrg.resource_group_name}/providers/Microsoft.Sql/managedInstances/${var.managedInstanceName}"
  role_definition_id = azurerm_role_definition.CustomSQLManagedInstanceContributor.id
  principal_id       = data.azuread_service_principal.meprest-kipdev_sp[0].id
}

resource "azurerm_role_assignment" "CustomSQLManagedInstanceContributor_role_5" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${module.applicationrg.resource_group_name}/providers/Microsoft.Sql/managedInstances/${var.managedInstanceName}"
  role_definition_id = azurerm_role_definition.CustomSQLManagedInstanceContributor.id
  principal_id       = data.azuread_service_principal.kipqa_sp[0].id
}

resource "azurerm_role_assignment" "CustomSQLManagedInstanceContributor_role_6" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${module.applicationrg.resource_group_name}/providers/Microsoft.Sql/managedInstances/${var.managedInstanceName}"
  role_definition_id = azurerm_role_definition.CustomSQLManagedInstanceContributor.id
  principal_id       = data.azuread_service_principal.kiprestqa_sp[0].id
}

resource "azurerm_role_assignment" "CustomSQLManagedInstanceContributor_role_7" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${module.applicationrg.resource_group_name}/providers/Microsoft.Sql/managedInstances/${var.managedInstanceName}"
  role_definition_id = azurerm_role_definition.CustomSQLManagedInstanceContributor.id
  principal_id       = data.azuread_service_principal.mep-kipqa_sp[0].id
}

resource "azurerm_role_assignment" "CustomSQLManagedInstanceContributor_role_8" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${module.applicationrg.resource_group_name}/providers/Microsoft.Sql/managedInstances/${var.managedInstanceName}"
  role_definition_id = azurerm_role_definition.CustomSQLManagedInstanceContributor.id
  principal_id       = data.azuread_service_principal.meprest-kipqa_sp[0].id
}

resource "azurerm_role_assignment" "CustomSQLManagedInstanceContributor_role_9" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${module.applicationrg.resource_group_name}/providers/Microsoft.Sql/managedInstances/${var.managedInstanceName}"
  role_definition_id = azurerm_role_definition.CustomSQLManagedInstanceContributor.id
  principal_id       = data.azuread_service_principal.dasnp_sp[0].id
}

resource "azurerm_role_assignment" "CustomSQLManagedInstanceContributor_role_10" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${module.applicationrg.resource_group_name}/providers/Microsoft.Sql/managedInstances/${var.managedInstanceName}"
  role_definition_id = azurerm_role_definition.CustomSQLManagedInstanceContributor.id
  principal_id       = data.azuread_service_principal.dasrestnp_sp[0].id
}

resource "azurerm_role_assignment" "CustomSQLManagedInstanceContributor_role_11" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${module.applicationrg.resource_group_name}/providers/Microsoft.Sql/managedInstances/${var.managedInstanceName}"
  role_definition_id = azurerm_role_definition.CustomSQLManagedInstanceContributor.id
  principal_id       = data.azuread_service_principal.functionapp_dev_sp[0].id
}

resource "azurerm_role_assignment" "CustomSQLManagedInstanceContributor_role_12" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${module.applicationrg.resource_group_name}/providers/Microsoft.Sql/managedInstances/${var.managedInstanceName}"
  role_definition_id = azurerm_role_definition.CustomSQLManagedInstanceContributor.id
  principal_id       = data.azuread_service_principal.functionapp_qa_sp[0].id
}

resource "azurerm_role_assignment" "CustomSQLManagedInstanceContributor_role_13" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${module.applicationrg.resource_group_name}/providers/Microsoft.Sql/managedInstances/${var.managedInstanceName}"
  role_definition_id = azurerm_role_definition.CustomSQLManagedInstanceContributor.id
  principal_id       = data.azuread_service_principal.windows_services_vm_sp.id
}

#Custom SQL DB Contributor Role Assignment
resource "azurerm_role_assignment" "CustomSQLDBContributor_role_1" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0
  
  scope              = module.sqlserver.sql_server_id
  role_definition_id = azurerm_role_definition.CustomSQLDBContributor.id
  principal_id       = data.azuread_service_principal.kipdev_sp[0].id
}

resource "azurerm_role_assignment" "CustomSQLDBContributor_role_2" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = module.sqlserver.sql_server_id
  role_definition_id = azurerm_role_definition.CustomSQLDBContributor.id
  principal_id       = data.azuread_service_principal.kiprestdev_sp[0].id
}

resource "azurerm_role_assignment" "CustomSQLDBContributor_role_3" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = module.sqlserver.sql_server_id
  role_definition_id = azurerm_role_definition.CustomSQLDBContributor.id
  principal_id       = data.azuread_service_principal.mep-kipdev_sp[0].id
}

resource "azurerm_role_assignment" "CustomSQLDBContributor_role_4" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = module.sqlserver.sql_server_id
  role_definition_id = azurerm_role_definition.CustomSQLDBContributor.id
  principal_id       = data.azuread_service_principal.meprest-kipdev_sp[0].id
}

resource "azurerm_role_assignment" "CustomSQLDBContributor_role_5" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = module.sqlserver.sql_server_id
  role_definition_id = azurerm_role_definition.CustomSQLDBContributor.id
  principal_id       = data.azuread_service_principal.kipqa_sp[0].id
}

resource "azurerm_role_assignment" "CustomSQLDBContributor_role_6" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = module.sqlserver.sql_server_id
  role_definition_id = azurerm_role_definition.CustomSQLDBContributor.id
  principal_id       = data.azuread_service_principal.kiprestqa_sp[0].id
}

resource "azurerm_role_assignment" "CustomSQLDBContributor_role_7" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = module.sqlserver.sql_server_id
  role_definition_id = azurerm_role_definition.CustomSQLDBContributor.id
  principal_id       = data.azuread_service_principal.mep-kipqa_sp[0].id
}

resource "azurerm_role_assignment" "CustomSQLDBContributor_role_8" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = module.sqlserver.sql_server_id
  role_definition_id = azurerm_role_definition.CustomSQLDBContributor.id
  principal_id       = data.azuread_service_principal.meprest-kipqa_sp[0].id
}

resource "azurerm_role_assignment" "CustomSQLDBContributor_role_9" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = module.sqlserver.sql_server_id
  role_definition_id = azurerm_role_definition.CustomSQLDBContributor.id
  principal_id       = data.azuread_service_principal.dasnp_sp[0].id
}

resource "azurerm_role_assignment" "CustomSQLDBContributor_role_10" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = module.sqlserver.sql_server_id
  role_definition_id = azurerm_role_definition.CustomSQLDBContributor.id
  principal_id       = data.azuread_service_principal.dasrestnp_sp[0].id
}

resource "azurerm_role_assignment" "CustomSQLDBContributor_role_11" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = module.sqlserver.sql_server_id
  role_definition_id = azurerm_role_definition.CustomSQLDBContributor.id
  principal_id       = data.azuread_service_principal.functionapp_dev_sp[0].id
}

resource "azurerm_role_assignment" "CustomSQLDBContributor_role_12" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0
  
  scope              = module.sqlserver.sql_server_id
  role_definition_id = azurerm_role_definition.CustomSQLDBContributor.id
  principal_id       = data.azuread_service_principal.functionapp_qa_sp[0].id
}

#Custom Key Vault Read Role Assignment
resource "azurerm_role_assignment" "KeyVaultRead_role_1" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = module.keyvault.key_vault_id
  role_definition_id = azurerm_role_definition.KeyVaultRead.id
  principal_id       = data.azuread_service_principal.kipdev_sp[0].id
}

resource "azurerm_role_assignment" "KeyVaultRead_role_2" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = module.keyvault.key_vault_id
  role_definition_id = azurerm_role_definition.KeyVaultRead.id
  principal_id       = data.azuread_service_principal.kiprestdev_sp[0].id
}

resource "azurerm_role_assignment" "KeyVaultRead_role_3" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = module.keyvault.key_vault_id
  role_definition_id = azurerm_role_definition.KeyVaultRead.id
  principal_id       = data.azuread_service_principal.mep-kipdev_sp[0].id
}

resource "azurerm_role_assignment" "KeyVaultRead_role_4" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = module.keyvault.key_vault_id
  role_definition_id = azurerm_role_definition.KeyVaultRead.id
  principal_id       = data.azuread_service_principal.meprest-kipdev_sp[0].id
}

resource "azurerm_role_assignment" "KeyVaultRead_role_5" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = module.keyvault.key_vault_id
  role_definition_id = azurerm_role_definition.KeyVaultRead.id
  principal_id       = data.azuread_service_principal.kipqa_sp[0].id
}

resource "azurerm_role_assignment" "KeyVaultRead_role_6" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = module.keyvault.key_vault_id
  role_definition_id = azurerm_role_definition.KeyVaultRead.id
  principal_id       = data.azuread_service_principal.kiprestqa_sp[0].id
}

resource "azurerm_role_assignment" "KeyVaultRead_role_7" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = module.keyvault.key_vault_id
  role_definition_id = azurerm_role_definition.KeyVaultRead.id
  principal_id       = data.azuread_service_principal.mep-kipqa_sp[0].id
}

resource "azurerm_role_assignment" "KeyVaultRead_role_8" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = module.keyvault.key_vault_id
  role_definition_id = azurerm_role_definition.KeyVaultRead.id
  principal_id       = data.azuread_service_principal.meprest-kipqa_sp[0].id
}

resource "azurerm_role_assignment" "KeyVaultRead_role_9" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = module.keyvault.key_vault_id
  role_definition_id = azurerm_role_definition.KeyVaultRead.id
  principal_id       = data.azuread_service_principal.dasnp_sp[0].id
}

resource "azurerm_role_assignment" "KeyVaultRead_role_10" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0

  scope              = module.keyvault.key_vault_id
  role_definition_id = azurerm_role_definition.KeyVaultRead.id
  principal_id       = data.azuread_service_principal.dasrestnp_sp[0].id
}

resource "azurerm_role_assignment" "KeyVaultRead_role_11" {
  count              = var.target_deployment_environment == "nonprod" ? 1 : 0
  
  scope              = module.keyvault.key_vault_id
  role_definition_id = azurerm_role_definition.KeyVaultRead.id
  principal_id       = data.azuread_service_principal.windows_services_vm_sp.id
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
  scope                = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${module.applicationrg.resource_group_name}/providers/Microsoft.Sql/managedInstances/${var.managedInstanceName}"
  role_definition_name = "Contributor"
  principal_id         = azurerm_kusto_cluster.kipadx.identity[0].principal_id
}


resource "azurerm_role_assignment" "adx_kipadgroup_contribute_access" {
  scope                = azurerm_kusto_cluster.kipadx.id
  role_definition_name = "Contributor"
  principal_id         = azuread_group.KIPADFContributers.id
}

resource "azurerm_kusto_database_principal_assignment" "adx_database_kipadgroup_admin_access" {
  name                = var.adx_database_principal_name
  resource_group_name = module.applicationrg.resource_group_name
  cluster_name        = azurerm_kusto_cluster.kipadx.name
  database_name       = azurerm_kusto_database.adx_database.name

  tenant_id      = data.azurerm_client_config.current.tenant_id
  principal_id   = azuread_group.KIPADFContributers.id
  principal_type = "Group"
  role           = "Admin"
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
  scope                = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${module.applicationrg.resource_group_name}/providers/Microsoft.Sql/managedInstances/${var.managedInstanceName}"
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