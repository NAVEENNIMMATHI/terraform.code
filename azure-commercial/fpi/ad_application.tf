locals {
  fpi_webapp_name = var.environment == "production" ? "FPIWebapp" : "${upper(var.application_acronym)}Webapp${upper(var.app_environment_acronym)}"
  fpi_url = var.environment == "production" ? "https://fpi.kpmgcloudops.com/signin-oidc" : "https://fpi${var.app_environment_acronym}.kpmgcloudops.com/signin-oidc"
  fpi_proxy_url = var.environment == "production" ? "https://fpiwebapp-kpmgusadvcloudops.msappproxy.net/" : "https://fpi${var.app_environment_acronym}webapp-kpmgusadvcloudops.msappproxy.net/"
  fpi_logout_url = var.environment == "production" ? "https://fpiwebapp-kpmgusadvcloudops.msappproxy.net/?appproxy=logout" : "https://fpi${var.app_environment_acronym}webapp-kpmgusadvcloudops.msappproxy.net/?appproxy=logout"
}

resource "azuread_application" "ad_webapp_fpi" {
  name                       = local.fpi_webapp_name
  homepage                   = local.fpi_proxy_url
  reply_urls                 = ["https://localhost/signin-oidc", local.fpi_url, local.fpi_proxy_url]
  logout_url                 = local.fpi_logout_url
  available_to_other_tenants = false
  oauth2_allow_implicit_flow = true
  type                       = "webapp/api"

  required_resource_access {
    resource_app_id = "00000002-0000-0000-c000-000000000000" # AAD Graph API

    resource_access {
      id   = "311a71cc-e848-46a1-bdf8-97ff7156d8e6" # User.Read
      type = "Scope"
    }
  }
  
  required_resource_access {
    resource_app_id = "00000003-0000-0000-c000-000000000000" # Microsoft Graph

    resource_access {
      id   = "e1fe6dd8-ba31-4d61-89e7-88639da4683d" # User.Read
      type = "Scope"
    }
  }

  required_resource_access {
    resource_app_id = "022907d3-0f1b-48f7-badc-1ba6abab6d66" # Azure SQL DB and Data Warehouse
		
    resource_access {
			id = "c39ef2d1-04ce-46dc-8b5f-e9a5c60f0fc9" # user_impersonation
			type = "Scope"
		}
    
    resource_access {
			id = "efe4d732-bfbb-4617-8a77-349a9d67c720" # app_impersonation
			type = "Role"
		}
	}
}

resource "azuread_service_principal" "ad_webapp_fpi_spn" {
  application_id               = azuread_application.ad_webapp_fpi.application_id
  app_role_assignment_required = false
  tags                         = ["WindowsAzureActiveDirectoryIntegratedApp", "WindowsAzureActiveDirectoryOnPremApp"] 
}

# ......FPI rest application.....
resource "azuread_application" "ad_restapp_fpi" {
    name                       = var.environment == "production" ? "FPIRestApplication" :"${upper(var.application_acronym)}RestApplication${upper(var.environment_acronym)}"
    available_to_other_tenants = false
    oauth2_allow_implicit_flow = true
    public_client              = false
    reply_urls                 = ["https://localhost/signin-oidc","https://${lower(var.application_acronym)}rest${lower(var.app_environment_acronym)}.kpmgcloudops.com/signin-oidc"]
    
    type                       = "webapp/api"
   
    required_resource_access {
    resource_app_id = "00000002-0000-0000-c000-000000000000" # AAD Graph API

    resource_access {
      id   = "311a71cc-e848-46a1-bdf8-97ff7156d8e6" # User.Read
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
    }
    
    required_resource_access {
        resource_app_id = "022907d3-0f1b-48f7-badc-1ba6abab6d66" # Azure SQL DB and Data Warehouse
		
        resource_access {
			    id = "c39ef2d1-04ce-46dc-8b5f-e9a5c60f0fc9" # user_impersonation
			    type = "Scope"
		    }
    
        resource_access {
		    	id = "efe4d732-bfbb-4617-8a77-349a9d67c720" # app_impersonation
			    type = "Role"
		    }
	  }
}

resource "azuread_service_principal" "ad_fpiapp_rest" {
    app_role_assignment_required = true
    application_id               =   azuread_application.ad_restapp_fpi.application_id
    tags                         = ["WindowsAzureActiveDirectoryIntegratedApp", "WindowsAzureActiveDirectoryOnPremApp"] 
    

}