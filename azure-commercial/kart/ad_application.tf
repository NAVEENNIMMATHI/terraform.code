resource "azuread_application" "KRTWebapplication" {
  name                       = "KRTWebApplication${title(var.application_url_environment_acronym)}"
  reply_urls                 = var.environment == "development" ? ["https://kart${var.application_url_environment_acronym}.kpmgcloudops.com/CentralHome","https://kart${var.application_url_environment_acronym}.kpmgcloudops.com/signin-oidc","http://localhost:52321/signout-oidc","http://localhost:52321/signin-oidc","http://localhost:52321/CentralHome"] : ["https://kart${var.application_url_environment_acronym}.kpmgcloudops.com/CentralHome","https://kart${var.application_url_environment_acronym}.kpmgcloudops.com/signin-oidc"]
  available_to_other_tenants = false
  oauth2_allow_implicit_flow = true
  type                       = "webapp/api"

  required_resource_access {
    resource_app_id = "00000003-0000-0000-c000-000000000000"

    resource_access {
      id   = "e1fe6dd8-ba31-4d61-89e7-88639da4683d"
      type = "Scope"
    }
  }
}

resource "azuread_service_principal" "KRTWebapplication" {
  application_id               = azuread_application.KRTWebapplication.application_id
  app_role_assignment_required = false

  tags                         = ["WindowsAzureActiveDirectoryIntegratedApp"]
}