resource "azuread_application" "ad_webapp_spipaas_central" {
    name                       = var.environment == "production" ? "SPIPAASWebApplication" :"${upper(var.application_acronym)}WebApplication${upper(var.environment_acronym)}"
    available_to_other_tenants = false
    oauth2_allow_implicit_flow = false
    public_client              = false
    reply_urls                 = ["https://localhost/signin-oidc","https://${lower(var.application_name)}${lower(var.app_url_acronym)}.kpmgcloudops.com/signin-oidc"]
    
    type                       = "webapp/api"
   required_resource_access {
        resource_app_id = "00000002-0000-0000-c000-000000000000"   //app id of the Graph API in all tenants.

        resource_access {
            id   = "311a71cc-e848-46a1-bdf8-97ff7156d8e6" //Sign in and read user profile
            type = "Scope"
        }
    }
     required_resource_access {
        resource_app_id = azuread_application.ad_restapp_spipaas_central.application_id   //app id rest application

        resource_access {
            id   = var.rest_app_id //Sign in and read user profile
            type = "Scope"
        }
    }
    required_resource_access {
        resource_app_id = "00000003-0000-0000-c000-000000000000"

        resource_access {
            id   = "37f7f235-527c-4136-accd-4a02d197296e" //Microsoft graph sign users in 
            type = "Scope"
        }
        resource_access {
            id   = "e1fe6dd8-ba31-4d61-89e7-88639da4683d" //Sign in and read user profile
            type = "Scope"
        }
        resource_access {
            id   = "14dad69e-099b-42c9-810b-d002981feec1" //View users basic profile
            type = "Scope"
        }
        resource_access {
            id   = "64a6cdd6-aab1-4aaf-94b8-3cc8405e90d0" //View users email address
            type = "Scope"
        }
    }
}

resource "azuread_service_principal" "ad_spipaas_central_app_web" {
    app_role_assignment_required = true
    application_id               =   azuread_application.ad_webapp_spipaas_central.application_id
        tags                         = [
        "WindowsAzureActiveDirectoryIntegratedApp",
    ]

}
resource "azuread_application" "ad_restapp_spipaas_central" {
    name                       = var.environment == "production" ? "SPIPAASRestApplication" :"${upper(var.application_acronym)}RestApplication${upper(var.environment_acronym)}"
    available_to_other_tenants = false
    oauth2_allow_implicit_flow = false
    public_client              = false
    reply_urls                 = ["https://localhost/signin-oidc","https://${lower(var.application_name)}rest${lower(var.app_url_acronym)}.kpmgcloudops.com/signin-oidc"]
    
    type                       = "webapp/api"
   
    required_resource_access {
        resource_app_id = "00000003-0000-0000-c000-000000000000"
         resource_access {
            id   = "e1fe6dd8-ba31-4d61-89e7-88639da4683d" //Sign in and read user profile
            type = "Scope"
        }
    }
}

resource "azuread_service_principal" "ad_spipaas_central_app_rest" {
    app_role_assignment_required = false
    application_id               =   azuread_application.ad_restapp_spipaas_central.application_id
        tags                         = [
        "WindowsAzureActiveDirectoryIntegratedApp",
    ]

}
resource "azuread_application" "spipaas_dtf" {
    name                       = "SPIPAAS DataFactory${upper(var.environment)}"
    available_to_other_tenants = false
    oauth2_allow_implicit_flow = false
    homepage                   = "https://homepage"
    public_client              = false
    #reply_urls                 = [""]
    
    type                       = "webapp/api"
   
    required_resource_access {
        resource_app_id = "00000003-0000-0000-c000-000000000000"

         resource_access {
            id   = "e1fe6dd8-ba31-4d61-89e7-88639da4683d" //Sign in and read user profile
            type = "Scope"
        }
    }
    
    required_resource_access {
        resource_app_id = "00000009-0000-0000-c000-000000000000"
        
         resource_access {
            id   = "652d7d02-6ff0-4cf7-9516-cf77d33a3ae4"
            type = "Scope"
        }
         resource_access {
            id   = "199f155b-cccd-4be4-bbe6-ca9a867b24b4"
            type = "Scope"
        }
         resource_access {
            id   = "dbe6434c-63f0-42bb-be8e-122ec1bad4d2"
            type = "Scope"
        }
         resource_access {
            id   = "f9759906-80a4-4f4a-b010-24b832bc6a30"
            type = "Scope"
        }
         resource_access {
            id   = "ddd37690-e119-40c5-a821-3746ea6125c4"
            type = "Scope"
        }
         resource_access {
            id   = "8b01a991-5a5a-47f8-91a2-84d6bfd72c02"
            type = "Scope"
        }
         resource_access {
            id   = "b271f05e-8329-4b97-baa4-91cf15b99cf1"
            type = "Scope"
        }
         resource_access {
            id   = "2448370f-f988-42cd-909c-6528efd67c1a"
            type = "Scope"
        }
         resource_access {
            id   = "7f33e027-4039-419b-938e-2f8ca153e68e"
            type = "Scope"
        }
         resource_access {
            id   = "322b68b2-0804-416e-86a5-d772c567b6e6"
            type = "Scope"
        }
         resource_access {
            id   = "4ae1bf56-f562-4747-b7bc-2fa0874ed46f"
            type = "Scope"
        }
         resource_access {
            id   = "7504609f-c495-4c64-8542-686125a5a36f"
            type = "Scope"
        }
        resource_access {
            id   = "d2e42f6b-2baf-4ff4-83ef-51e66321516e"
            type = "Scope"
        }
        resource_access {
            id   = "445002fb-a6f2-4dc1-a81e-4254a111cd29"
            type = "Scope"
        }
        resource_access {
            id   = "b2f1b2fa-f35c-407c-979c-a858a808ba85"
            type = "Scope"
        }

    }
}

resource "azuread_service_principal" "spipaas_dtf" {
    app_role_assignment_required = false
    application_id               =   azuread_application.spipaas_dtf.application_id
        tags                         = [
        "WindowsAzureActiveDirectoryIntegratedApp",
    ]

}