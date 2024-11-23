resource "azuread_application" "CLOWebApplication" {
  name                         = var.environment == "production" ? "CLO WebApplication" : "CLO${upper(var.environment_acronym)}WebApplication"
  homepage                     = var.environment == "production" ? "https://clo.kpmgcloudops.com" : "https://clo${var.cert_environment_acronym}.kpmgcloudops.com"
  reply_urls                   = var.environment == "production" ? ["https://clo.kpmgcloudops.com/signin-oidc","https://localhost/signin-oidc","http://localhost/signin-oidc"] : ["https://clo${var.cert_environment_acronym}.kpmgcloudops.com/signin-oidc","https://localhost/signin-oidc"]
  available_to_other_tenants   = false
  oauth2_allow_implicit_flow   = false
  type                         = "webapp/api"

  required_resource_access {
    resource_app_id = "00000003-0000-0000-c000-000000000000"

    resource_access {
      id   = "e1fe6dd8-ba31-4d61-89e7-88639da4683d"
      type = "Scope"
      }
    }
  required_resource_access {
    resource_app_id = "00000002-0000-0000-c000-000000000000"

    resource_access {
      id   = "311a71cc-e848-46a1-bdf8-97ff7156d8e6"
      type = "Scope"
    }
    resource_access {
      id   = "cba73afc-7f69-4d86-8450-4978e04ecd1a"
      type = "Scope"
    }
    resource_access {
      id   = "824c81eb-e3f8-4ee6-8f6d-de7f50d565b7"
      type = "Role"
    }
  }
}

resource "azuread_service_principal" "CLOWebApplication" {
  application_id               = azuread_application.CLOWebApplication.application_id
  app_role_assignment_required = false

  tags                         = ["WindowsAzureActiveDirectoryIntegratedApp"]
}