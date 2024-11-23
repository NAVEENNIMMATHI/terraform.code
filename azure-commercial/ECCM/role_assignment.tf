# ECCM assignment for Storage
resource "azurerm_role_assignment" "eccm_storage_contributor" {
  scope                            = azurerm_storage_account.eccm_app.id
  role_definition_name             = "Contributor"
  #principal_id                     = azurerm_user_assigned_identity.eccm_manageid.id
  principal_id                     = azuread_group.storage_eccm_con.object_id
}

### Assignment to kvl
resource "azurerm_role_assignment" "eccm_kvl_contributor_role" {
  scope                = azurerm_key_vault.eccm_key_vault.id
  role_definition_name = "Contributor"
  principal_id         = azuread_group.kvl_users.object_id
}

### Assignment to ECCM ACR
resource "azurerm_role_assignment" "eccm_acr_contributor_role" {
  scope                = azurerm_container_registry.eccmacr.id
  role_definition_name = "AcrPull"
  principal_id         = azuread_group.aks_admins.object_id
}

### Assignment to ECCM SQL
resource "azurerm_role_assignment" "eccm_sql_contributor_role" {
  scope                = azurerm_mssql_database.eccm_sqldatabase.id
  role_definition_name = "Contributor"
  principal_id         = azuread_group.sql_contributors.object_id
}

### Assignment to Logic App - Website role
  resource "azurerm_role_assignment" "eccm_website_contributor_role" {
  # name									= "web-usc-${var.application_acronym}-${var.environment_acronym}"
  scope                					=  azurerm_logic_app_standard.eccm_logic_app.id
  role_definition_name = "Website Contributor"
  principal_id         				= azuread_group.lap_contributors.object_id								
}

### Assignment to Function App - Website role
  resource "azurerm_role_assignment" "eccm_fun_contributor_role" {
  # name									= "fun-usc-${var.application_acronym}-${var.environment_acronym}"
  scope                					=  azurerm_logic_app_standard.eccm_logic_app.id
  role_definition_name = "Website Contributor"
  principal_id         				= azuread_group.lap_contributors.object_id								
}

### Assignment to Logic App - Storage Queue Data Contributor
  resource "azurerm_role_assignment" "eccm_lap_que_contributor" {
  # name									= "fun-usc-${var.application_acronym}-${var.environment_acronym}"
  scope                					=  azurerm_storage_account.eccm_app.id
  role_definition_name = "Storage Queue Data Contributor"
  principal_id         				=  azurerm_logic_app_standard.eccm_logic_app.identity[0].principal_id								
}

