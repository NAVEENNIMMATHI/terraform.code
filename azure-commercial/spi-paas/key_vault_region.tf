resource "azurerm_key_vault" "app_keyvault" {
  for_each = var.key_vault
  name                = "kvl-${each.value.location_acronym}-${var.application_acronym}-${each.value.region}-${var.environment_acronym}"
 location            = module.applicationrg[each.key].resource_group_location
  resource_group_name = module.applicationrg[each.key].resource_group_name
  tags                = var.tags

  sku_name                    = "standard"
  #soft_delete_enabled        = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  enabled_for_disk_encryption = true

}

##Applications Access Policies

resource "azurerm_key_vault_access_policy" "appservice_spipaasrepgenrest" {
  for_each = var.key_vault
  key_vault_id = azurerm_key_vault.app_keyvault[each.key].id
  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id =   azurerm_app_service.appservice_spipaasrepgenrest[each.key].identity.0.principal_id
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

   depends_on           = [azurerm_key_vault.app_keyvault]

}

resource "azurerm_key_vault_access_policy" "spipaasadf" {
  for_each = var.key_vault
  key_vault_id = azurerm_key_vault.app_keyvault[each.key].id
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

   depends_on           = [azurerm_key_vault.app_keyvault]

}

resource "azurerm_key_vault_access_policy" "spipaasadfsp" {
  for_each = var.key_vault
  key_vault_id = azurerm_key_vault.app_keyvault[each.key].id
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

   depends_on           = [azurerm_key_vault.app_keyvault]

}
