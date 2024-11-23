resource "azurerm_function_app" "fun_avscan" {
  name                       = "fun-${var.location_acronym}-${var.application_acronym}-avfap-${var.environment_acronym}"
  location                   = module.mdp_rg_main.resource_group_location
  resource_group_name        = module.mdp_rg_main.resource_group_name
  app_service_plan_id        = azurerm_app_service_plan.asp_avscan_fap.id
  storage_account_name       = module.avmdpsa.storage_account_name
  storage_account_access_key = module.avmdpsa.primary_access_key
  https_only                 = true
  version                    = "~4"
  #client_affinity_enabled    = false
  os_type                    = "" 
  daily_memory_time_quota    = 0
  client_cert_mode           = "Optional"
  enabled                    = true
  app_settings = {
    FUNCTIONS_WORKER_RUNTIME                   = "node"
    WEBSITE_NODE_DEFAULT_VERSION               = "~14"
    "APPINSIGHTS_INSTRUMENTATIONKEY"             = module.mdpappinsights.instrumentation_key
    "APPLICATIONINSIGHTS_CONNECTION_STRING"      = "InstrumentationKey=${module.mdpappinsights.instrumentation_key}"
    "ApplicationInsightsAgent_EXTENSION_VERSION" = "~2"
    "WEBSITE_DNS_SERVER"                         = "168.63.129.16"
     WEBSITE_VNET_ROUTE_ALL                     = "1"
    "AV_Scan_Endpoint" = "https://web-use-mdp-avwap-${var.environment_acronym}.azurewebsites.net/scan"
    "Data_Lake_Connection" = "@Microsoft.Keyvault(secretUri=${azurerm_key_vault_secret.dlsusemdpconnectionstring.id})"
  }
  
  site_config {
    always_on                 = true
    ftps_state                = "AllAllowed"
    http2_enabled             = false
    ip_restriction            = []
    min_tls_version           = "1.2"
    use_32_bit_worker_process = true
    websockets_enabled        = false

 
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

resource "azurerm_monitor_diagnostic_setting" "mdp_avfunction_app_logging" {
  name                       = "mdp-avscan-function-app-logs"
  target_resource_id         = azurerm_function_app.fun_avscan.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.spoke_law.id

  log {
    category = "FunctionAppLogs"                                
    enabled  = true

    retention_policy {
      days    = 0
      enabled = true
    }
  }

  /*
  log {
    category = "Security"
    enabled  = true

    retention_policy {
      days = 0
      enabled = true
    }
  }

  log {
    category = "ServiceHealth"
    enabled  = true

    retention_policy {
      days = 0
      enabled = true
    }
  }

  log {
    category = "Alert"
    enabled  = true

    retention_policy {
      days = 0
      enabled = true
    }
  }
/*
  log {
    category = "Recommendation"
    enabled  = true

    retention_policy {
      days = 0
      enabled = true
    }
  }
  */
/*
  log {
    category = "Policy"
    enabled  = true

    retention_policy {
      days = 0
      enabled = true
    }
  }
  */
  
/*
  log {
    category = "Autoscale"
    enabled  = true

    retention_policy {
      days = 0
      enabled = true
    }
  }
  

  log {
    category = "ResourceHealth"
    enabled  = true

    retention_policy {
      days = 0
      enabled = true
    }
  }
*/
 metric {
    category = "AllMetrics"
    enabled  = false

    retention_policy {
      enabled = false
      days = 0
    }
  }
}
