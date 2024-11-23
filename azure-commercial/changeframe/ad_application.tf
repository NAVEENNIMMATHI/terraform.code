resource "azuread_application" "test_application" {
  count               = var.restrict_gateway_endpoint == "true" ? 0 : 1

  name                       = "${var.app_service_name_test}Application"
  homepage                   = "https://homepage"
  reply_urls                 = ["http://localhost/signin-oidc","https://${var.app_service_name_test}.kpmgcloudops.com/signin-oidc","https://${var.app_service_name_final}.kpmgcloudops.com/signin-oidc"]
  logout_url                 = "https://${var.app_service_name_test}.kpmgcloudops.com/logout"
  available_to_other_tenants = false
  oauth2_allow_implicit_flow = true
  type                       = "webapp/api"

  required_resource_access {
    resource_app_id = "00000002-0000-0000-c000-000000000000"

    resource_access {
      id   = "311a71cc-e848-46a1-bdf8-97ff7156d8e6"
      type = "Scope"
    }
  }
}

resource "azuread_service_principal" "test_application" {
  count               = var.restrict_gateway_endpoint == "true" ? 0 : 1

  application_id               = azuread_application.test_application[0].application_id
  
  app_role_assignment_required = false
}

#-------------------#

resource "azuread_application" "final_application" {
  name                       = "${var.app_service_name_final}Application"
  homepage                   = "https://${var.app_service_name_final}.kpmgcloudops.com"
  reply_urls                 = ["https://${var.app_service_name_final}.kpmgcloudops.com/signin-oidc","https://${var.app_service_name_final}.kpmgcloudops.com/auth/login"]
  #logout_url                 = "https://${var.app_service_name_final}.kpmgcloudops.com/logout"
  available_to_other_tenants = false
  oauth2_allow_implicit_flow = true
  type                       = "webapp/api"

  required_resource_access {
    resource_app_id = "00000002-0000-0000-c000-000000000000"

    resource_access {
      id   = "311a71cc-e848-46a1-bdf8-97ff7156d8e6"
      type = "Scope"
    }
  }

 /* required_resource_access {
    resource_app_id = "00000003-0000-0000-c000-000000000000"

    resource_access {
      id   = "14dad69e-099b-42c9-810b-d002981feec1"
      type = "Scope"
    }
    resource_access {
      id   = "64a6cdd6-aab1-4aaf-94b8-3cc8405e90d0"
      type = "Scope"
    }
    resource_access {
      id   = "37f7f235-527c-4136-accd-4a02d197296e"
      type = "Scope"
    }
  } */

}

resource "azuread_service_principal" "final_application" {
  application_id               = azuread_application.final_application.application_id
  app_role_assignment_required = false
  tags                         = [
           "apiConsumer",
           "notApiConsumer",
           "singlePageApp",
           "webApi"
        ] 
}