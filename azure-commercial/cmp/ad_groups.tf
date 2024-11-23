resource "azuread_group" "client_app_user" {
  display_name = "${upper(var.application_acronym)}-APP-CLIENT-${upper(var.environment_acronym)}"
  # mail_enabled     = true
  security_enabled = true
  # mail_nickname    = "CMPAPP"
  # types            = ["Unified"]

}

/*resource "azuread_group" "mdp_rg_contributors" {
  name = "CO-${upper(var.application_acronym)}-RG-Contributors-${upper(var.environment_acronym)}"
}
*/

/*resource "azurerm_role_assignment" "mdp_rg_contributors_role" {
  scope                = "${data.azurerm_subscription.current.id}/resourceGroups/${module.mdp_rg_main.resource_group_name}"
  role_definition_name = "Contributor"
  principal_id         = azuread_group.mdp_rg_contributors.object_id
}
*/

resource "azuread_group" "cmp_admins" {
  display_name  = "CO-${upper(var.application_acronym)}-ADMIN-${upper(var.environment_acronym)}"
  # mail_enabled     = true
  security_enabled = true
  # mail_nickname    = "CMPADMIN"
  # types            = ["Unified"]

}

# One group per tenant per application role

# Application_Owner
resource "azuread_group" "cmp_application_owner" {
  for_each            = var.cmp_clients
  display_name        = "CO-${upper(var.application_acronym)}-${upper(each.key)}-APPLICATION-OWNER-${upper(var.environment_acronym)}"
  security_enabled    = true
}

resource "azuread_app_role_assignment" "cmp_application_owner_spa" {
  for_each            = var.cmp_clients
  app_role_id         = azuread_service_principal.cmp_spa_sp[each.key].app_role_ids["Application_Owner"]
  principal_object_id = azuread_group.cmp_application_owner[each.key].object_id
  resource_object_id  = azuread_service_principal.cmp_spa_sp[each.key].object_id
}

resource "azuread_app_role_assignment" "cmp_application_owner_api" {
  for_each            = var.cmp_clients
  app_role_id         = azuread_service_principal.cmp_api_sp[each.key].app_role_ids["Application_Owner"]
  principal_object_id = azuread_group.cmp_application_owner[each.key].object_id
  resource_object_id  = azuread_service_principal.cmp_api_sp[each.key].object_id
}

# Client_Stakeholder
resource "azuread_group" "cmp_client_stakeholder" {
  for_each            = var.cmp_clients
  display_name        = "CO-${upper(var.application_acronym)}-${upper(each.key)}-CLIENT-STAKEHOLDER-${upper(var.environment_acronym)}"
  security_enabled    = true
}

resource "azuread_app_role_assignment" "cmp_client_stakeholder_spa" {
  for_each            = var.cmp_clients
  app_role_id         = azuread_service_principal.cmp_spa_sp[each.key].app_role_ids["Client_Stakeholder"]
  principal_object_id = azuread_group.cmp_client_stakeholder[each.key].object_id
  resource_object_id  = azuread_service_principal.cmp_spa_sp[each.key].object_id
}

resource "azuread_app_role_assignment" "cmp_client_stakeholder_api" {
  for_each            = var.cmp_clients
  app_role_id         = azuread_service_principal.cmp_api_sp[each.key].app_role_ids["Client_Stakeholder"]
  principal_object_id = azuread_group.cmp_client_stakeholder[each.key].object_id
  resource_object_id  = azuread_service_principal.cmp_api_sp[each.key].object_id
}

# Orchestrator_Admin
resource "azuread_group" "cmp_orchestrator_admin" {
  for_each            = var.cmp_clients
  display_name        = "CO-${upper(var.application_acronym)}-${upper(each.key)}-ORCHESTRATOR-ADMIN-${upper(var.environment_acronym)}"
  security_enabled    = true
}

resource "azuread_app_role_assignment" "cmp_orchestrator_admin_spa" {
  for_each            = var.cmp_clients
  app_role_id         = azuread_service_principal.cmp_spa_sp[each.key].app_role_ids["Orchestrator_Admin"]
  principal_object_id = azuread_group.cmp_orchestrator_admin[each.key].object_id
  resource_object_id  = azuread_service_principal.cmp_spa_sp[each.key].object_id
}

