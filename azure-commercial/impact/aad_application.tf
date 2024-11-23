resource "azuread_application" "ad_impact_apim" {
    name                       = "IMPACT APIM${upper(var.environment_acronym)}"
    available_to_other_tenants = false
    oauth2_allow_implicit_flow = true
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
}

resource "azuread_service_principal" "ad_impact_apim" {
    app_role_assignment_required = false
    application_id               =   azuread_application.ad_impact_apim.application_id
        tags                         = [
        "WindowsAzureActiveDirectoryIntegratedApp",
    ]

}


resource "azuread_application" "ad_impact_app" {
    name                       = "spn-impact-azureapp-${(var.environment_acronym)}"
    available_to_other_tenants = false
    oauth2_allow_implicit_flow = true
    public_client              = false
    reply_urls                 = ["http://localhost:4200", "https://${var.webapp_cert_name}" ]
    
    type                       = "webapp/api"
   
    required_resource_access {
        resource_app_id = "00000003-0000-0000-c000-000000000000"
         resource_access {
            id   = "e1fe6dd8-ba31-4d61-89e7-88639da4683d" //Sign in and read user profile
            type = "Scope"
        }
    }
}

resource "azuread_service_principal" "ad_impact_app" {
    app_role_assignment_required = false
    application_id               =   azuread_application.ad_impact_app.application_id
        tags                         = [
        "WindowsAzureActiveDirectoryIntegratedApp",
    ]

}
