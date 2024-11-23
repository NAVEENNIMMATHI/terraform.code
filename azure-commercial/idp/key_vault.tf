resource "azurerm_key_vault" "idp_key_vault" {
  name                        = "kvl-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  location                    = module.idp_resource_group.resource_group_location
  resource_group_name         = module.idp_resource_group.resource_group_name
  enabled_for_disk_encryption = true

  sku_name  = "standard"
  tenant_id = data.azurerm_client_config.current.tenant_id
  tags      = var.tags
}

resource "azurerm_key_vault_access_policy" "idp_users" {

  key_vault_id = azurerm_key_vault.idp_key_vault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azuread_group.idp_users.object_id

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

resource "azurerm_key_vault_access_policy" "idp_app_service" {
  key_vault_id = azurerm_key_vault.idp_key_vault.id
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

resource "azurerm_key_vault_access_policy" "idp_spn" {
  key_vault_id = azurerm_key_vault.idp_key_vault.id
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
  key_vault_id = azurerm_key_vault.idp_key_vault.id
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