resource "azuread_app_role_assignment" "cmp_orchestrator_admin_api" {
  for_each            = var.cmp_clients
  app_role_id         = azuread_service_principal.cmp_api_sp[each.key].app_role_ids["Orchestrator_Admin"]
  principal_object_id = azuread_group.cmp_orchestrator_admin[each.key].object_id
  resource_object_id  = azuread_service_principal.cmp_api_sp[each.key].object_id
}

# Migration_Project_Developer
resource "azuread_group" "cmp_migration_project_developer" {
  for_each            = var.cmp_clients
  display_name        = "CO-${upper(var.application_acronym)}-${upper(each.key)}-MIGRATION-PROJECT-DEVELOPER-${upper(var.environment_acronym)}"
  security_enabled    = true
}

resource "azuread_app_role_assignment" "cmp_migration_project_developer_spa" {
  for_each            = var.cmp_clients
  app_role_id         = azuread_service_principal.cmp_spa_sp[each.key].app_role_ids["Migration_Project_Developer"]
  principal_object_id = azuread_group.cmp_migration_project_developer[each.key].object_id
  resource_object_id  = azuread_service_principal.cmp_spa_sp[each.key].object_id
}

resource "azuread_app_role_assignment" "cmp_migration_project_developer_api" {
  for_each            = var.cmp_clients
  app_role_id         = azuread_service_principal.cmp_api_sp[each.key].app_role_ids["Migration_Project_Developer"]
  principal_object_id = azuread_group.cmp_migration_project_developer[each.key].object_id
  resource_object_id  = azuread_service_principal.cmp_api_sp[each.key].object_id
}

# Migration_Project_Lead
resource "azuread_group" "cmp_migration_project_lead" {
  for_each            = var.cmp_clients
  display_name        = "CO-${upper(var.application_acronym)}-${upper(each.key)}-MIGRATION-PROJECT-LEAD-${upper(var.environment_acronym)}"
  security_enabled    = true
}

resource "azuread_app_role_assignment" "cmp_migration_project_lead_spa" {
  for_each            = var.cmp_clients
  app_role_id         = azuread_service_principal.cmp_spa_sp[each.key].app_role_ids["Migration_Project_Lead"]
  principal_object_id = azuread_group.cmp_migration_project_lead[each.key].object_id
  resource_object_id  = azuread_service_principal.cmp_spa_sp[each.key].object_id
}

resource "azuread_app_role_assignment" "cmp_migration_project_lead_api" {
  for_each            = var.cmp_clients
  app_role_id         = azuread_service_principal.cmp_api_sp[each.key].app_role_ids["Migration_Project_Lead"]
  principal_object_id = azuread_group.cmp_migration_project_lead[each.key].object_id
  resource_object_id  = azuread_service_principal.cmp_api_sp[each.key].object_id
}

# Data_Administrator
resource "azuread_group" "cmp_data_administrator" {
  for_each            = var.cmp_clients
  display_name        = "CO-${upper(var.application_acronym)}-${upper(each.key)}-DATA-ADMINISTRATOR-${upper(var.environment_acronym)}"
  security_enabled    = true
}

resource "azuread_app_role_assignment" "cmp_data_administrator_spa" {
  for_each            = var.cmp_clients
  app_role_id         = azuread_service_principal.cmp_spa_sp[each.key].app_role_ids["Data_Administrator"]
  principal_object_id = azuread_group.cmp_data_administrator[each.key].object_id
  resource_object_id  = azuread_service_principal.cmp_spa_sp[each.key].object_id
}

resource "azuread_app_role_assignment" "cmp_data_administrator_api" {
  for_each            = var.cmp_clients
  app_role_id         = azuread_service_principal.cmp_api_sp[each.key].app_role_ids["Data_Administrator"]
  principal_object_id = azuread_group.cmp_data_administrator[each.key].object_id
  resource_object_id  = azuread_service_principal.cmp_api_sp[each.key].object_id
}

# Data_Base_Access
resource "azuread_group" "cmp_data_base_access" {
  for_each            = var.cmp_clients
  display_name        = "CO-${upper(var.application_acronym)}-${upper(each.key)}-DB-ACCESS-${upper(var.environment_acronym)}"
  security_enabled    = true

  members = [

    element(module.buildvm_cmp_client[each.key].vm_identity_id,0)

  ]
}
