resource "azurerm_key_vault_secret" "ato_com_enrollment_number" {
  name         = "ATO-Com-Enrollment-Number"
  value        = "7793970"
  key_vault_id = azurerm_key_vault.key_vault.id
}

resource "azurerm_key_vault_secret" "ato_gov_enrollment_number" {
  name         = "ATO-Gov-Enrollment-Number"
  value        = "7960374"
  key_vault_id = azurerm_key_vault.key_vault.id
}

resource "azurerm_key_vault_secret" "azuread_applicationobjectid" {
  name         = "AzureAd--ApplicationObjectId"
  value        = var.azuread_applicationobjectid
  key_vault_id = azurerm_key_vault.key_vault.id
  tags = {
    "file-encoding" = "utf-8"
  }
}

resource "azurerm_key_vault_secret" "azuread_callbackpath" {
  name         = "AzureAd--CallbackPath"
  value        = "/signin-oidc"
  key_vault_id = azurerm_key_vault.key_vault.id
  tags = {
    "file-encoding" = "utf-8"
  }
}

resource "azurerm_key_vault_secret" "azuread_clientid" {
  name         = "AzureAd--ClientId"
  value        = var.azuread_clientid
  key_vault_id = azurerm_key_vault.key_vault.id  
  tags = {
    "file-encoding" = "utf-8"
  }
}

resource "azurerm_key_vault_secret" "azuread_instance" {
  name         = "AzureAd--Instance"
  value        = "https://login.microsoftonline.com/"
  key_vault_id = azurerm_key_vault.key_vault.id
  tags = {
    "file-encoding" = "utf-8"
  }
}

resource "azurerm_key_vault_secret" "azuread_serviceprincipalobjectid" {
  name         = "AzureAd--ServicePrincipalObjectId"
  value        = var.azuread_serviceprincipalobjectid
  key_vault_id = azurerm_key_vault.key_vault.id
  tags = {
    "file-encoding" = "utf-8"
  }
}

resource "azurerm_key_vault_secret" "azuread_tenantid" {
  name         = "AzureAd--TenantId"
  value        = var.azuread_tenantid
  key_vault_id = azurerm_key_vault.key_vault.id
  tags = {
    "file-encoding" = "utf-8"
  }
}

resource "azurerm_key_vault_secret" "databus_container" {
  name         = "Databus-Container"
  value        = "databus"
  key_vault_id = azurerm_key_vault.key_vault.id
}

resource "azurerm_key_vault_secret" "keyvault_comconsumptionkey" {
  name         = "KeyVault--ComConsumptionKey"
  value        = "ATO-Com-Consumption-APIKey"
  key_vault_id = azurerm_key_vault.key_vault.id
}

resource "azurerm_key_vault_secret" "keyvault_comenrollmentkey" {
  name         = "KeyVault--ComEnrollmentKey"
  value        = "ATO-Com-Enrollment-Number"
  key_vault_id = azurerm_key_vault.key_vault.id
}

resource "azurerm_key_vault_secret" "keyvault_connectionstringkey" {
  name         = "KeyVault--ConnectionStringKey"
  value        = "ATO-Reference-ConnectionString"
  key_vault_id = azurerm_key_vault.key_vault.id
  tags = {
    "file-encoding" = "utf-8"
  }
}

resource "azurerm_key_vault_secret" "keyvault_consumptionkey" {
  name         = "KeyVault--ConsumptionKey"
  value        = "ATO-Consumption-APIKey"
  key_vault_id = azurerm_key_vault.key_vault.id
}

resource "azurerm_key_vault_secret" "keyvault_govconsumptionkey" {
  name         = "KeyVault--GovConsumptionKey"
  value        = "ATO-Gov-Consumption-APIKey"
  key_vault_id = azurerm_key_vault.key_vault.id
}

resource "azurerm_key_vault_secret" "keyvault_govenrollmentkey" {
  name         = "KeyVault--GovEnrollmentKey"
  value        = "ATO-Gov-Enrollment-Number"
  key_vault_id = azurerm_key_vault.key_vault.id
}

