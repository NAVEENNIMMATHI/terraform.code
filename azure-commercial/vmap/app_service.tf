locals {
  app_service_name = var.environment_acronym == "dev" ? "${var.application_acronym}${var.environment_acronym}" : var.application_acronym
}

resource "azurerm_app_service" "app_service" {
  name                    = "vmap${var.application_gateway.environment_acronym}"
  resource_group_name     = module.vmap_resource_group.resource_group_name
  location                = module.vmap_resource_group.resource_group_location
  app_service_plan_id     = module.app_service_plan.app_service_plan_id
  https_only              = true
  client_affinity_enabled = true

  identity {
    type = "SystemAssigned"
  }

  site_config {
    dotnet_framework_version  = "v5.0"
    scm_type                  = "VSTSRM"
    always_on                 = true
    use_32_bit_worker_process = false
    default_documents = [
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
    "APPINSIGHTS_INSTRUMENTATIONKEY"             = azurerm_application_insights.vmap_webapp_insights.instrumentation_key
    "APPLICATIONINSIGHTS_CONNECTION_STRING"      = "InstrumentationKey=${azurerm_application_insights.vmap_webapp_insights.instrumentation_key}"
    "APPINSIGHTS_PROFILERFEATURE_VERSION"        = "1.0.0"
    "APPINSIGHTS_SNAPSHOTFEATURE_VERSION"        = "1.0.0"
    "ApplicationInsightsAgent_EXTENSION_VERSION" = "~2"
    "InstrumentationEngine_EXTENSION_VERSION"    = "disabled"
  }

  lifecycle {
    ignore_changes = [
      app_settings
    ]
  }

  tags = var.tags
}

resource "azurerm_role_assignment" "storage_acount" {
  scope                = module.storage_account.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_app_service.app_service.identity.0.principal_id
}
