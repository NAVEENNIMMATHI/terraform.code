resource "azurerm_function_app" "app_service_function" {
  name                       = var.environment == "production" ? "fun-use-krt" : "fun-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name        = module.applicationrg.resource_group_name
  location                   = module.applicationrg.resource_group_location
  app_service_plan_id        = azurerm_app_service_plan.appserviceplan.id
  storage_account_name       = module.functionappsa.storage_account_name
  storage_account_access_key = module.functionappsa.primary_access_key
  version                    = "~6"
  https_only                 = true

  site_config {

    cors {
      allowed_origins = ["https://functions.azure.com", "kart${var.application_url_environment_acronym}.${var.dns_suffix}" ]
    }
  }

  
  identity {

    type = "UserAssigned"
    identity_ids = [
      azurerm_user_assigned_identity.identity.id
    ]
  }

  app_settings = {
     FUNCTIONS_WORKER_RUNTIME    = "dotnet"
     KARTCentralConnectionString = var.KART_Central_Connection_String
     IsManagedIdentityEnabled    = "TRUE"
     ManagedIdentityId           = "${azurerm_user_assigned_identity.identity.client_id}" 
     TraceEventType              = "error"
     ApplicationEnvironment      = var.fun_environment
     FromEmailID                 = var.email_id
     APPINSIGHTS_INSTRUMENTATIONKEY = module.appinsights-fun.instrumentation_key
     SMTPServerHostName         = "199.207.144.9"
     SMTPPort                    = "25"
     SMTPDefaultCredentials      = "true"   
  }

  tags                       = var.tags
    lifecycle {
    ignore_changes = [
      # ignore changes to app_settings as these are different in differnt environments and are manual.
      app_settings
    ]
  }
  
}