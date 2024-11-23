resource "azurerm_app_service" "support-web-app" {
  name                        = var.support_webapp_name
  location                    = module.apprg.resource_group_location
  resource_group_name         = module.apprg.resource_group_name
  app_service_plan_id         = azurerm_app_service_plan.appserviceplan.id
  https_only                  = "true"
  tags                        = var.tags

  depends_on                  = [azuread_application.fastpath_admin]

  site_config {
    always_on                 = "true"
    websockets_enabled        = "false"
    use_32_bit_worker_process = "true"
    default_documents         = ["index.html"]
  }

  auth_settings {
    enabled                       = "true"
    unauthenticated_client_action = "RedirectToLoginPage"
    default_provider              = "AzureActiveDirectory"
    token_store_enabled           = "true"
    runtime_version               = "~1"
    issuer                        = "https://login.microsoftonline.com/${var.tenant_id}"
    active_directory {
      client_id                   = azuread_application.fastpath_admin.application_id
    }
  }

  lifecycle {
    ignore_changes = [
      site_config,
      app_settings
    ]
  }
}

