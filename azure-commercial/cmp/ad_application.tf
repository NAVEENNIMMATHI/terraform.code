
# ramdom_uuid
resource "random_uuid" "client_stakeholder_id" {}
resource "random_uuid" "application_owner_id" {}
resource "random_uuid" "orchestrator_admin_id" {}
resource "random_uuid" "migration_project_developer_id" {}
resource "random_uuid" "migration_project_lead_id" {}
resource "random_uuid" "data_administrator_id" {}
resource "random_uuid" "Users_Write_all_id" {}
resource "random_uuid" "Users_Read_all_id" {}
resource "random_uuid" "Communication_Templates_Write_all_id" {}
resource "random_uuid" "Communication_Templates_Read_all_id" {}
resource "random_uuid" "Communications_Write_all_id" {}
resource "random_uuid" "Communications_Read_all_id" {} 
resource "random_uuid" "Milestones_Write_all_id" {}
resource "random_uuid" "Milestones_Read_all_id" {}
resource "random_uuid" "Tminus_Templates_Write_all_id" {}
resource "random_uuid" "Tminus_Templates_Read_all_id" {}
resource "random_uuid" "Migrations_Write_all_id" {}
resource "random_uuid" "Migrations_Read_all_id" {}
resource "random_uuid" "Applications_Write_all_id" {}
resource "random_uuid" "Applications_Read_all_id" {}
resource "random_uuid" "Nomenclatures_Read_all_id" {}
resource "random_uuid" "Tminus_Schedules_Read_all_id" {}
resource "random_uuid" "Tminus_Schedules_Write_all_id" {}
resource "random_uuid" "access_as_user_id" {}


#cmp-spn-app-registration

