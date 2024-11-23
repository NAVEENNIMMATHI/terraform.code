#Custom Storage Account Contributor Role Assignments
resource "azurerm_role_assignment" "Staging_CustomStorageAccountContributor_role_1" {
  count              = var.target_deployment_environment == "staging" ? 1 : 0
  
  scope              = module.rawandcuratedsa.id
  role_definition_id = azurerm_role_definition.CustomStorageAccountContributor.id
  principal_id       = data.azuread_service_principal.kipuat_sp[0].id
}

resource "azurerm_role_assignment" "Staging_CustomStorageAccountContributor_role_2" {
  count              = var.target_deployment_environment == "staging" ? 1 : 0

  scope              = module.rawandcuratedsa.id
  role_definition_id = azurerm_role_definition.CustomStorageAccountContributor.id
  principal_id       = data.azuread_service_principal.kiprestuat_sp[0].id
}

resource "azurerm_role_assignment" "Staging_CustomStorageAccountContributor_role_3" {
  count              = var.target_deployment_environment == "staging" ? 1 : 0

  scope              = module.rawandcuratedsa.id
  role_definition_id = azurerm_role_definition.CustomStorageAccountContributor.id
  principal_id       = data.azuread_service_principal.mep-kipuat_sp[0].id
}

resource "azurerm_role_assignment" "Staging_CustomStorageAccountContributor_role_4" {
  count              = var.target_deployment_environment == "staging" ? 1 : 0

  scope              = module.rawandcuratedsa.id
  role_definition_id = azurerm_role_definition.CustomStorageAccountContributor.id
  principal_id       = data.azuread_service_principal.meprest-kipuat_sp[0].id
}

resource "azurerm_role_assignment" "Staging_CustomStorageAccountContributor_role_5" {
  count              = var.target_deployment_environment == "staging" ? 1 : 0

  scope              = module.datavaultsa.id
  role_definition_id = azurerm_role_definition.CustomStorageAccountContributor.id
  principal_id       = data.azuread_service_principal.kipuat_sp[0].id
}

resource "azurerm_role_assignment" "Staging_CustomStorageAccountContributor_role_6" {
  count              = var.target_deployment_environment == "staging" ? 1 : 0

  scope              = module.datavaultsa.id
  role_definition_id = azurerm_role_definition.CustomStorageAccountContributor.id
  principal_id       = data.azuread_service_principal.kiprestuat_sp[0].id
}

resource "azurerm_role_assignment" "Staging_CustomStorageAccountContributor_role_7" {
  count              = var.target_deployment_environment == "staging" ? 1 : 0

  scope              = module.datavaultsa.id
  role_definition_id = azurerm_role_definition.CustomStorageAccountContributor.id
  principal_id       = data.azuread_service_principal.mep-kipuat_sp[0].id
}

resource "azurerm_role_assignment" "Staging_CustomStorageAccountContributor_role_8" {
  scope              = module.datavaultsa.id
  role_definition_id = azurerm_role_definition.CustomStorageAccountContributor.id
  principal_id       = data.azuread_service_principal.meprest-kipuat_sp[0].id
  count              = var.target_deployment_environment == "staging" ? 1 : 0
}

resource "azurerm_role_assignment" "Staging_CustomStorageAccountContributor_role_9" {
  count              = var.target_deployment_environment == "staging" ? 1 : 0

  scope              = module.rawandcuratedsa.id
  role_definition_id = azurerm_role_definition.CustomStorageAccountContributor.id
  principal_id       = data.azuread_service_principal.functionapp_uat_sp[0].id
}

resource "azurerm_role_assignment" "Staging_CustomStorageAccountContributor_role_10" {
  count              = var.target_deployment_environment == "staging" ? 1 : 0

  scope              = module.datavaultsa.id
  role_definition_id = azurerm_role_definition.CustomStorageAccountContributor.id
  principal_id       = data.azuread_service_principal.functionapp_uat_sp[0].id
}

#Custom SQL Managed Instance Contributor Role Assignment
resource "azurerm_role_assignment" "Staging_CustomSQLManagedInstanceContributor_role_1" {
  count              = var.target_deployment_environment == "staging" ? 1 : 0

  scope              = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${module.applicationrg.resource_group_name}/providers/Microsoft.Sql/managedInstances/${var.managedInstanceName}"
  role_definition_id = azurerm_role_definition.CustomSQLManagedInstanceContributor.id
  principal_id       = data.azuread_service_principal.kipuat_sp[0].id
}

resource "azurerm_role_assignment" "Staging_CustomSQLManagedInstanceContributor_role_2" {
  count              = var.target_deployment_environment == "staging" ? 1 : 0


  scope              = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${module.applicationrg.resource_group_name}/providers/Microsoft.Sql/managedInstances/${var.managedInstanceName}"
  role_definition_id = azurerm_role_definition.CustomSQLManagedInstanceContributor.id
  principal_id       = data.azuread_service_principal.kiprestuat_sp[0].id
}

resource "azurerm_role_assignment" "Staging_CustomSQLManagedInstanceContributor_role_3" {
  count              = var.target_deployment_environment == "staging" ? 1 : 0

  scope              = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${module.applicationrg.resource_group_name}/providers/Microsoft.Sql/managedInstances/${var.managedInstanceName}"
  role_definition_id = azurerm_role_definition.CustomSQLManagedInstanceContributor.id
  principal_id       = data.azuread_service_principal.mep-kipuat_sp[0].id
}

