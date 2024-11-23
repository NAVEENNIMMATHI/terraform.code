#App registration and service principal for RStudio
resource "azuread_application" "rstudio_sql" {
  name                         = "RSTUSSQLApplication${upper(var.environment_acronym)}"
  homepage                     = "https://homepage"
  reply_urls                   = []
  available_to_other_tenants   = false
  oauth2_allow_implicit_flow   = true
  type                         = "webapp/api"
  required_resource_access {
    resource_app_id            = "00000003-0000-0000-c000-000000000000"
    resource_access {
      id                       = "e1fe6dd8-ba31-4d61-89e7-88639da4683d"
      type                     = "Scope"
    }
  }
}

resource "azuread_service_principal" "rstudio_sql" {
  application_id               = azuread_application.rstudio_sql.application_id
  app_role_assignment_required = false
}

# spn needs access to app db server
resource "azurerm_role_assignment" "spn_app_db_access" {
  scope                = data.azurerm_virtual_machine.spi_app_vm.id
  role_definition_name = "Virtual Machine Contributor"
  principal_id         = azuread_service_principal.rstudio_sql.object_id
}

# spn needs access to user db server
resource "azurerm_role_assignment" "spn_user_db_access" {
  scope                = data.azurerm_virtual_machine.spi_user_vm.id
  role_definition_name = "Virtual Machine Contributor"
  principal_id         = azuread_service_principal.rstudio_sql.object_id
}
