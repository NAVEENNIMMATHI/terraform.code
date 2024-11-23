resource "azurerm_key_vault" "app_key_vault" {
  name                = "kvl-${lower(var.location_acronym)}-app-${lower(var.application_acronym)}-${lower(var.environment_acronym)}"
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location
  sku_name = "standard"
  #soft_delete_enabled = true
  tenant_id = data.azurerm_client_config.current.tenant_id
  enabled_for_disk_encryption = true
 
  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"

    ip_rules       = [
      "199.207.253.101/32",
      "199.207.253.96/32",
      "103.58.118.81/32",
    ]
    virtual_network_subnet_ids = [data.terraform_remote_state.shared.outputs.ase_subnet_id]
  }

  tags                = var.tags
}

resource "azurerm_key_vault_access_policy" "backupmanagementservicesp" {
  key_vault_id = azurerm_key_vault.app_key_vault.id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azuread_service_principal.backupmanagementservicesp.object_id

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
resource "azurerm_key_vault_access_policy" "encryptApp" {
  key_vault_id = azurerm_key_vault.app_key_vault.id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azuread_service_principal.encryptApp.id
  key_permissions = [
      "Wrapkey",
    ]
  secret_permissions = [
      "Get",
      "Set",
      "List",
      "Backup",
    ]
}

resource "azurerm_key_vault_access_policy" "keyvault_admin" {
  key_vault_id = azurerm_key_vault.app_key_vault.id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azuread_group.cloudops_keyvault_admin.object_id

  certificate_permissions = []

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


resource "azurerm_key_vault_access_policy" "da_keyvault_admins" {
  key_vault_id = azurerm_key_vault.app_key_vault.id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azuread_group.client_keyvault_admin.object_id

  certificate_permissions = [
      "Get",
      "List",
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


  ##Applications Access Policies
  
  resource "azurerm_key_vault_access_policy" "app_access_policies" {
    
  key_vault_id = azurerm_key_vault.app_key_vault.id
  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = azurerm_app_service.appservice_web.identity.0.principal_id
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