resource "azuread_application" "cmp_spa_registration" {
    for_each = var.cmp_clients

    display_name     = "appreg-${var.application_acronym}-${each.key}-${var.environment_acronym}-spa"
    owners           = [data.azuread_client_config.current.object_id]


    single_page_application{
        redirect_uris = [var.spa_redirect_url]
    }

    api {
        mapped_claims_enabled          = true
        requested_access_token_version = 2  
        
        oauth2_permission_scope {
            admin_consent_description  = "Allows the app to have the same access to information in the directory on behalf of the signed-in user"
            admin_consent_display_name = "Access Cloud Migration Manager"
            enabled                    = true
            id                         = random_uuid.access_as_user_id.result
            type                       = "User"
            user_consent_description   = "Allow the application to access Cloud Migration Manager on your behalf"
            user_consent_display_name  = "Access Cloud Migration Manager"
            value                      = "access_as_user"
        }

        oauth2_permission_scope {
            admin_consent_description  = "Allows the app to write to signed-in user's users"
            admin_consent_display_name = "Write access to users data"
            enabled                    = true
            id                         = random_uuid.Users_Write_all_id.result
            type                       = "User"
            user_consent_description   = "Allows the app to write to your users"
            user_consent_display_name  = "Write access to users data"
            value                      = "Users.Write.All"
        }

        oauth2_permission_scope {
            admin_consent_description  = "Allows the app to read signed-in user's users"
            admin_consent_display_name = "Read users data "
            enabled                    = true
            id                         = random_uuid.Users_Read_all_id.result
            type                       = "User"
            user_consent_description   = "Allows the app to read your users"
            user_consent_display_name  = "Read users data"
            value                      = "Users.Read.All"
        }

        oauth2_permission_scope {
            admin_consent_description  = "Allows the app to write to signed-in user's communication templates"
            admin_consent_display_name = "Write access to communication templates"
            enabled                    = true
            id                         = random_uuid.Communication_Templates_Write_all_id.result
            type                       = "User"
            user_consent_description   = "Allows the app to write to your communication templates"
            user_consent_display_name  = "Write access to communication templates"
            value                      = "Communication_Templates.Write.All"
        }

        oauth2_permission_scope {
            admin_consent_description  = "Allows the app to read signed-in user's communication templates"
            admin_consent_display_name = "Read communication templates"
            enabled                    = true
            id                         = random_uuid.Communication_Templates_Read_all_id.result
            type                       = "User"
            user_consent_description   = "Allows the app to read your communication templates"
            user_consent_display_name  = "Read communication templates"
            value                      = "Communication_Templates.Read.All"
        }

        oauth2_permission_scope {
            admin_consent_description  = "Allows the app to write to signed-in user's communications data"
            admin_consent_display_name = "Write access to communications data"
            enabled                    = true
            id                         = random_uuid.Communications_Write_all_id.result
            type                       = "User"
            user_consent_description   = "Allows the app to write to your communications data"
            user_consent_display_name  = "Write access to communications data"
            value                      = "Communications.Write.All"
        }

        oauth2_permission_scope {
            admin_consent_description  = "Allows the app to read signed-in user's communications data"
            admin_consent_display_name = "Read applications data"
            enabled                    = true
            id                         = random_uuid.Communications_Read_all_id.result
            type                       = "User"
            user_consent_description   = "Allows the app to read your communications data"
            user_consent_display_name  = "Read applications data"
            value                      = "Communications.Read.All"
        }

        oauth2_permission_scope {
            admin_consent_description  = "Allows the app to read signed-in user's milestones"
            admin_consent_display_name = "Read milestones data "
            enabled                    = true
            id                         = random_uuid.Milestones_Read_all_id.result
            type                       = "User"
            user_consent_description   = "Allows the app to read your milestones"
            user_consent_display_name  = "Read milestones data"
            value                      = "Milestones.Read.All"
        }

        oauth2_permission_scope {
            admin_consent_description  = "Allows the app to write to signed-in user's milestones"
            admin_consent_display_name = "Write access to milestones data "
            enabled                    = true
            id                         = random_uuid.Milestones_Write_all_id.result
            type                       = "User"
            user_consent_description   = "Allows the app to write to your milestones"
            user_consent_display_name  = "Write access to milestones data"
            value                      = "Milestones.Write.All"
        }   

        oauth2_permission_scope {
            admin_consent_description  = "Allows the app to read signed-in user's tminus templates"
            admin_consent_display_name = "Read tminus templates data"
            enabled                    = true
            id                         = random_uuid.Tminus_Templates_Read_all_id.result
            type                       = "User"
            user_consent_description   = "Allows the app to read your tminus templates"
            user_consent_display_name  = "Read tminus templates data"
            value                      = "Tminus_Templates.Read.All"
        }

        oauth2_permission_scope {
            admin_consent_description  = "Allows the app to read signed-in user's tminus templates"
            admin_consent_display_name = "Write access to tminus templates"
            enabled                    = true
            id                         = random_uuid.Tminus_Templates_Write_all_id.result
            type                       = "User"
            user_consent_description   = "Allows the app to write to your tminus templates"
            user_consent_display_name  = "Write access to tminus templates"
            value                      = "Tminus_Templates.Write.All"
        } 

        oauth2_permission_scope {
            admin_consent_description  = "Write access to migrations data"
            admin_consent_display_name = "Write access to migrations"
            enabled                    = true
            id                         = random_uuid.Migrations_Write_all_id.result
            type                       = "User"
            user_consent_description   = "Allows app to write to migrations data"
            user_consent_display_name  = "Write access to migrations"
            value                      = "Migrations.Write.All"
        }   

        oauth2_permission_scope {
            admin_consent_description  = "Allows the app to read migrations data of the current tenant"
            admin_consent_display_name = "Read migrations data"
            enabled                    = true
            id                         = random_uuid.Migrations_Read_all_id.result
            type                       = "User"
            user_consent_description   = "Allows the app to read migrations data of the current tenant"
            user_consent_display_name  = "Read migrations data"
            value                      = "Migrations.Read.All"
        }  

        oauth2_permission_scope {
            admin_consent_description  = "Allows the app to read signed-in user's applications"
            admin_consent_display_name = "Read applications data"
            enabled                    = true
            id                         = random_uuid.Applications_Read_all_id.result
            type                       = "User"
            user_consent_description   = "Allows the app to read your applications"
            user_consent_display_name  = "Read applications data"
            value                      = "Applications.Read.All"
        }

        oauth2_permission_scope {
            admin_consent_description  = "Allows the app to write to signed-in user's applications"
            admin_consent_display_name = "Write access to applications"
            enabled                    = true
            id                         = random_uuid.Applications_Write_all_id.result
            type                       = "User"
            user_consent_description   = "Allows the app to write to your applications"
            user_consent_display_name  = "Write access to applications"
            value                      = "Applications.Write.All"
        }  

        oauth2_permission_scope {
            admin_consent_description  = "Allows the app to read nomenclatures"
            admin_consent_display_name = "Read nomenclatures"
            enabled                    = true
            id                         = random_uuid.Nomenclatures_Read_all_id.result
            type                       = "User"
            user_consent_description   = "Allows the app to read nomenclatures"
            user_consent_display_name  = "Read nomenclatures"
            value                      = "Nomenclatures.Read.All"
        }

        oauth2_permission_scope {
            admin_consent_description  = "Allows the app to read signed-in user's tminus schedules"
            admin_consent_display_name = "Read tminus schedules data"
            enabled                    = true
            id                         = random_uuid.Tminus_Schedules_Read_all_id.result
            type                       = "User"
            user_consent_description   = "Allows the app to read your tminus schedules"
            user_consent_display_name  = "Read Tminus schedules data"
            value                      = "Tminus_Schedules.Read.All"
        }

        oauth2_permission_scope {
            admin_consent_description  = "Allows the app to write to signed-in user's tminus schedules"
            admin_consent_display_name = "Write access to tminus schedules"
            enabled                    = true
            id                         = random_uuid.Tminus_Schedules_Write_all_id.result
            type                       = "User"
            user_consent_description   = "Allows the app to write to your tminus schedules"
            user_consent_display_name  = "Write access to tminus schedules"
            value                      = "Tminus_Schedules.Write.All"
        } 
    }

    app_role {
        allowed_member_types = ["User"]
        description          = "Read Access."
        display_name         = "Client Stakeholder"
        enabled           = true
        id                   = random_uuid.client_stakeholder_id.result
        value                = "Client_Stakeholder"
    }

    app_role {
        allowed_member_types = ["User"]
        description          = "Read only users."
        display_name         = "Application Owner"
        enabled           = true
        id                   = random_uuid.application_owner_id.result
        value                = "Application_Owner"
    }

    app_role {
        allowed_member_types = ["User"]
        description          = "Read Write Access."
        display_name         = "Orchestrator Admin"
        enabled           = true
        id                   = random_uuid.orchestrator_admin_id.result
        value                = "Orchestrator_Admin"
    }

    app_role {
        allowed_member_types = ["User"]
        description          = "Read Write Access."
        display_name         = "Migration Project Developer"
        enabled           = true
        id                   = random_uuid.migration_project_developer_id.result
        value                = "Migration_Project_Developer"
    }

    app_role {
        allowed_member_types = [
                                "User",
                               ]
        description          = "Read Write Access."
        display_name         = "Migration Project Lead"
        enabled           = true
        id                   = random_uuid.migration_project_lead_id.result
        value                = "Migration_Project_Lead"
    }

    app_role {
        allowed_member_types = ["User"]
        description          = "Read Write Access."
        display_name         = "Data Administrator"
        enabled           = true
        id                   = random_uuid.data_administrator_id.result
        value                = "Data_Administrator"
    }
    
    required_resource_access {
        resource_app_id = "00000003-0000-0000-c000-000000000000" //Microsoft graph

        resource_access {
            id   = "e1fe6dd8-ba31-4d61-89e7-88639da4683d"
            type = "Scope"
        }

        resource_access {
            id   = "06da0dbc-49e2-44d2-8312-53f166ab848a" #Directory.Read.All 
            type = "Scope"
        }

        resource_access {
            id   = "b340eb25-3456-403f-be2f-af7a0d370277" #User.ReadBasic.All -Read all users' basic profiles
            type = "Scope"
        }

        resource_access {
            id   = "7ab1d382-f21e-4acd-a863-ba3e13f7da61" #Directory.Read.All 
            type = "Role"
        }
    }

    required_resource_access {
        resource_app_id = azuread_application.cmp_api_registration[each.key].application_id //cmp_api

        resource_access {
            id   = random_uuid.Users_Write_all_id.result
            type = "Scope"
        }

        resource_access {
            id   = random_uuid.Users_Read_all_id.result
            type = "Scope"
        }

        resource_access {
            id   = random_uuid.Communication_Templates_Write_all_id.result
            type = "Scope"
        }

        resource_access {
            id   = random_uuid.Communication_Templates_Read_all_id.result
            type = "Scope"
        }

        resource_access {
            id   = random_uuid.Communications_Write_all_id.result
            type = "Scope"
        }

        resource_access {
            id   = random_uuid.Communications_Read_all_id.result
            type = "Scope"
        }

        resource_access {
            id   = random_uuid.Milestones_Write_all_id.result
            type = "Scope"
        }

        resource_access {
            id   = random_uuid.Milestones_Read_all_id.result
            type = "Scope"
        }

        resource_access {
            id   = random_uuid.Tminus_Templates_Write_all_id.result
            type = "Scope"
        }

        resource_access {
            id   = random_uuid.Tminus_Templates_Read_all_id.result
            type = "Scope"
        }

        resource_access {
            id   = random_uuid.Migrations_Write_all_id.result
            type = "Scope"
        }

        resource_access {
            id   = random_uuid.Migrations_Read_all_id.result
            type = "Scope"
        }

        resource_access {
            id   = random_uuid.Applications_Write_all_id.result
            type = "Scope"
        }

        resource_access {
            id   = random_uuid.Applications_Read_all_id.result
            type = "Scope"
        }

        resource_access {
            id   = random_uuid.Nomenclatures_Read_all_id.result
            type = "Scope"
        }

        resource_access {
            id   = random_uuid.Tminus_Schedules_Read_all_id.result
            type = "Scope"
        }

        resource_access {
            id   = random_uuid.Tminus_Schedules_Write_all_id.result
            type = "Scope"
        }

        resource_access {
            id   = random_uuid.access_as_user_id.result
            type = "Scope"
        }
    }
 }

