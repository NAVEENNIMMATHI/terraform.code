resource "azuread_application" "ad-datafactory" {
  name                       = var.environment == "production" ? "datafactory-spn-encryp" : "datafactory-spn-encrypt-${var.environment_acronym}"
  available_to_other_tenants = false
  oauth2_allow_implicit_flow = false
        reply_urls                 = [
            "https://localhost.com",
        ]
         required_resource_access {
           resource_app_id = "00000003-0000-0000-c000-000000000000" 
         resource_access {
               id   = "e1fe6dd8-ba31-4d61-89e7-88639da4683d" 
               type = "Scope"
            }
        }
  
  }


  resource "azuread_service_principal" "ad_app_datafactory" {
  application_id               = azuread_application.ad-datafactory.application_id
  app_role_assignment_required = false
  tags                         = [
           "WindowsAzureActiveDirectoryIntegratedApp"
        ]
  }