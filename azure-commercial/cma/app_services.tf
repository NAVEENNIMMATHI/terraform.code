resource "azurerm_app_service" "web-app" {
    name                = "${var.application_acronym}${var.environment_acronym2}"
    location            = module.cmarg.resource_group_location
    resource_group_name = module.cmarg.resource_group_name
    app_service_plan_id = azurerm_app_service_plan.appserviceplan.id
    https_only          = "true"
    
    app_settings = {
        "WEBSITES_ENABLE_APP_SERVICE_STORAGE"   = "false"
        "db_cs"                                 = ""
        "default_port"                          = "443"
        "deploy_mode"                           = "remote"
       #"FLASK_ENV"                             = var.flask_env # To force the app into production mode which is needed for some of the pen test findings.
        "WEBSITE_HTTPLOGGING_RETENTION_DAYS"    = "5"
        "WEBSITES_PORT"                         = "443"
        "WERKZEUG_DEBUG_PIN"                    = "1234"
        "PORT"                                  = "443"
        "OAUTHLIB_INSECURE_TRANSPORT"           = "0"
        "OAUTHLIB_RELAX_TOKEN_SCOPE"            = "1"
        "client_id"                             = var.cma_client_id
        "client_secret"                         = var.cma_client_secret
        "initial_user"                          = var.initial_user
        "tenant"                                = var.tenant_id
        "DOCKER_REGISTRY_SERVER_URL"            = "https://${azurerm_container_registry.acr.login_server}"
        "DOCKER_REGISTRY_SERVER_USERNAME"       = azurerm_container_registry.acr.admin_username
        "DOCKER_REGISTRY_SERVER_PASSWORD"       = "Keep the Secret in Key Vault and not here in Web App Config"
        "PREFERRED_URL_SCHEME"                  = "https"        
    }

    site_config {
        always_on                 = "true"
        websockets_enabled        = "false"
        ftps_state                = "AllAllowed"
        linux_fx_version          = "DOCKER|${azurerm_container_registry.acr.login_server}/cma_full:latest"
    }

    connection_string {
        name  = "POSTGRESQLCONNSTR_remote_db_cs"
        value = "postgresql://${var.postgresql_server_admin}%40${module.postgresql_server.postgresql_server_name}:${var.postgresql_server_admin_password}@${module.postgresql_server.postgresql_server_name}.postgres.database.azure.com:5432/${module.postgresql_database.postgresql_database_name}?sslmode=require"
        type  = "PostgreSQL"
    }

    connection_string {
        name  = "remote_db_cs"
        value = "postgresql://${var.postgresql_server_admin}%40${module.postgresql_server.postgresql_server_name}:${var.postgresql_server_admin_password}@${module.postgresql_server.postgresql_server_name}.postgres.database.azure.com:5432/${module.postgresql_database.postgresql_database_name}?sslmode=require"
        type  = "PostgreSQL"
    }

    logs {
        http_logs {
            file_system {
                retention_in_days = var.appservice_log_retention_days
                retention_in_mb   = var.appservice_log_retention_mb
            }

        }
    }

    tags                = var.tags

    lifecycle {
        ignore_changes = [
            app_settings
        ]
    }
}