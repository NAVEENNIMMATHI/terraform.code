resource "azurerm_key_vault" "fpikv" {
    name                = var.environment=="production" ? "copeuskey01cospi" : "kvl-${lower(var.location_acronym)}-${lower(var.application_acronym)}-${lower(var.environment_acronym)}"
    resource_group_name = module.backuprecoveryrg.resource_group_name
    location            = module.backuprecoveryrg.resource_group_location
    tenant_id           = data.azurerm_client_config.current.tenant_id
    sku_name            = "standard"
    tags                = var.tags
}


resource "azurerm_key_vault_access_policy" "client" {
    key_vault_id = azurerm_key_vault.fpikv.id
    tenant_id    = data.azurerm_client_config.current.tenant_id
    object_id    = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
      "List",
    ]

    secret_permissions = [
      "Get",
      "List",
    ]

    certificate_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
    ]
}

resource "azurerm_key_vault_access_policy" "backupmanagement" {
    key_vault_id = azurerm_key_vault.fpikv.id
    tenant_id    = data.azurerm_client_config.current.tenant_id
    object_id    = data.azuread_service_principal.backupmanagementservicesp.id

    key_permissions = [
      "Get",
      "List",
      "Backup",
    ]

    secret_permissions = [
      "Get",
      "List",
      "Backup",
    ]
}

resource "azurerm_key_vault_access_policy" "encryptapp" {
    key_vault_id = azurerm_key_vault.fpikv.id
    tenant_id    = data.azurerm_client_config.current.tenant_id
    object_id    = data.azuread_service_principal.encryptappsp.id

    key_permissions = [
      "WrapKey",
    ]

    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Backup",
    ]
}