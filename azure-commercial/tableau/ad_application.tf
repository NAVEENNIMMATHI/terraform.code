resource "azuread_application" "tableau_dashboards" {
  name                         = var.environment == "production" ? "Tableau Dashboards" : "Tableau Dashboards ${upper(var.environment_acronym_aad_app)}"
  reply_urls                   = ["https://dasaviz${var.environment_acronym_aad_app}.kpmgcloudops.com//vizportal/api/web/v1/auth/openIdLogin",
                                  "https://dasaviz${var.environment_acronym_aad_app}.kpmgcloudops.com//vizportal/api/web/v1/openIdLogin",
                                  "https://dasaviz${var.environment_acronym_aad_app}.kpmgcloudops.com/signin-oidc"]
  homepage                     = "https://dasaviz${var.environment_acronym_aad_app}.kpmgcloudops.com/"
  available_to_other_tenants   = false
  oauth2_allow_implicit_flow   = false
  type                         = "webapp/api"
  required_resource_access {
    resource_app_id            = "00000003-0000-0000-c000-000000000000"
    resource_access {
      id                       = "e1fe6dd8-ba31-4d61-89e7-88639da4683d"
      type                     = "Scope"
    }
  }
}

resource "azuread_service_principal" "tableau_dashboards" {
  application_id               = azuread_application.tableau_dashboards.application_id
  app_role_assignment_required = false

  tags                         = ["WindowsAzureActiveDirectoryIntegratedApp"]
}