#####REST Apps####

resource "azuread_application" "ad_restapp_test" {
  name                       = "${var.application_acronym}rest${var.environment_type_test}Application"
  homepage                   = "https://homepage"
  reply_urls                 = ["https://${lower(var.application_acronym)}rest${lower(var.environment_type_test)}.kpmgcloudops.com/signin-oidc","https://localhost:44333/signin-oidc"]
  identifier_uris            = ["https://${var.tenant_fqdn}/${var.application_acronym}rest${var.environment_type_test}Application"]
  available_to_other_tenants = false
  oauth2_allow_implicit_flow = true
  public_client              = false
  type                       = "webapp/api"
  count                      = var.restrict_gateway_endpoint == "true" ? 0 : 1
  oauth2_permissions {
                  admin_consent_description  = "My API access"
                  admin_consent_display_name = "My API access"
                  is_enabled                 = true
                  type                       = "User"
                  value                      = "access_as_user"
              }
  oauth2_permissions {
            admin_consent_description        = "Allow the application to access ${var.application_acronym}rest${var.environment_type_test}Application on behalf of the signed-in user."
            admin_consent_display_name       = "Access ${var.application_acronym}rest${var.environment_type_test}Application"
            is_enabled                       = true
            type                             = "User"
            user_consent_description         = "Allow the application to access ${var.application_acronym}rest${var.environment_type_test}Application on your behalf."
            user_consent_display_name        = "Access ${var.application_acronym}rest${var.environment_type_test}Application"
            value                            = "user_impersonation"
        }

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

resource "azuread_service_principal" "ad_restapp_test" {
  application_id               = azuread_application.ad_restapp_test[0].application_id
  app_role_assignment_required = false
  count                        = var.restrict_gateway_endpoint == "true" ? 0 : 1
}

####

resource "azuread_application" "ad_restapp_final" {
  name                       = "${var.application_acronym}rest${var.environment_type_final}Application"
  homepage                   = "https://homepage"
  reply_urls                 = ["https://${lower(var.application_acronym)}rest${lower(var.environment_type_final)}.kpmgcloudops.com/signin-oidc"]
  identifier_uris            = ["https://${var.tenant_fqdn}/${var.application_acronym}rest${var.environment_type_final}Application"]
  public_client              = false
  available_to_other_tenants = false
  oauth2_allow_implicit_flow = true
  type                       = "webapp/api"
  oauth2_permissions {
            admin_consent_description        = "Allow the application to access ${var.application_acronym}rest${var.environment_type_final}Application on behalf of the signed-in user."
            admin_consent_display_name       = "Access ${var.application_acronym}rest${var.environment_type_final}Application"
            is_enabled                       = true
            type                             = "User"
            user_consent_description         = "Allow the application to access ${var.application_acronym}rest${var.environment_type_final}Application on your behalf."
            user_consent_display_name        = "Access ${var.application_acronym}rest${var.environment_type_final}Application"
            value                            = "user_impersonation"
        }
        oauth2_permissions {
            admin_consent_description  = "My API access"
            admin_consent_display_name = "My API access"
            is_enabled                 = true
            type                       = "User"
            user_consent_description   = ""
            user_consent_display_name  = ""
            value                      = "access_as_user"
        }

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

resource "azuread_service_principal" "ad_restapp_final" {
  application_id               = azuread_application.ad_restapp_final.application_id
  app_role_assignment_required = false
}

####

resource "azuread_application" "ad_restumt_test" {
  name                       = "umtrest${var.environment_type_test}Application"
  homepage                   = "https://homepage"
  reply_urls                 = ["https://umtrest${lower(var.environment_type_test)}.kpmgcloudops.com/signin-oidc"]
  identifier_uris            = ["https://${var.tenant_fqdn}/umtrest${var.environment_type_test}Application"]
  available_to_other_tenants = false
  oauth2_allow_implicit_flow = true
  public_client              = false
  type                       = "webapp/api"
  count                      = var.restrict_gateway_endpoint == "true" ? 0 : 1
  oauth2_permissions {
            admin_consent_description        = "Allow the application to access umtrest${var.environment_type_test}Application on behalf of the signed-in user."
            admin_consent_display_name       = "Access umtrest${var.environment_type_test}Application"
            is_enabled                       = true
            type                             = "User"
            user_consent_description         = "Allow the application to access umtrest${var.environment_type_test}Application on your behalf."
            user_consent_display_name        = "Access umtrest${var.environment_type_test}Application"
            value                            = "user_impersonation"
        }
        oauth2_permissions {
                  admin_consent_description  = "My API access"
                  admin_consent_display_name = "My API access"
                  is_enabled                 = true
                  type                       = "User"
                  value                      = "access_as_user"
              }

  required_resource_access {
          resource_app_id = "00000003-0000-0000-c000-000000000000"

          resource_access {
              id   = "7ab1d382-f21e-4acd-a863-ba3e13f7da61"
              type = "Role"
            }
        }
}

resource "azuread_service_principal" "ad_restumt_test" {
  application_id               = azuread_application.ad_restumt_test[0].application_id
  app_role_assignment_required = false
  count                        = var.restrict_gateway_endpoint == "true" ? 0 : 1
}

#####

resource "azuread_application" "ad_restumt_final" {
  name                       = "umtrest${var.environment_type_final}Application"
  homepage                   = "https://homepage"
  reply_urls                 = ["https://umtrest${lower(var.environment_type_final)}.kpmgcloudops.com/signin-oidc"]
  identifier_uris            = ["https://${var.tenant_fqdn}/umtrest${var.environment_type_final}Application"]
  available_to_other_tenants = false
  oauth2_allow_implicit_flow = true
  public_client              = false
  type                       = "webapp/api"
  oauth2_permissions {
            admin_consent_description        = "Allow the application to access umtrest${var.environment_type_final}Application on behalf of the signed-in user."
            admin_consent_display_name       = "Access umtrest${var.environment_type_final}Application"
            is_enabled                       = true
            type                             = "User"
            user_consent_description         = "Allow the application to access umtrest${var.environment_type_final}Application on your behalf."
            user_consent_display_name        = "Access umtrest${var.environment_type_final}Application"
            value                            = "user_impersonation"
        }
        oauth2_permissions {
                  admin_consent_description  = "My API access"
                  admin_consent_display_name = "My API access"
                  is_enabled                 = true
                  type                       = "User"
                  value                      = "access_user"
              }

  required_resource_access {
          resource_app_id = "00000003-0000-0000-c000-000000000000"
          resource_access {
              id   = "7ab1d382-f21e-4acd-a863-ba3e13f7da61"
              type = "Role"
            }
        }
}

resource "azuread_service_principal" "ad_restumt_final" {
  application_id               = azuread_application.ad_restumt_final.application_id
  app_role_assignment_required = false
}

