resource "azurerm_app_service" "api-app" {
  name                = var.apiapp_name
  location            = module.apprg.resource_group_location
  resource_group_name = module.apprg.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.appserviceplan.id
  https_only          = "true"
  tags                = var.tags

  depends_on          = [azuread_application.fastpath_admin, azuread_application.fastpath_assure]

  app_settings = {
    "ai:iKey"                         = module.appinsights.instrumentation_key
    "ApplyDefaultMitigationWaitTime"  = "30"
    "AS_WebJob_AutoRenewTimeout"      = "480"
    "AS_WebJob_MaxConcurrentCalls"    = "10"
    "AS_WebJob_MaxTransactionTimeout" = "180"
    "AT_WebJob_AutoRenewTimeout"      = "480"
    "AT_WebJob_MaxConcurrentCalls"    = "10"
    "baseApiUrl"                      = "https://${var.api_url}"
    "clamAvServerUrl"                 = azurerm_container_group.clamav.ip_address
    "ScanFilesForVirus"               = "true"
    "ClientValidationEnabled"         = "true"
    "D365S:ImMaxLicenseAttempts"      = "30"
    "dapper:CommandTimeout"           = "210"
    "fastpathCloud:ClientId"          = data.azuread_service_principal.fastpathsp.application_id
    "fastpathCloud:ResourceGroup"     = module.apprg.resource_group_name
    "fastpathCloud:SubscriptionId"    = data.azurerm_subscription.current.subscription_id
    "fastpathCloud:TenantId"          = data.azurerm_client_config.current.tenant_id
    #"fastpathCloud:HybridConnectionsNamespace" = "${var.relayNamespace}"
    "HYBRIDCONNECTIVITY_LOGGING_ENABLED"           = "1"
    "ida:clientId"                                 = azuread_application.fastpath_assure.application_id
    "ida:Tenant"                                   = "${var.ad_domain_name}.onmicrosoft.com"
    "ida:v1AadInstance"                            = "https://login.microsoftonline.com/{0}/{1}"
    "ida:v2AadInstance"                            = "https://login.microsoftonline.com/{0}/{1}/{2}"
    "IM_WebJob_AutoRenewTimeout"                   = "60"
    "IM_WebJob_MaxConcurrentCalls"                 = "1"
    "Intacct:SenderId"                             = "Fastpath2"
    "keyVault:AuthConnection"                      = "AuthConnection"
    "keyVault:ClientSecret"                        = "ClientSecret"
    "keyVault:ConsumerKey"                         = "ConsumerKey"
    "keyVault:ConsumerSecret"                      = "ConsumerSecret"
    "keyVault:fastpathCloudClientSecret"           = "fastpathCloudClientSecret"
    "keyVault:IntacctGatewayPwd"                   = "IntacctGatewayPwd"
    "keyVault:MicrosoftServiceBusConnectionString" = "MicrosoftServiceBusConnectionString"
    "keyVault:raygunApiKey"                        = "raygunApiKey"
    "keyVault:RedisServerConnection"               = "RedisServerConnection"
    "keyVault:salt"                                = "salt"
    "keyVault:serviceBusSasKey"                    = "serviceBusSasKey"
    "keyVault:StorageConnectionString"             = "StorageConnectionString"
    "keyVault:Url"                                 = "https://${azurerm_key_vault.key_vault.name}.vault.azure.net"
    "MobileAppsManagement_EXTENSION_VERSION"       = "latest"
    "oraclefc:ReportsPath"                         = "/Custom/FP/Reports"
    "RR_WebJob_AutoRenewTimeout"                   = "60"
    "RR_WebJob_MaxConcurrentCalls"                 = "10"
    "scheduler:MaxJobCollectionQuota"              = "50"
    "serviceBus:AuthType"                          = "SharedAccessKey"
    "serviceBus:Namespace"                         = module.servicebusnamespace.servicebus_namespace_name
    "serviceBus:SasKeyName"                        = "RootManageSharedAccessKey"
    "stratusAppBaseUrl"                            = "https://${var.app_url}"
    "UnobtrusiveJavaScriptEnabled"                 = "true"
    "UT_WebJob_AutoRenewTimeout"                   = "60"
    "UT_WebJob_MaxConcurrentCalls"                 = "10"
    "webpages:Enabled"                             = "false"
    "webpages:Version"                             = "3.0.0.0"
    "WEBSITE_NODE_DEFAULT_VERSION"                 = "4.2.3"
    "wj.dapper:CommandTimeout"                     = "28800"
    "SmtpServer"                                   = var.smtp_server
    "SmtpPort"                                     = var.smtp_port
  }

  site_config {
    always_on          = "true"
    websockets_enabled = "true"
    scm_type           = "VSTSRM"
  }

  connection_string {
    name  = "CustomerStorageAccount"
    value = "DefaultEndpointsProtocol=https;AccountName=${module.appsa.storage_account_name};AccountKey=${module.appsa.primary_access_key}"
    type  = "Custom"
  }
  connection_string {
    name  = "DiagnosticStorageAccount"
    type  = "Custom"
    value = "DefaultEndpointsProtocol=https;AccountName=${var.diagnostic_storage_account_name};AccountKey=${data.azurerm_storage_account.vmdiagnosticslogs.primary_access_key}"
  }
  connection_string {
    name  = "AzureWebJobsDashboard"
    type  = "Custom"
    value = "DefaultEndpointsProtocol=https;AccountName=${var.diagnostic_storage_account_name};AccountKey=${data.azurerm_storage_account.vmdiagnosticslogs.primary_access_key}"
  }
  connection_string {
    name  = "AzureWebJobsStorage"
    type  = "Custom"
    value = "DefaultEndpointsProtocol=https;AccountName=${var.diagnostic_storage_account_name};AccountKey=${data.azurerm_storage_account.vmdiagnosticslogs.primary_access_key}"
  }

  identity {
    type = "SystemAssigned"
  }

  lifecycle {
    ignore_changes = [
      site_config,
      app_settings
    ]
  }
}

resource "azurerm_key_vault_access_policy" "fastpathassureapiAccessPolicy" {
  key_vault_id = azurerm_key_vault.key_vault.id
  tenant_id    = azurerm_app_service.api-app.identity[0].tenant_id
  object_id    = azurerm_app_service.api-app.identity[0].principal_id

  secret_permissions = [
    "get",
  ]
}

