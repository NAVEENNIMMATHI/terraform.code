module "keyvault" {
  source                                  = "../../modules/key_vault"
  keyvault_name                           = var.environment == "production" ? "copeuskey01krt" : "kvl-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}2"
  resource_group_location                 = module.backuprecoveryrg.resource_group_location
  resource_group_name                     = module.backuprecoveryrg.resource_group_name
  encryptapp_sp_obj_id                    = data.azuread_service_principal.encryptappsp.id
  cloudops_ad_group_object_id             = data.azuread_group.cloudops_keyvault_admin.object_id
  client_ad_group_object_id               = data.azuread_group.client_keyvault_admin.object_id
  soft_delete_enabled                     = true
  tags                                    = var.tags
}

resource "azurerm_key_vault" "keyvault" {
  name                        = var.environment == "production" ? "coprdeuskey01krt" : "kvl-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  location                    = module.applicationrg.resource_group_location
  resource_group_name         = module.applicationrg.resource_group_name
  enabled_for_disk_encryption = true
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

