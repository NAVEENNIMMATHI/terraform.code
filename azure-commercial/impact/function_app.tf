resource "azurerm_function_app" "main" {
  name                       = "fun-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  location                   = module.impact_rg.resource_group_location
  resource_group_name        = module.impact_rg.resource_group_name
  app_service_plan_id        = azurerm_app_service_plan.impact_asp.id
  storage_account_name       = module.impactfiledata01sa.storage_account_name
  storage_account_access_key = module.impactfiledata01sa.primary_access_key
  https_only                 = true
  version                    = "~4"
  #client_affinity_enabled    = false
  os_type                 = "linux"
  daily_memory_time_quota = 0
  client_cert_mode        = "Optional"
  enabled                 = true
  app_settings = {
    # FUNCTIONS_WORKER_RUNTIME                   = "node"
    # WEBSITE_NODE_DEFAULT_VERSION               = "~14"
    # "APPINSIGHTS_INSTRUMENTATIONKEY"             = module.mdpappinsights.instrumentation_key
    # "APPLICATIONINSIGHTS_CONNECTION_STRING"      = "InstrumentationKey=${module.mdpappinsights.instrumentation_key}"
    # "ApplicationInsightsAgent_EXTENSION_VERSION" = "~2"
    WEBSITE_VNET_ROUTE_ALL   = "1"
    FUNCTIONS_WORKER_RUNTIME = "python"
  }

  site_config {
    always_on                 = true
    ftps_state                = "AllAllowed"
    http2_enabled             = false
    ip_restriction            = []
    min_tls_version           = "1.2"
    use_32_bit_worker_process = true
    websockets_enabled        = false
    linux_fx_version          = "python|4"
  }

  identity {
    type = "SystemAssigned"
  }

  #   auth_settings {
  #     enabled                       = "true"
  #     unauthenticated_client_action = "RedirectToLoginPage"
  #     default_provider              = "AzureActiveDirectory"
  #     token_store_enabled           = "true"
  #     runtime_version               = "~1"
  #     issuer                        = "https://login.microsoftonline.com/${var.tenant_id}"
  #   }

  lifecycle {
    ignore_changes = [
      app_settings
      #   auth_settings
    ]
  }

  depends_on = [module.impactfiledata01sa]

  tags = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "function_app_logging" {
  name                       = "function-app-logs"
  target_resource_id         = azurerm_function_app.main.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.spoke_law.id

  log {
    category = "FunctionAppLogs"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = true
    }
  }

  # log {
  #   category = "Security"
  #   enabled  = true

  #   retention_policy {
  #     days = 0
  #     enabled = true
  #   }
  # }

  # log {
  #   category = "ServiceHealth"
  #   enabled  = true

  #   retention_policy {
  #     days = 0
  #     enabled = true
  #   }
  # }

  # log {
  #   category = "Alert"
  #   enabled  = true

  #   retention_policy {
  #     days = 0
  #     enabled = true
  #   }
  # }

  #   log {
  #     category = "Recommendation"
  #     enabled  = true

  #     retention_policy {
  #       days = 0
  #       enabled = true
  #     }
  #   }

  # log {
  #   category = "Policy"
  #   enabled  = true

  #   retention_policy {
  #     days = 0
  #     enabled = true
  #   }
  # }

  #   log {
  #     category = "Autoscale"
  #     enabled  = true

  #     retention_policy {
  #       days = 0
  #       enabled = true
  #     }
  #   }


  # log {
  #   category = "ResourceHealth"
  #   enabled  = true

  #   retention_policy {
  #     days = 0
  #     enabled = true
  #   }
  # }

  metric {
    category = "AllMetrics"
    enabled  = false

    retention_policy {
      enabled = false
      days    = 0
    }
  }
}
