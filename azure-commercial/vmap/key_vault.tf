resource "azurerm_key_vault" "vmap_key_vault" {
  name                        = "kvl-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  location                    = module.vmap_resource_group.resource_group_location
  resource_group_name         = module.vmap_resource_group.resource_group_name
  enabled_for_disk_encryption = true

  sku_name  = "standard"
  tenant_id = data.azurerm_client_config.current.tenant_id
  tags      = var.tags
}

resource "azurerm_key_vault_access_policy" "vmap_users" {

  key_vault_id = azurerm_key_vault.vmap_key_vault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azuread_group.vmap_users.object_id

  certificate_permissions = [
    "get",
    "list",
    "Update",
    "Create",
    "Import",
    "Delete",
    "Recover",
    "Backup",
    "Restore",
    "ManageContacts",
    "ManageIssuers",
    "GetIssuers",
    "ListIssuers",
    "SetIssuers",
    "DeleteIssuers",
  ]

  key_permissions = [
    "get",
    "list",
    "update",
    "create",
    "import",
    "delete",
    "recover",
    "backup",
    "restore",
  ]

  secret_permissions = [
    "get",
    "list",
    "set",
    "delete",
    "recover",
    "backup",
    "restore",
  ]
}

resource "azurerm_key_vault_access_policy" "vmap_app_service" {
  key_vault_id = azurerm_key_vault.vmap_key_vault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_app_service.app_service.identity[0].principal_id

  certificate_permissions = [
    "get",
    "list",
    "Update",
    "Create",
    "Import",
    "Delete",
    "Recover",
    "Backup",
    "Restore",
    "ManageContacts",
    "ManageIssuers",
    "GetIssuers",
    "ListIssuers",
    "SetIssuers",
    "DeleteIssuers",
  ]

  key_permissions = [
    "get",
    "list",
    "update",
    "create",
    "import",
    "delete",
    "recover",
    "backup",
    "restore",
  ]

  secret_permissions = [
    "get",
    "list",
    "set",
    "delete",
    "recover",
    "backup",
    "restore",
  ]
}

resource "azurerm_key_vault_access_policy" "vmap_spn" {
  key_vault_id = azurerm_key_vault.vmap_key_vault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azuread_service_principal.ad_app_web.object_id

  certificate_permissions = [
    "get",
    "list",
    "Update",
    "Create",
    "Import",
    "Delete",
    "Recover",
    "Backup",
    "Restore",
    "ManageContacts",
    "ManageIssuers",
    "GetIssuers",
    "ListIssuers",
    "SetIssuers",
    "DeleteIssuers",
  ]

  key_permissions = [
    "get",
    "list",
    "update",
    "create",
    "import",
    "delete",
    "recover",
    "backup",
    "restore",
  ]

  secret_permissions = [
    "get",
    "list",
    "set",
    "delete",
    "recover",
    "backup",
    "restore",
  ]
}

resource "azurerm_key_vault_access_policy" "backup_management_service" {
  key_vault_id = azurerm_key_vault.vmap_key_vault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azuread_service_principal.backupmanagementservicesp.id

  key_permissions = [
    "get",
    "list",
    "backup",
  ]

  secret_permissions = [
    "get",
    "list",
    "backup",
  ]
}


#Private DNS records

resource "azurerm_private_dns_a_record" "keyvault_a_record" {
  provider            = azurerm.pvt_dns_subscription
  name                = "kvl-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  zone_name           = "privatelink.vaultcore.azure.net"
  resource_group_name = var.private_dns_zone_resource_group # DEV/QA & UAT/PD share a DNS Zone with each other
  ttl                 = 3600
  records             = ["${azurerm_private_endpoint.kvl_endpoint.private_service_connection[0].private_ip_address}"]
}

resource "azurerm_private_dns_a_record" "storage_a_record" {
  provider            = azurerm.pvt_dns_subscription
  name                = lower("sto${var.location_acronym}${var.application_acronym}${var.environment_acronym}")
  zone_name           = "privatelink.blob.core.windows.net"
  resource_group_name = var.private_dns_zone_resource_group # DEV/QA & UAT/PD share a DNS Zone with each other
  ttl                 = 3600
  records             = ["${azurerm_private_endpoint.storage_endpoint.private_service_connection[0].private_ip_address}"]
}


resource "azurerm_private_dns_a_record" "sql_a_record" {
  provider            = azurerm.pvt_dns_subscription
  name                = lower("mssqlsrv-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}")
  zone_name           = "privatelink.database.windows.net"
  resource_group_name = var.private_dns_zone_resource_group # DEV/QA & UAT/PD share a DNS Zone with each other
  ttl                 = 3600
  records             = ["${azurerm_private_endpoint.sql_endpoint.private_service_connection[0].private_ip_address}"]
}
