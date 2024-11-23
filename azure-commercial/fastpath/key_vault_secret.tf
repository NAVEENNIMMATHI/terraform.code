module "keyvaultsecret-authconnection" {
  source      = "../../modules/key_vault_secret"
  name        = "AuthConnection"
  value       = "Server=${module.sqlserver.sql_server_fqdn};Database=${module.sqldatabase.sql_database_name};User ID=${var.sql_server_admin_username};Password=${var.sql_server_admin_password};Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;Enlist=false"
  keyvault_id = azurerm_key_vault.key_vault.id
  tags        = var.tags
}

module "keyvaultsecret-ConsumerKey" {
  source      = "../../modules/key_vault_secret"
  name        = "ConsumerKey"
  value       = var.consumer_key
  keyvault_id = azurerm_key_vault.key_vault.id
  tags        = var.tags
}

module "keyvaultsecret-ConsumerSecret" {
  source      = "../../modules/key_vault_secret"
  name        = "ConsumerSecret"
  value       = var.consumer_secret
  keyvault_id = azurerm_key_vault.key_vault.id
  tags        = var.tags
}

module "keyvaultsecret-fastpathCloudClientSecret" {
  source      = "../../modules/key_vault_secret"
  name        = "fastpathCloudClientSecret"
  value       = var.spn_secret_key
  keyvault_id = azurerm_key_vault.key_vault.id
  tags        = var.tags
}

module "keyvaultsecret-IntacctGatewayPwd" {
  source      = "../../modules/key_vault_secret"
  name        = "IntacctGatewayPwd"
  value       = var.intacctgatewaypwd
  keyvault_id = azurerm_key_vault.key_vault.id
  tags        = var.tags
}

module "keyvaultsecret-MicrosoftServiceBusConnectionString" {
  source      = "../../modules/key_vault_secret"
  name        = "MicrosoftServiceBusConnectionString"
  value       = module.servicebusnamespace.servicebus_namespace_connection_string
  keyvault_id = azurerm_key_vault.key_vault.id
  tags        = var.tags
}

module "keyvaultsecret-RedisServerConnection" {
  source      = "../../modules/key_vault_secret"
  name        = "RedisServerConnection"
  value       = "${module.rediscache.hostname}:${module.rediscache.port},password=${module.rediscache.primary_access_key},ssl=True,abortConnect=False"
  keyvault_id = azurerm_key_vault.key_vault.id
  tags        = var.tags
}

module "keyvaultsecret-salt" {
  source      = "../../modules/key_vault_secret"
  name        = "salt"
  value       = var.salt
  keyvault_id = azurerm_key_vault.key_vault.id
  tags        = var.tags
}

module "keyvaultsecret-serviceBusSasKey" {
  source      = "../../modules/key_vault_secret"
  name        = "serviceBusSasKey"
  value       = module.servicebusnamespace.servicebus_namespace_access_key
  keyvault_id = azurerm_key_vault.key_vault.id
  tags        = var.tags
}

module "keyvaultsecret-StorageConnectionString" {
  source      = "../../modules/key_vault_secret"
  name        = "StorageConnectionString"
  value       = module.appsa.primary_connection_string
  keyvault_id = azurerm_key_vault.key_vault.id
  tags        = var.tags
}

module "keyvaultsecret-ClientSecret" {
  source      = "../../modules/key_vault_secret"
  name        = "ClientSecret"
  value       = var.fastpath_clientsecret
  keyvault_id = azurerm_key_vault.key_vault.id
  tags        = var.tags
}

module "keyvaultsecret-Raygun" {
  source      = "../../modules/key_vault_secret"
  name        = "raygunApiKey"
  value       = var.raygunapikey
  keyvault_id = azurerm_key_vault.key_vault.id
  tags        = var.tags
}

