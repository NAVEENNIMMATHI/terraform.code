#####REST Apps####

resource "azuread_application" "ad_app_rest" {
  name                       = "${var.application_acronym}rest${var.app_gateway_environment_acronym}Application"
  homepage                   = "https://homepage"
  reply_urls                 = ["http://localhost:4201/", "http://localhost:4201/signin-oidc", "https://localhost:4201/signin-oidc", "https://${lower(var.application_acronym)}rest${lower(var.app_gateway_environment_acronym)}.kpmgcloudops.com/signin-oidc", "https://${lower(var.application_acronym)}${lower(var.app_gateway_environment_acronym)}.kpmgcloudops.com/", "https://${lower(var.application_acronym)}${lower(var.app_gateway_environment_acronym)}.kpmgcloudops.com/signin-oidc"]
  identifier_uris            = ["https://${var.tenant_fqdn}/${var.application_acronym}rest${var.app_gateway_environment_acronym}Application"]
  available_to_other_tenants = false
  oauth2_allow_implicit_flow = true
  public_client              = false
  type                       = "webapp/api"
  ###count                      = var.restrict_gateway_endpoint == "true" ? 0 : 1

  /*
  oauth2_permissions {
                  admin_consent_description  = "My API access"
                  admin_consent_display_name = "My API access"
                  is_enabled                 = true
                  type                       = "User"
                  value                      = "access_as_user"
              }
  oauth2_permissions {
            admin_consent_description        = "Allow the application to access ${var.application_acronym}rest${var.app_gateway_environment_acronym}Application on behalf of the signed-in user."
            admin_consent_display_name       = "Access ${var.application_acronym}rest${var.app_gateway_environment_acronym}Application"
            is_enabled                       = true
            type                             = "User"
            user_consent_description         = "Allow the application to access ${var.application_acronym}rest${var.app_gateway_environment_acronym}Application on your behalf."
            user_consent_display_name        = "Access ${var.application_acronym}rest${var.app_gateway_environment_acronym}Application"
            value                            = "user_impersonation"
        }
*/
  required_resource_access {
    resource_app_id = "00000003-0000-0000-c000-000000000000"

    resource_access {
      id   = "7ab1d382-f21e-4acd-a863-ba3e13f7da61"
      type = "Role"
    }
  }

  required_resource_access {
    resource_app_id = "00000002-0000-0000-c000-000000000000"

    resource_access {
      id   = "311a71cc-e848-46a1-bdf8-97ff7156d8e6"
      type = "Scope"
    }
  }
}

resource "azuread_service_principal" "ad_app_rest" {
  application_id               = azuread_application.ad_app_rest.application_id #removed [0] from here
  app_role_assignment_required = false
  ###count                        = var.restrict_gateway_endpoint == "true" ? 0 : 1
}
