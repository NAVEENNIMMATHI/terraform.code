resource "azuread_application" "ad_webapp_spi" {
    name                       = var.environment == "production" ? "SPIWebApplication" :"${upper(var.application_acronym)}WebApplication${upper(var.environment_acronym)}"
    available_to_other_tenants = false
    oauth2_allow_implicit_flow = false
    public_client              = false
    reply_urls                 = ["https://localhost/signin-oidc","https://${lower(var.application_acronym)}${lower(var.environment_acronym_agw)}.kpmgcloudops.com/signin-oidc"]
    
    type                       = "webapp/api"
   required_resource_access {
        resource_app_id = "00000002-0000-0000-c000-000000000000"   //app id of the Graph API in all tenants.

        resource_access {
            id   = "311a71cc-e848-46a1-bdf8-97ff7156d8e6" //Sign in and read user profile
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

resource "azuread_service_principal" "ad_spiapp_web" {
    app_role_assignment_required = true
    application_id               =   azuread_application.ad_webapp_spi.application_id
        tags                         = [
        "WindowsAzureActiveDirectoryIntegratedApp",
    ]

}
resource "azuread_application" "ad_restapp_spi" {
    name                       = var.environment == "production" ? "SPIRestApplication" :"${upper(var.application_acronym)}RestApplication${upper(var.environment_acronym)}"
    available_to_other_tenants = false
    oauth2_allow_implicit_flow = false
    public_client              = false
    reply_urls                 = ["https://localhost/signin-oidc","https://${lower(var.application_acronym)}rest${lower(var.environment_acronym_agw)}.kpmgcloudops.com/signin-oidc"]
    
    type                       = "webapp/api"
   
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
    }
}

resource "azuread_service_principal" "ad_spiapp_rest" {
    app_role_assignment_required = true
    application_id               =   azuread_application.ad_restapp_spi.application_id
        tags                         = [
        "WindowsAzureActiveDirectoryIntegratedApp",
    ]

}