resource "azuread_application" "fastpath_admin" {
    name                       = "Fastpath Admin${upper(var.environment_acronym_aad_url)}"
    homepage                   = "https://homepage"
    available_to_other_tenants = false
    oauth2_allow_implicit_flow = false
    public_client              = false
    reply_urls                 = ["https://adminfastpath${lower(var.environment_acronym_aad_url)}.kpmgcloudops.com/.auth/login/aad/callback"]
    
    type                       = "webapp/api"

    app_role {
        allowed_member_types = [
                                "User",
                               ]
        description          = "Admins have full access."
        display_name         = "Admin"
        is_enabled           = true
        value                = "Admin"
    }

    app_role {
        allowed_member_types = [
                                "User",
                               ]
        description          = "Read only users."
        display_name         = "ReadOnly"
        is_enabled           = true
        value                = "ReadOnly"
    }

    app_role {
        allowed_member_types = [
                                "User",
                               ]
        description          = "Support team members."
        display_name         = "Support"
        is_enabled           = true
        value                = "Support"
    }
    
    required_resource_access {
        resource_app_id = "00000003-0000-0000-c000-000000000000" //Microsoft graph

        resource_access {
            id   = "e1fe6dd8-ba31-4d61-89e7-88639da4683d"
            type = "Scope"
        }
        resource_access {
            id   = "a154be20-db9c-4678-8ab7-66f6cc099a59"
            type = "Scope"
        }
    }
}

resource "azuread_service_principal" "fastpath_admin" {
    app_role_assignment_required = true
    application_id               = azuread_application.fastpath_admin.application_id
    tags                         = [
                                    "WindowsAzureActiveDirectoryIntegratedApp",
                                   ]
}


resource "azuread_application" "fastpath_assure" {
    name                       = "Fastpath Assure${upper(var.environment_acronym_aad_url)}"
    homepage                   = "https://homepage"
    available_to_other_tenants = false
    oauth2_allow_implicit_flow = false
    public_client              = false
    reply_urls                 = ["https://fastpath${lower(var.environment_acronym_aad_url)}.kpmgcloudops.com/redirect"]
    
    type                       = "webapp/api"
   
    required_resource_access {
        resource_app_id = "00000002-0000-0000-c000-000000000000"   //app id of the Graph API in all tenants.

        resource_access {
            id   = "5778995a-e1bf-45b8-affa-663a9f3f4d04"
            type = "Role"
        }
    }

    required_resource_access {
        resource_app_id = "00000003-0000-0000-c000-000000000000" //Microsoft graph

        resource_access {
            id   = "e1fe6dd8-ba31-4d61-89e7-88639da4683d" 
            type = "Scope"
        }
    }
}

resource "azuread_service_principal" "fastpath_assure" {
    app_role_assignment_required = false
    application_id               = azuread_application.fastpath_assure.application_id
    tags                         = [
                                      "WindowsAzureActiveDirectoryIntegratedApp",
                                   ]
}