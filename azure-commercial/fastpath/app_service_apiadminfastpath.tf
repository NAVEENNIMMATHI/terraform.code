resource "azurerm_app_service" "support-api-app" {
  name                = var.support_apiapp_name
  location            = module.apprg.resource_group_location
  resource_group_name = module.apprg.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.appserviceplan.id
  https_only          = "true"
  tags                = var.tags

  depends_on          = [azuread_application.fastpath_admin, azuread_application.fastpath_assure]

  app_settings = {
    "AddProductModules"        = var.webhook_addproductmodules
    "azure:ClientId"           = data.azuread_service_principal.fastpathsp.application_id
    "azure:ClientSecret"       = var.spn_secret_key
    "azure:TenantId"           = var.tenant_id
    "DeleteEnvironment"        = var.webhook_deleteenvironment
    "ida:Audience"             = azuread_application.fastpath_admin.application_id
    "ida:Tenant"               = "${var.ad_domain_name}.onmicrosoft.com"
    "keyVault:AuthConnection"  = "AuthConnection"
    "keyVault:url"             = "https://${azurerm_key_vault.key_vault.name}.vault.azure.net"
    "keyVault:ClientSecret"    = "ClientSecret"
    "ida:ClientId"             = azuread_application.fastpath_assure.application_id
    "NewEnvironment"           = var.webhook_newenvironment
    "NewUser"                  = var.webhook_newuser
    "OrphanedImportHours"      = "-12"
    "raygunApiKey"             = var.raygunapikey
    "resourceGroup"            = module.apprg.resource_group_name
    "apiResource"              = var.apiapp_name
    #"hybridNamespace"          = "${var.hybridNamespace}"
    #"hybridRegion"             = "${var.region}"
    "salt"                   = var.salt
    "subscriptionId"         = data.azurerm_subscription.current.subscription_id
    "SupportEnabledSettings" = "AllowLocalAccounts;UserDomainWhitelist;Custom_LicensedConnectors;Custom_LicensedUsers;AX7_QuantificationEnabled;GP_IsLegacySql;AX5_IsLegacySql;AX_IsLegacySql;AX7_ActiveDirectoryResource;ORFC_ImportCompanyPivot;ORFC_AT_ImportHoursPerMessage;ORFC_LogWebServiceRequests;ORFC_ApiClientTimeoutMinutes;AX7_AS_PageSize;ORFC_ServiceClientTimeoutMinutes"
    "sqlServer"              = module.sqlserver.sql_server_name
    "sqlElasticPoolName"     = module.sqlserverpool.sql_elastic_pool_name
  }

  site_config {
    always_on                 = "true"
    websockets_enabled        = "false"
    use_32_bit_worker_process = "true"
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

resource "azurerm_key_vault_access_policy" "apiAccessPolicy" {
  key_vault_id = azurerm_key_vault.key_vault.id
  tenant_id    = azurerm_app_service.support-api-app.identity[0].tenant_id
  object_id    = azurerm_app_service.support-api-app.identity[0].principal_id

  secret_permissions = [
    "get",
  ]
}

