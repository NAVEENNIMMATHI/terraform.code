
resource "azurerm_key_vault" "key_vault" {
  name                = "kvl-${var.location_acronym}-app-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name = module.grantcarerg.resource_group_name
  location            = module.grantcarerg.resource_group_location
  sku_name = "standard"
  soft_delete_enabled = true
  tenant_id = data.azurerm_client_config.current.tenant_id
  enabled_for_disk_encryption = true
  enabled_for_template_deployment = true

  tags                = var.tags

}

resource "azurerm_key_vault_access_policy" "backupmanagementservicesp" {
  key_vault_id = azurerm_key_vault.key_vault.id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azuread_service_principal.backupmanagementservicesp.object_id

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

resource "azurerm_key_vault_access_policy" "encryptApp" {
  key_vault_id = azurerm_key_vault.key_vault.id

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
    storage_permissions = [
     "get", 
     "list", 
     "delete", 
     "set", 
     "update", 
     "regeneratekey", 
     "getsas", 
     "listsas", 
     "deletesas", 
     "setsas", 
     "recover", 
     "backup", 
     "restore", 
     "purge"
      
 ]
}

resource "azurerm_key_vault_access_policy" "cloudops_keyvault_admin" {
  key_vault_id = azurerm_key_vault.key_vault.id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azuread_group.cloudops_keyvault_admin.object_id

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
      "DeleteIssuers",
      #"Purge",
    ]

    key_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      /*"Decrypt",
      "Encrypt",
      "UnwrapKey",
      "WrapKey",
      "Verify",
      "Sign",
      */
    ]

    secret_permissions = [
      "Get",
     "List",
      "Set",
      "Delete",
       "Recover",
      "Backup",
       "Restore",
       
    ]
}

resource "azurerm_key_vault_access_policy" "client_keyvault_admin" {
  key_vault_id = azurerm_key_vault.key_vault.id

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
      "Purge"
      
    ]
}
/*
Give  user account permission to managed storage accounts
*/

resource "azurerm_key_vault_access_policy" "user_managed_storage_account" {
  key_vault_id = azurerm_key_vault.key_vault.id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = azuread_user.d365Servicesaccountname.object_id

  certificate_permissions = []

    key_permissions = [
      "get",
      "list",
         ]

    secret_permissions = [
      "get",
      "list",
           
    ]
    
 storage_permissions = [
     "get", 
     "list", 
     "delete", 
     "set", 
     "update", 
     "regeneratekey", 
     "getsas", 
     "listsas", 
     "deletesas", 
     "setsas", 
     "recover", 
     "backup", 
     "restore", 
     "purge"
      
 ]
}
/*

resource "azurerm_key_vault_access_policy" "spn_devops_env" {
  key_vault_id = azurerm_key_vault.key_vault.id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azuread_service_principal.spn_devops_env.object_id

  certificate_permissions = []

    key_permissions = [
      "get",
      "list",
         ]

    secret_permissions = [
      "get",
      "list",
           
    ]
    
 storage_permissions = [
     "get", 
     "list", 
     "delete", 
     "set", 
     "update", 
     "regeneratekey", 
     "getsas", 
     "listsas", 
     "deletesas", 
     "setsas", 
     "recover", 
     "backup", 
     "restore", 
     "purge"
      
 ]
}
*/