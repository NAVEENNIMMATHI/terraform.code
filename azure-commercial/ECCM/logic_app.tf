resource "azurerm_logic_app_standard" "eccm_logic_app" {
    name                        = "lap-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
    location                    = var.resource_location
    resource_group_name         = module.eccm_rg.resource_group_name
    app_service_plan_id         = azurerm_service_plan.eccm_app.id
    storage_account_name        = azurerm_storage_account.eccm_app.name
    storage_account_access_key  = azurerm_storage_account.eccm_app.primary_access_key
    https_only                  = true
    version                     = "~4"

    app_settings = {
      "FUNCTIONS_WORKER_RUNTIME"     = "node"
      "WEBSITE_NODE_DEFAULT_VERSION" = "~18"
    #   "FUNCTIONS_EXTENSION_VERSION"  = "~4"
      "WEBSITE_VNET_ROUTE_ALL"       = 1
  }
    site_config {
        min_tls_version  = "1.2"
    }

    identity  {
        type  = "SystemAssigned"
    }

    lifecycle {
    ignore_changes = [
      site_config,
      identity
    ]
  }
}

resource "azurerm_monitor_diagnostic_setting" "lap_diag" {
  name                       = "lap${var.location_acronym }${var.application_acronym}${var.environment_acronym}-diag"
  target_resource_id         = azurerm_logic_app_standard.eccm_logic_app.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.spoke_law.id
  log_analytics_destination_type = "AzureDiagnostics"
 

   metric {
     category = "AllMetrics"

     retention_policy {
       enabled = false
     }
   }
    lifecycle {
     ignore_changes = [
       metric,
       log_analytics_destination_type
     ]
   }
   

}