resource "azurerm_key_vault_secret" "keyvault_servicenowkey" {
  name         = "KeyVault--ServiceNowKey"
  value        = "ATO-ServiceNow-Credentials"
  key_vault_id = azurerm_key_vault.key_vault.id
  tags = {
    "file-encoding" = "utf-8"
  }
}

resource "azurerm_key_vault_secret" "keyvault_tenantListkey" {
  name         = "KeyVault--TenantListKey"
  value        = "ATO-CO-Tenants"
  key_vault_id = azurerm_key_vault.key_vault.id
  tags = {
    "file-encoding" = "utf-8"
  }
}

resource "azurerm_key_vault_secret" "keyvault_url" {
  name         = "KeyVault--Url"
  value        = var.keyvault_url
  key_vault_id = azurerm_key_vault.key_vault.id
  tags = {
    "file-encoding" = "utf-8"
  }
}

resource "azurerm_key_vault_secret" "logging_applicationinsights_loglevel_default" {
  name         = "Logging--ApplicationInsights--LogLevel--Default"
  value        = "Information"
  key_vault_id = azurerm_key_vault.key_vault.id
  tags = {
    "file-encoding" = "utf-8"
  }
}

resource "azurerm_key_vault_secret" "logging_applicationinsights_loglevel_system" {
  name         = "Logging--ApplicationInsights--LogLevel--System"
  value        = var.logging_applicationinsights_loglevel_system
  key_vault_id = azurerm_key_vault.key_vault.id
  tags = {
    "file-encoding" = "utf-8"
  }
}

resource "azurerm_key_vault_secret" "logging_console_loglevel_default" {
  name         = "Logging--Console--LogLevel--Default"
  value        = "Debug"
  key_vault_id = azurerm_key_vault.key_vault.id
  tags = {
    "file-encoding" = "utf-8"
  }
}

resource "azurerm_key_vault_secret" "logging_console_loglevel_microsoft" {
  name         = "Logging--Console--LogLevel--Microsoft"
  value        = "Information"
  key_vault_id = azurerm_key_vault.key_vault.id
  tags = {
    "file-encoding" = "utf-8"
  }
}

resource "azurerm_key_vault_secret" "logging_console_loglevel_system" {
  name         = "Logging--Console--LogLevel--System"
  value        = "Information"
  key_vault_id = azurerm_key_vault.key_vault.id
  tags = {
    "file-encoding" = "utf-8"
  }
}

resource "azurerm_key_vault_secret" "logging_includescopes" {
  name         = "Logging--IncludeScopes"
  value        = "false"
  key_vault_id = azurerm_key_vault.key_vault.id
  tags = {
    "file-encoding" = "utf-8"
  }
}

resource "azurerm_key_vault_secret" "serilog_enrich_0" {
  name         = "Serilog--Enrich--0"
  value        = "FromLogContext"
  key_vault_id = azurerm_key_vault.key_vault.id
  tags = {
    "file-encoding" = "utf-8"
  }
}

resource "azurerm_key_vault_secret" "serilog_enrich_1" {
  name         = "Serilog--Enrich--1"
  value        = "WithMachineName"
  key_vault_id = azurerm_key_vault.key_vault.id
  tags = {
    "file-encoding" = "utf-8"
  }
}

resource "azurerm_key_vault_secret" "serilog_enrich_2" {
  name         = "Serilog--Enrich--2"
  value        = "WithThreadId"
  key_vault_id = azurerm_key_vault.key_vault.id
  tags = {
    "file-encoding" = "utf-8"
  }
}

resource "azurerm_key_vault_secret" "serilog_Host" {
  name         = "Serilog--Host"
  value        = "http-intake.logs.datadoghq.com"
  key_vault_id = azurerm_key_vault.key_vault.id
  tags = {
    "file-encoding" = "utf-8"
  }
}

