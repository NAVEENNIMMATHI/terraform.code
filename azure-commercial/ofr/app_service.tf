locals{
  app_service_name = var.environment_acronym == "dev" ? "${var.application_acronym}${var.environment_acronym}" : var.application_acronym
}

resource "azurerm_app_service" "app_service" {
  name                    = local.app_service_name
  resource_group_name     = azurerm_resource_group.ofr.name
  location                = azurerm_resource_group.ofr.location
  app_service_plan_id     = module.app_service_plan.app_service_plan_id
  client_affinity_enabled = true
  https_only              = true

  identity {
    type = "SystemAssigned"
  }

  site_config {
    dotnet_framework_version  = "v5.0"
    scm_type                  = "VSTSRM"
    always_on                 = true
    use_32_bit_worker_process = false
    http2_enabled             = true
    default_documents         = [
              "Default.htm",
              "Default.html",
              "Default.asp",
              "index.htm",
              "index.html",
              "iisstart.htm",
              "default.aspx",
              "index.php",
              "hostingstart.html",
            ]    
  }

  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY"                  = module.application_insights.instrumentation_key
    "APPLICATIONINSIGHTS_CONNECTION_STRING"           = "InstrumentationKey=${module.application_insights.instrumentation_key}"
    "ASPNETCORE_ENVIRONMENT"                          = title(var.environment)
    "WEBJOBS_IDLE_TIMEOUT"                            = "90000"
    "APPINSIGHTS_PROFILERFEATURE_VERSION"             = "1.0.0" 
    "APPINSIGHTS_SNAPSHOTFEATURE_VERSION"             = "1.0.0" 
    "ApplicationInsightsAgent_EXTENSION_VERSION"      = "~2" 
    "DiagnosticServices_EXTENSION_VERSION"            = "~3" 
    "InstrumentationEngine_EXTENSION_VERSION"         = "disabled" 
    "MSDEPLOY_RENAME_LOCKED_FILES"                    = "1" 
    "SnapshotDebugger_EXTENSION_VERSION"              = "disabled" 
    "XDT_MicrosoftApplicationInsights_BaseExtensions" = "disabled" 
    "XDT_MicrosoftApplicationInsights_Mode"           = "recommended" 
  }

  connection_string {
    name  = "AzureWebJobsDashboard"
    type  = "Custom"
    value = azurerm_storage_account.ofr.primary_connection_string
  }

  connection_string {
    name  = "AzureWebJobsStorage"
    type  = "Custom"
    value = azurerm_storage_account.ofr.primary_connection_string
  }

  auth_settings {
    enabled                       = true
    default_provider              = "AzureActiveDirectory"
    token_store_enabled           = true
    issuer                        = "https://sts.windows.net/${data.azurerm_client_config.current.tenant_id}"
    unauthenticated_client_action = "RedirectToLoginPage"
    active_directory {
      allowed_audiences = [
        "https://${var.application_gw_host_name}"
      ]
      client_id     = data.azuread_service_principal.ato_ofr.application_id
      client_secret = var.ato_ofr_spn_client_secret
    }
  }

  lifecycle {
    ignore_changes = [
      app_settings
    ]
  }

  tags = var.tags
}