resource "azurerm_key_vault" "keyvault" {
  name                        = "${var.key_vault_name_project}${var.uniqueresourcesuffix}"
  location                    = data.azurerm_resource_group.sharedrg.location
  resource_group_name         = data.azurerm_resource_group.sharedrg.name
  enabled_for_disk_encryption = true

  #count = "${var.target_deployment_environment == "prod" ? 1 : 0}"

  sku_name = "standard"

  tenant_id = data.azurerm_client_config.current.tenant_id

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azuread_service_principal.backupmanagementservicesp.id

    key_permissions = [
      "get",
      "list",
      "backup"
    ]

    secret_permissions = [
      "get",
      "list",
      "backup"
    ]
  }

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azuread_group.keyvaultadmin.object_id

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
      "DeleteIssuers"
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
      "restore"
    ]

    secret_permissions = [
      "get",
      "list",
      "set",
      "delete",
      "recover",
      "backup",
      "restore"
    ]
  }

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = azuread_group.adgroup.object_id

    secret_permissions = [
      "get",
      "list"
    ]
  }

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = azurerm_user_assigned_identity.identity.principal_id

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
      "DeleteIssuers"
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
      "restore"
    ]

    secret_permissions = [
      "get",
      "list",
      "set",
      "delete",
      "recover",
      "backup",
      "restore"
    ]
  }

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = var.krtbuildvm_objectid

    certificate_permissions = [
      "get",
      "list"
    ]

    key_permissions = [
      "get",
      "list"
    ]

    secret_permissions = [
      "get",
      "list"
    ]
  }

  tags = var.tags
}

