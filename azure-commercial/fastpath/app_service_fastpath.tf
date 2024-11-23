#WebApp
resource "azurerm_app_service" "web-app" {
  name                = var.webapp_name
  location            = module.apprg.resource_group_location
  resource_group_name = module.apprg.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.appserviceplan.id
  https_only          = "true"
  tags                = var.tags

  depends_on          = [azuread_application.fastpath_assure]

  app_settings = {
    "apiUrl"                       = "https://${var.api_url}/"
    "applicationInsightsKey"       = module.appinsights.instrumentation_key
    "appUrl"                       = "https://${var.app_url}/"
    "clientId"                     = azuread_application.fastpath_assure.application_id
    "helpUrl"                      = "https://gofastpath.zendesk.com/"
    "msalResource"                 = "api/full"
    "tenant"                       = "${var.ad_domain_name}.onmicrosoft.com"
    "WEBSITE_NODE_DEFAULT_VERSION" = "8.9.4"
    "instance"                     = "https://login.microsoftonline.com/"
  }

  site_config {
    always_on                 = "true"
    websockets_enabled        = "false"
    use_32_bit_worker_process = "true"
  }

  lifecycle {
    ignore_changes = [
      site_config,
      app_settings
    ]
  }
}

