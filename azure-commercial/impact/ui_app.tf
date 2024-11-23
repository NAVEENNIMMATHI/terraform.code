
resource "azurerm_app_service" "main" {
  name                       = "app-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  location                   = module.impact_rg.resource_group_location
  resource_group_name        = module.impact_rg.resource_group_name
  app_service_plan_id        = azurerm_app_service_plan.impact_asp.id
  # storage_account_name       = module.impactfiledata01sa.storage_account_name
  # storage_account_access_key = module.impactfiledata01sa.primary_access_key
  https_only                 = true
  # version                    = "~1"
  #client_affinity_enabled    = false
  # os_type                 = "linux"
  # daily_memory_time_quota = 0
  # client_cert_mode        = "Optional"
  enabled                 = true
  app_settings = {
    WEBSITE_VNET_ROUTE_ALL = 1
    DOCKER_REGISTRY_SERVER_URL          = "https://${azurerm_container_registry.impactacr.login_server}"
    DOCKER_REGISTRY_SERVER_USERNAME     = azurerm_container_registry.impactacr.admin_username
    DOCKER_REGISTRY_SERVER_PASSWORD     = azurerm_container_registry.impactacr.admin_password
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = false
    # Platform_DbUrl         = "Server=tcp:${azurerm_mssql_server.impact_srv_mssql_server.name}.database.windows.net,1433;Persist Security Info=False;User ID=admin01;Password=${var.sql_server_admin_password};Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
    # Platform_DbName        = "ondemand-main"
    # Platform_Env           = "webapp"
    # Platform_Storage       = module.impactfiledata01sa.connection_strings
    # Platform_SBUSNS        = sensitive(azurerm_servicebus_namespace.impact_servicebus_namespace.default_primary_connection_string)
    # Platform_SBUSQUEUE = "ondemandplatform"
    # Platform_URL           = ""
    # Platform_tempLocation = "temp"
  }

site_config {
    linux_fx_version            = "DOCKER|${azurerm_container_registry.impactacr.login_server}/${var.docker_image}:1.0"
    #acr_use_managed_identity_credentials = true
    always_on                   = "true"
    # scm_use_main_ip_restriction = true
    # use_32_bit_worker_process   = true
    # scm_type                    = "VSTSRM"

    ip_restriction {
      ip_address = "199.206.0.5/32"
      priority   = "100"
      action     = "Allow"
    }
    ip_restriction {
      ip_address = "199.207.253.96/32"
      priority   = "101"
      action     = "Allow"
    }
    ip_restriction {
      ip_address = "199.207.253.101/32"
      priority   = "102"
      action     = "Allow"
    }
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

  # lifecycle {
  #   ignore_changes = [
  #     app_settings
  #     #   auth_settings
  #   ]
  # }

  tags = var.tags
}

# resource "azurerm_monitor_diagnostic_setting" "web_app_logging" {
#   name                       = "web-app-logs"
#   target_resource_id         = azurerm_app_service.main.id
#   log_analytics_workspace_id = data.azurerm_log_analytics_workspace.spoke_law.id

#   log {
#     category = "FunctionAppLogs"
#     enabled  = true

#     retention_policy {
#       days    = 0
#       enabled = true
#     }
#   }

#   log {
#     category = "Security"
#     enabled  = true

#     retention_policy {
#       days = 0
#       enabled = true
#     }
#   }

#   log {
#     category = "ServiceHealth"
#     enabled  = true

#     retention_policy {
#       days = 0
#       enabled = true
#     }
#   }

#   log {
#     category = "Alert"
#     enabled  = true

#     retention_policy {
#       days = 0
#       enabled = true
#     }
#   }

#     log {
#       category = "Recommendation"
#       enabled  = true

#       retention_policy {
#         days = 0
#         enabled = true
#       }
#     }

#   log {
#     category = "Policy"
#     enabled  = true

#     retention_policy {
#       days = 0
#       enabled = true
#     }
#   }

#     log {
#       category = "Autoscale"
#       enabled  = true

#       retention_policy {
#         days = 0
#         enabled = true
#       }
#     }


#   log {
#     category = "ResourceHealth"
#     enabled  = true

#     retention_policy {
#       days = 0
#       enabled = true
#     }
#   }

#   metric {
#     category = "AllMetrics"
#     enabled  = false

#     retention_policy {
#       enabled = false
#       days    = 0
#     }
#   }
# }