resource "azuread_service_principal" "cmp_spa_sp" {
    for_each                   = var.cmp_clients

    app_role_assignment_required = true
    application_id               = azuread_application.cmp_spa_registration[each.key].application_id
    tags                         = [
                                    "WindowsAzureActiveDirectoryIntegratedApp",
                                   ]
}

# Api-app-registration

resource "azuread_application" "cmp_api_registration" {
    for_each = var.cmp_clients

    display_name     = "appreg-${var.application_acronym}-${each.key}-${var.environment_acronym}-api"
    identifier_uris  = ["https://${var.tenant_fqdn}/${var.application_acronym}${each.key}rest${var.environment_acronym}API"]
    owners           = [data.azuread_client_config.current.object_id]


    api {
        mapped_claims_enabled          = true
        requested_access_token_version = 2  
        
        oauth2_permission_scope {
            admin_consent_description  = "Allows the app to have the same access to information in the directory on behalf of the signed-in user"
            admin_consent_display_name = "Access Cloud Migration Manager"
            enabled                    = true
            id                         = random_uuid.access_as_user_id.result
            type                       = "User"
            user_consent_description   = "Allow the application to access Cloud Migration Manager on your behalf"
            user_consent_display_name  = "Access Cloud Migration Manager"
            value                      = "access_as_user"
        }

        oauth2_permission_scope {
            admin_consent_description  = "Allows the app to write to signed-in user's users"
            admin_consent_display_name = "Write access to users data"
            enabled                    = true
            id                         = random_uuid.Users_Write_all_id.result
            type                       = "User"
            user_consent_description   = "Allows the app to write to your users"
            user_consent_display_name  = "Write access to users data"
            value                      = "Users.Write.All"
        }

        oauth2_permission_scope {
            admin_consent_description  = "Allows the app to read signed-in user's users"
            admin_consent_display_name = "Read users data "
            enabled                    = true
            id                         = random_uuid.Users_Read_all_id.result
            type                       = "User"
            user_consent_description   = "Allows the app to read your users"
            user_consent_display_name  = "Read users data"
            value                      = "Users.Read.All"
        }

        oauth2_permission_scope {
            admin_consent_description  = "Allows the app to write to signed-in user's communication templates"
            admin_consent_display_name = "Write access to communication templates"
            enabled                    = true
            id                         = random_uuid.Communication_Templates_Write_all_id.result
            type                       = "User"
            user_consent_description   = "Allows the app to write to your communication templates"
            user_consent_display_name  = "Write access to communication templates"
            value                      = "Communication_Templates.Write.All"
        }

        oauth2_permission_scope {
            admin_consent_description  = "Allows the app to read signed-in user's communication templates"
            admin_consent_display_name = "Read communication templates"
            enabled                    = true
            id                         = random_uuid.Communication_Templates_Read_all_id.result
            type                       = "User"
            user_consent_description   = "Allows the app to read your communication templates"
            user_consent_display_name  = "Read communication templates"
            value                      = "Communication_Templates.Read.All"
        }

        oauth2_permission_scope {
            admin_consent_description  = "Allows the app to write to signed-in user's communications data"
            admin_consent_display_name = "Write access to communications data"
            enabled                    = true
            id                         = random_uuid.Communications_Write_all_id.result
            type                       = "User"
            user_consent_description   = "Allows the app to write to your communications data"
            user_consent_display_name  = "Write access to communications data"
            value                      = "Communications.Write.All"
        }

        oauth2_permission_scope {
            admin_consent_description  = "Allows the app to read signed-in user's communications data"
            admin_consent_display_name = "Read applications data"
            enabled                    = true
            id                         = random_uuid.Communications_Read_all_id.result
            type                       = "User"
            user_consent_description   = "Allows the app to read your communications data"
            user_consent_display_name  = "Read applications data"
            value                      = "Communications.Read.All"
        }

        oauth2_permission_scope {
            admin_consent_description  = "Allows the app to read signed-in user's milestones"
            admin_consent_display_name = "Read milestones data "
            enabled                    = true
            id                         = random_uuid.Milestones_Read_all_id.result
            type                       = "User"
            user_consent_description   = "Allows the app to read your milestones"
            user_consent_display_name  = "Read milestones data"
            value                      = "Milestones.Read.All"
        }

        oauth2_permission_scope {
            admin_consent_description  = "Allows the app to write to signed-in user's milestones"
            admin_consent_display_name = "Write access to milestones data "
            enabled                    = true
            id                         = random_uuid.Milestones_Write_all_id.result
            type                       = "User"
            user_consent_description   = "Allows the app to write to your milestones"
            user_consent_display_name  = "Write access to milestones data"
            value                      = "Milestones.Write.All"
        }   

        oauth2_permission_scope {
            admin_consent_description  = "Allows the app to read signed-in user's tminus templates"
            admin_consent_display_name = "Read tminus templates data"
            enabled                    = true
            id                         = random_uuid.Tminus_Templates_Read_all_id.result
            type                       = "User"
            user_consent_description   = "Allows the app to read your tminus templates"
            user_consent_display_name  = "Read tminus templates data"
            value                      = "Tminus_Templates.Read.All"
        }

        oauth2_permission_scope {
            admin_consent_description  = "Allows the app to read signed-in user's tminus templates"
            admin_consent_display_name = "Write access to tminus templates"
            enabled                    = true
            id                         = random_uuid.Tminus_Templates_Write_all_id.result
            type                       = "User"
            user_consent_description   = "Allows the app to write to your tminus templates"
            user_consent_display_name  = "Write access to tminus templates"
            value                      = "Tminus_Templates.Write.All"
        } 

        oauth2_permission_scope {
            admin_consent_description  = "Write access to migrations data"
            admin_consent_display_name = "Write access to migrations"
            enabled                    = true
            id                         = random_uuid.Migrations_Write_all_id.result
            type                       = "User"
            user_consent_description   = "Allows app to write to migrations data"
            user_consent_display_name  = "Write access to migrations"
            value                      = "Migrations.Write.All"
        }   

        oauth2_permission_scope {
            admin_consent_description  = "Allows the app to read migrations data of the current tenant"
            admin_consent_display_name = "Read migrations data"
            enabled                    = true
            id                         = random_uuid.Migrations_Read_all_id.result
            type                       = "User"
            user_consent_description   = "Allows the app to read migrations data of the current tenant"
            user_consent_display_name  = "Read migrations data"
            value                      = "Migrations.Read.All"
        }  

        oauth2_permission_scope {
            admin_consent_description  = "Allows the app to read signed-in user's applications"
            admin_consent_display_name = "Read applications data"
            enabled                    = true
            id                         = random_uuid.Applications_Read_all_id.result
            type                       = "User"
            user_consent_description   = "Allows the app to read your applications"
            user_consent_display_name  = "Read applications data"
            value                      = "Applications.Read.All"
        }

        oauth2_permission_scope {
            admin_consent_description  = "Allows the app to write to signed-in user's applications"
            admin_consent_display_name = "Write access to applications"
            enabled                    = true
            id                         = random_uuid.Applications_Write_all_id.result
            type                       = "User"
            user_consent_description   = "Allows the app to write to your applications"
            user_consent_display_name  = "Write access to applications"
            value                      = "Applications.Write.All"
        }  

        oauth2_permission_scope {
            admin_consent_description  = "Allows the app to read nomenclatures"
            admin_consent_display_name = "Read nomenclatures"
            enabled                    = true
            id                         = random_uuid.Nomenclatures_Read_all_id.result
            type                       = "User"
            user_consent_description   = "Allows the app to read nomenclatures"
            user_consent_display_name  = "Read nomenclatures"
            value                      = "Nomenclatures.Read.All"
        }

        oauth2_permission_scope {
            admin_consent_description  = "Allows the app to read signed-in user's tminus schedules"
            admin_consent_display_name = "Read tminus schedules data"
            enabled                    = true
            id                         = random_uuid.Tminus_Schedules_Read_all_id.result
            type                       = "User"
            user_consent_description   = "Allows the app to read your tminus schedules"
            user_consent_display_name  = "Read Tminus schedules data"
            value                      = "Tminus_Schedules.Read.All"
        }

        oauth2_permission_scope {
            admin_consent_description  = "Allows the app to write to signed-in user's tminus schedules"
            admin_consent_display_name = "Write access to tminus schedules"
            enabled                    = true
            id                         = random_uuid.Tminus_Schedules_Write_all_id.result
            type                       = "User"
            user_consent_description   = "Allows the app to write to your tminus schedules"
            user_consent_display_name  = "Write access to tminus schedules"
            value                      = "Tminus_Schedules.Write.All"
        } 
    }

    app_role {
        allowed_member_types = ["User"]
        description          = "Read Access."
        display_name         = "Client Stakeholder"
        enabled              = true
        id                   = random_uuid.client_stakeholder_id.result
        value                = "Client_Stakeholder"
    }

    app_role {
        allowed_member_types = ["User"]
        description          = "Read only users."
        display_name         = "Application Owner"
        enabled              = true
        id                   = random_uuid.application_owner_id.result
        value                = "Application_Owner"
    }

    app_role {
        allowed_member_types = ["User"]
        description          = "Read Write Access."
        display_name         = "Orchestrator Admin"
        enabled              = true
        id                   = random_uuid.orchestrator_admin_id.result
        value                = "Orchestrator_Admin"
    }

    app_role {
        allowed_member_types = ["User"]
        description          = "Read Write Access."
        display_name         = "Migration Project Developer"
        enabled              = true
        id                   = random_uuid.migration_project_developer_id.result
        value                = "Migration_Project_Developer"
    }

    app_role {
        allowed_member_types = [
                                "User",
                               ]
        description          = "Read Write Access."
        display_name         = "Migration Project Lead"
        enabled              = true
        id                   = random_uuid.migration_project_lead_id.result
        value                = "Migration_Project_Lead"
    }

    app_role {
        allowed_member_types = ["User"]
        description          = "Read Write Access."
        display_name         = "Data Administrator"
        enabled              = true
        id                   = random_uuid.data_administrator_id.result
        value                = "Data_Administrator"
    }
    
    required_resource_access {
        resource_app_id = "00000003-0000-0000-c000-000000000000" //Microsoft graph

        resource_access {
            id   = "e1fe6dd8-ba31-4d61-89e7-88639da4683d"
            type = "Scope"
        }

        resource_access {
            id   = "b340eb25-3456-403f-be2f-af7a0d370277" #User.ReadBasic.All -Read all users' basic profiles
            type = "Scope"
        }

        resource_access {
            id   = "06da0dbc-49e2-44d2-8312-53f166ab848a" #Directory.Read.All 
            type = "Scope"
        }

        resource_access {
            id   = "7ab1d382-f21e-4acd-a863-ba3e13f7da61" #Directory.Read.All 
            type = "Role"
        }
    }
}

resource "azuread_service_principal" "cmp_api_sp" {
    for_each                   = var.cmp_clients

    app_role_assignment_required = true
    application_id               = azuread_application.cmp_api_registration[each.key].application_id
    tags                         = [
                                    "WindowsAzureActiveDirectoryIntegratedApp",
                                   ]
}


# App registration and service principal for CMP

resource "azuread_application" "cmp_application" {
  for_each = var.cmp_clients

  display_name                = "spn-${var.application_acronym}-${each.key}-${var.environment_acronym}"
  
  
  required_resource_access {
    resource_app_id = "00000003-0000-0000-c000-000000000000"

    resource_access {
      id   = "e1fe6dd8-ba31-4d61-89e7-88639da4683d"
      type = "Scope"
    }
  }
}

resource "azuread_service_principal" "cmp_spn_application" {
  for_each = var.cmp_clients

  app_role_assignment_required = false
  application_id               = azuread_application.cmp_application[each.key].application_id
  tags = [
    "WindowsAzureActiveDirectoryIntegratedApp","WindowsAzureActiveDirectoryCustomSingleSignOnApplication","WindowsAzureActiveDirectoryGalleryApplicationNonPrimaryV1"
  ]
}