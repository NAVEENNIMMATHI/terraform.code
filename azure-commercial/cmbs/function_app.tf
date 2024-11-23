resource "azurerm_function_app" "functionapp" {
  name                       = "fun-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  location                   = module.cmbsrg.resource_group_location
  resource_group_name        = module.cmbsrg.resource_group_name
  app_service_plan_id        = azurerm_app_service_plan.appserviceplan.id
  storage_account_name       = module.cmbssa.storage_account_name
  storage_account_access_key = module.cmbssa.primary_access_key
  https_only                 = true
  version                    = "~1"
  client_affinity_enabled    = false
  os_type                    = "" 
  daily_memory_time_quota    = 0
  client_cert_mode           = "Optional"
  enabled                    = true
  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY"             = module.cmbsappinsights.instrumentation_key
    "APPLICATIONINSIGHTS_CONNECTION_STRING"      = "InstrumentationKey=${module.cmbsappinsights.instrumentation_key}"
    "ApplicationInsightsAgent_EXTENSION_VERSION" = "~2"
  }
  
  site_config {
    always_on                 = true
    ftps_state                = "AllAllowed"
    http2_enabled             = false
    ip_restriction            = []
    min_tls_version           = "1.2"
    use_32_bit_worker_process = true
    websockets_enabled        = false

    cors {
      allowed_origins = [
        "https://functions-next.azure.com",
        "https://functions-staging.azure.com",
        "https://functions.azure.com",
      ]
      support_credentials = true
    }
  }

  identity {
    type = "SystemAssigned"
  }

  auth_settings {
    enabled                       = "true"
    unauthenticated_client_action = "RedirectToLoginPage"
    default_provider              = "AzureActiveDirectory"
    token_store_enabled           = "true"
    runtime_version               = "~1"
    issuer                        = "https://login.microsoftonline.com/${var.tenant_id}"
  }

  lifecycle {
    ignore_changes = [
      app_settings,
      auth_settings
    ]
  }

  tags = var.tags
}