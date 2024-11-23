resource "azuread_application" "csp_cyber_portal" {
  display_name                 = "spn-cybersuccessportal"
  sign_in_audience             = "AzureADMyOrg"
  required_resource_access {
    resource_app_id            = "00000003-0000-0000-c000-000000000000"
    resource_access {
      id                       = "e1fe6dd8-ba31-4d61-89e7-88639da4683d"
      type                     = "Scope"
    }
  }

   web {
    redirect_uris = var.spn_redirect_url

    implicit_grant {
      access_token_issuance_enabled = true
      id_token_issuance_enabled     = true
    } 
   } 
}

resource "azuread_service_principal" "spn_csp_cyber_portal" {
  application_id               = azuread_application.csp_cyber_portal.application_id
  app_role_assignment_required = false
}


#cmp-spn-app-registration

resource "azuread_application" "csp_pwr_registration" {
    display_name     = "spn-cybersuccessplatform"
    sign_in_audience = "AzureADMyOrg"
      required_resource_access {
        resource_app_id            = "00000003-0000-0000-c000-000000000000"
        resource_access {
          id                       = "e1fe6dd8-ba31-4d61-89e7-88639da4683d"
          type                     = "Scope"
        }
      } 

      required_resource_access {
        resource_app_id            = "00000007-0000-0000-c000-000000000000"
        resource_access {
          id                       = "78ce3f0f-a1ce-49c2-8cde-64b5c0896db4"
          type                     = "Scope"
      }      
    }
}

resource "azuread_service_principal" "csp_pwr_sp" {
    app_role_assignment_required = false
    application_id               =  azuread_application.csp_pwr_registration.application_id
}