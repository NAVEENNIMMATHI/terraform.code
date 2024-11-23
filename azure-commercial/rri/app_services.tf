resource "azurerm_app_service" "appservice_web" {
  name                = var.environment == "production" ? "${lower(var.application_name)}" : "${lower(var.application_name)}${lower(var.app_gateway_environment_acronym)}"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  app_service_plan_id = module.app_service_plan.app_service_plan_id
  https_only          = "true"

  tags = var.tags


  identity {
    type = "SystemAssigned"
  }

  site_config {
    always_on                 = "true"
    websockets_enabled        = "false"
    http2_enabled             = "true"
    use_32_bit_worker_process = "false"
    php_version               = "5.6"
    scm_type                  = "VSTSRM"
    dotnet_framework_version  = "v6.0"
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
    "APPINSIGHTS_INSTRUMENTATIONKEY"                  = azurerm_application_insights.app_insights_app.instrumentation_key,
    "APPINSIGHTS_PROFILERFEATURE_VERSION"             = "1.0.0",
    "APPINSIGHTS_SNAPSHOTFEATURE_VERSION"             = "1.0.0",
    "APPLICATIONINSIGHTS_CONNECTION_STRING"           = azurerm_application_insights.app_insights_app.connection_string,
    "ApplicationInsightsAgent_EXTENSION_VERSION"      = "~2",
    "DiagnosticServices_EXTENSION_VERSION"            = "~3",
    "InstrumentationEngine_EXTENSION_VERSION"         = "disabled",
    "SnapshotDebugger_EXTENSION_VERSION"              = "disabled",
    "WEBSITE_NODE_DEFAULT_VERSION"                    = "6.9.1",
    "WEBSITE_RUN_FROM_PACKAGE"                        = "1",
    "XDT_MicrosoftApplicationInsights_BaseExtensions" = "disabled",
    "XDT_MicrosoftApplicationInsights_Java"           = "1",
    "XDT_MicrosoftApplicationInsights_Mode"           = "recommended",
    "XDT_MicrosoftApplicationInsights_NodeJS"         = "1",
    "XDT_MicrosoftApplicationInsights_PreemptSdk"     = "disabled",
  }
}


resource "azurerm_app_service" "appservice_rest" {
  name                = var.environment == "production" ? "${lower(var.application_name)}rest" : "${lower(var.application_name)}rest${lower(var.app_gateway_environment_acronym)}"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  app_service_plan_id = module.app_service_plan.app_service_plan_id
  https_only          = "true"

  tags = var.tags

  identity {
    type = "SystemAssigned"
  }

  site_config {
    always_on                 = "false"
    websockets_enabled        = "false"
    http2_enabled             = "true"
    use_32_bit_worker_process = "false"
    php_version               = "5.6"
    scm_type                  = "VSTSRM"
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
  lifecycle {
    ignore_changes = [
      site_config
    ]
  }

  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY"                  = azurerm_application_insights.app_insights_rest_app.instrumentation_key,
    "APPINSIGHTS_PROFILERFEATURE_VERSION"             = "1.0.0",
    "APPINSIGHTS_SNAPSHOTFEATURE_VERSION"             = "1.0.0",
    "APPLICATIONINSIGHTS_CONNECTION_STRING"           = azurerm_application_insights.app_insights_rest_app.connection_string,
    "ApplicationInsightsAgent_EXTENSION_VERSION"      = "~2",
    "DiagnosticServices_EXTENSION_VERSION"            = "~3",
    "InstrumentationEngine_EXTENSION_VERSION"         = "disabled",
    "SnapshotDebugger_EXTENSION_VERSION"              = "disabled",
    "WEBSITE_NODE_DEFAULT_VERSION"                    = "6.9.1",
    "WEBSITE_RUN_FROM_PACKAGE"                        = "1",
    "XDT_MicrosoftApplicationInsights_BaseExtensions" = "disabled",
    "XDT_MicrosoftApplicationInsights_Java"           = "1",
    "XDT_MicrosoftApplicationInsights_Mode"           = "recommended",
    "XDT_MicrosoftApplicationInsights_NodeJS"         = "1",
    "XDT_MicrosoftApplicationInsights_PreemptSdk"     = "disabled",
  }
}