resource "azurerm_key_vault_secret" "serilog_minimumLevel" {
  name         = "Serilog--MinimumLevel"
  value        = "Information"
  key_vault_id = azurerm_key_vault.key_vault.id
  tags = {
    "file-encoding" = "utf-8"
  }
}

resource "azurerm_key_vault_secret" "serilog_port" {
  name         = "Serilog--Port"
  value        = "443"
  key_vault_id = azurerm_key_vault.key_vault.id
  tags = {
    "file-encoding" = "utf-8"
  }
}

resource "azurerm_key_vault_secret" "serilog_properties_application" {
  name         = "Serilog--Properties--Application"
  value        = "ATO OFR"
  key_vault_id = azurerm_key_vault.key_vault.id
  tags = {
    "file-encoding" = "utf-8"
  }
}

resource "azurerm_key_vault_secret" "serilog_usessL" {
  name         = "Serilog--UseSSL"
  value        = "true"
  key_vault_id = azurerm_key_vault.key_vault.id
  tags = {
    "file-encoding" = "utf-8"
  }
}

resource "azurerm_key_vault_secret" "serilog_usetcp" {
  name         = "Serilog--UseTCP"
  value        = "false"
  key_vault_id = azurerm_key_vault.key_vault.id
  tags = {
    "file-encoding" = "utf-8"
  }
}

resource "azurerm_key_vault_secret" "serilog_using_0" {
  name         = "Serilog--Using--0"
  value        = var.serilog_using_0
  key_vault_id = azurerm_key_vault.key_vault.id
  tags = {
    "file-encoding" = "utf-8"
  }
}

resource "azurerm_key_vault_secret" "serilog_using_1" {
  name         = "Serilog--Using--1"
  value        = var.serilog_using_1
  key_vault_id = azurerm_key_vault.key_vault.id
  tags = {
    "file-encoding" = "utf-8"
  }
}

resource "azurerm_key_vault_secret" "serilog_writeto_0_name" {
  name         = "Serilog--WriteTo--0--Name"
  value        = "Console"
  key_vault_id = azurerm_key_vault.key_vault.id
  tags = {
    "file-encoding" = "utf-8"
  }
}

resource "azurerm_key_vault_secret" "serilog_writeto_1_args_apikey" {
  name         = "Serilog--WriteTo--1--Args--apiKey"
  value        = var.serilog_writeto_1_args_apikey
  key_vault_id = azurerm_key_vault.key_vault.id
  tags = {
    "file-encoding" = "utf-8"
  }
}

resource "azurerm_key_vault_secret" "serilog_writeto_1_args_host" {
  name         = "Serilog--WriteTo--1--Args--host"
  value        = var.serilog_writeto_1_args_host
  key_vault_id = azurerm_key_vault.key_vault.id
  tags = {
    "file-encoding" = "utf-8"
  }
}

resource "azurerm_key_vault_secret" "serilog_writeto_1_args_service" {
  name         = "Serilog--WriteTo--1--Args--service"
  value        = "ATO OFR Web"
  key_vault_id = azurerm_key_vault.key_vault.id
  tags = {
    "file-encoding" = "utf-8"
  }
}

resource "azurerm_key_vault_secret" "serilog_writeto_1_args_source" {
  name         = "Serilog--WriteTo--1--Args--source"
  value        = "KPMG"
  key_vault_id = azurerm_key_vault.key_vault.id
  tags = {
    "file-encoding" = "utf-8"
  }
}

resource "azurerm_key_vault_secret" "serilog_writeto_1_args_tags_0" {
  name         = "Serilog--WriteTo--1--Args--tags--0"
  value        = var.serilog_writeto_1_args_tags_0
  key_vault_id = azurerm_key_vault.key_vault.id
  tags = {
    "file-encoding" = "utf-8"
  }
}

resource "azurerm_key_vault_secret" "serilog_writeto_1_name" {
  name         = "Serilog--WriteTo--1--Name"
  value        = "DatadogLogs"
  key_vault_id = azurerm_key_vault.key_vault.id
  tags = {
    "file-encoding" = "utf-8"
  }
}




