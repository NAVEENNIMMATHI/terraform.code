resource "azurerm_key_vault" "app_key_vault_central" {
  name                = "kvl-${var.location_acronym}-${var.application_acronym}-cen-${var.environment_acronym}"
  resource_group_name = module.applicationrg_central.resource_group_name
  location            = module.applicationrg_central.resource_group_location
  tags                = var.tags

  sku_name                    = "standard"
  #soft_delete_enabled        = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  enabled_for_disk_encryption = true
}

##Applications Access Policies
resource "azurerm_key_vault_access_policy" "appservice_spipaas_central" {
  key_vault_id = azurerm_key_vault.app_key_vault_central.id
  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id =   azurerm_app_service.appservice_spipaas_central.identity.0.principal_id
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

   depends_on           = [azurerm_key_vault.app_key_vault_central]

}

resource "azurerm_key_vault_access_policy" "appservice_spipaasrest_central" {
  key_vault_id = azurerm_key_vault.app_key_vault_central.id
  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id =   azurerm_app_service.appservice_spipaasrest_central.identity.0.principal_id
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

   depends_on           = [azurerm_key_vault.app_key_vault_central]

}

resource "azurerm_key_vault_access_policy" "spipaasadf_central" {
  key_vault_id = azurerm_key_vault.app_key_vault_central.id
  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id =   azurerm_data_factory.spipaasadf_central.identity.0.principal_id
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

   depends_on           = [azurerm_key_vault.app_key_vault_central]

}

resource "azurerm_key_vault_access_policy" "spipaas_dtf" {
  key_vault_id = azurerm_key_vault.app_key_vault_central.id
  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id =   azuread_application.spipaas_dtf.object_id
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

   depends_on           = [azurerm_key_vault.app_key_vault_central]

}
