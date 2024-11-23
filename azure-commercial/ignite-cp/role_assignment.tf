resource "azurerm_role_assignment" "ign_limited_storage_access" {
  scope                = module.ignite_stg.id
  role_definition_id=azurerm_role_definition.limited_stgreadlist_role.role_definition_resource_id
  principal_id         = azuread_group.jupservergroup.object_id
}


resource "azurerm_role_assignment" "storageblobdata_container" {
  scope                = azurerm_storage_container.ign_dbsciencetist_con.resource_manager_id
  role_definition_name =  "Storage Blob Data Contributor"
  principal_id         = azuread_group.jupservergroup.object_id
}

resource "azurerm_role_assignment" "crisis_planning_data_scientists" {
  scope                = module.ignite_stg.id
  #role_definition_name =  "Storage Account Data Contributor"
  role_definition_id=azurerm_role_definition.crisis_planning_data_scientists_role.role_definition_resource_id
  principal_id         = azuread_group.data_contributor_group.object_id
}

resource "azurerm_role_assignment" "crisis_planning_users" {
  scope                = module.ignite_stg.id
  #role_definition_name =  "Storage Account Data Contributor"
  role_definition_id =  azurerm_role_definition.crisis_planning_users_role.role_definition_resource_id
  principal_id         = azuread_group.crisis_planning_user.object_id
}

resource "azurerm_role_assignment" "storageblob_container_user" {
  scope                = module.ignite_stg.id
  role_definition_name =  "Storage Blob Data Contributor"
  principal_id         = azuread_group.crisis_planning_user.object_id
}

resource "azurerm_role_assignment" "storageblob_container_datascience" {
  scope                = module.ignite_stg.id
  role_definition_name =  "Storage Blob Data Contributor"
  principal_id         = azuread_group.data_contributor_group.object_id
}