resource "azurerm_role_assignment" "Staging_CustomSQLManagedInstanceContributor_role_4" {
  count              = var.target_deployment_environment == "staging" ? 1 : 0

  scope              = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${module.applicationrg.resource_group_name}/providers/Microsoft.Sql/managedInstances/${var.managedInstanceName}"
  role_definition_id = azurerm_role_definition.CustomSQLManagedInstanceContributor.id
  principal_id       = data.azuread_service_principal.meprest-kipuat_sp[0].id
}

resource "azurerm_role_assignment" "Staging_CustomSQLManagedInstanceContributor_role_5" {
  count              = var.target_deployment_environment == "staging" ? 1 : 0

  scope              = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${module.applicationrg.resource_group_name}/providers/Microsoft.Sql/managedInstances/${var.managedInstanceName}"
  role_definition_id = azurerm_role_definition.CustomSQLManagedInstanceContributor.id
  principal_id       = data.azuread_service_principal.functionapp_uat_sp[0].id
}

resource "azurerm_role_assignment" "Staging_CustomSQLManagedInstanceContributor_role_6" {
  count              = var.target_deployment_environment == "staging" ? 1 : 0

  scope              = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${module.applicationrg.resource_group_name}/providers/Microsoft.Sql/managedInstances/${var.managedInstanceName}"
  role_definition_id = azurerm_role_definition.CustomSQLManagedInstanceContributor.id
  principal_id       = data.azuread_service_principal.windows_services_vm_sp.id
}

#Custom SQL DB Contributor Role Assignment
resource "azurerm_role_assignment" "Staging_CustomSQLDBContributor_role_1" {
  scope              = module.sqlserver.sql_server_id
  role_definition_id = azurerm_role_definition.CustomSQLDBContributor.id
  principal_id       = data.azuread_service_principal.kipuat_sp[0].id
  count              = var.target_deployment_environment == "staging" ? 1 : 0
}

resource "azurerm_role_assignment" "Staging_CustomSQLDBContributor_role_2" {
  count              = var.target_deployment_environment == "staging" ? 1 : 0

  scope              = module.sqlserver.sql_server_id
  role_definition_id = azurerm_role_definition.CustomSQLDBContributor.id
  principal_id       = data.azuread_service_principal.kiprestuat_sp[0].id
}

resource "azurerm_role_assignment" "Staging_CustomSQLDBContributor_role_3" {
  count              = var.target_deployment_environment == "staging" ? 1 : 0

  scope              = module.sqlserver.sql_server_id
  role_definition_id = azurerm_role_definition.CustomSQLDBContributor.id
  principal_id       = data.azuread_service_principal.mep-kipuat_sp[0].id
}

resource "azurerm_role_assignment" "Staging_CustomSQLDBContributor_role_4" {
  count              = var.target_deployment_environment == "staging" ? 1 : 0

  scope              = module.sqlserver.sql_server_id
  role_definition_id = azurerm_role_definition.CustomSQLDBContributor.id
  principal_id       = data.azuread_service_principal.meprest-kipuat_sp[0].id
}

resource "azurerm_role_assignment" "Staging_CustomSQLDBContributor_role_5" {
  count              = var.target_deployment_environment == "staging" ? 1 : 0

  scope              = module.sqlserver.sql_server_id
  role_definition_id = azurerm_role_definition.CustomSQLDBContributor.id
  principal_id       = data.azuread_service_principal.functionapp_uat_sp[0].id
}

#Custom Key Vault Read Role Assignment
resource "azurerm_role_assignment" "Staging_KeyVaultRead_role_1" {
  count              = var.target_deployment_environment == "staging" ? 1 : 0

  scope              = module.keyvault.key_vault_id
  role_definition_id = azurerm_role_definition.KeyVaultRead.id
  principal_id       = data.azuread_service_principal.kipuat_sp[0].id
}

resource "azurerm_role_assignment" "Staging_KeyVaultRead_role_2" {
  count              = var.target_deployment_environment == "staging" ? 1 : 0

  scope              = module.keyvault.key_vault_id
  role_definition_id = azurerm_role_definition.KeyVaultRead.id
  principal_id       = data.azuread_service_principal.kiprestuat_sp[0].id
}

resource "azurerm_role_assignment" "Staging_KeyVaultRead_role_3" {
  count              = var.target_deployment_environment == "staging" ? 1 : 0

  scope              = module.keyvault.key_vault_id
  role_definition_id = azurerm_role_definition.KeyVaultRead.id
  principal_id       = data.azuread_service_principal.mep-kipuat_sp[0].id
}

resource "azurerm_role_assignment" "Staging_KeyVaultRead_role_4" {
  count              = var.target_deployment_environment == "staging" ? 1 : 0

  scope              = module.keyvault.key_vault_id
  role_definition_id = azurerm_role_definition.KeyVaultRead.id
  principal_id       = data.azuread_service_principal.meprest-kipuat_sp[0].id
}

resource "azurerm_role_assignment" "Staging_KeyVaultRead_role_5" {
  count              = var.target_deployment_environment == "staging" ? 1 : 0

  scope              = module.keyvault.key_vault_id
  role_definition_id = azurerm_role_definition.KeyVaultRead.id
  principal_id       = data.azuread_service_principal.windows_services_vm_sp.id
}

