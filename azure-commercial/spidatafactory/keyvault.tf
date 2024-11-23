resource "azurerm_key_vault" "key_vault" {
  name                  =var.environment == "production" ? "coeuskey01datafactory" : "kvl-${var.location_acronym}-app-${var.application_acronym}-DF-${var.environment_acronym}"
  resource_group_name = azurerm_resource_group.cospidatafactoryrg.name
  location            = var.location
  

  sku_name = "standard"
  tenant_id = data.azurerm_client_config.current.tenant_id
  enabled_for_disk_encryption = true
  enabled_for_template_deployment = false

  tags = var.environment == "production" ? var.tags_vm : var.tags
    
}



resource "azurerm_key_vault_access_policy" "cospidatafactory" {
  key_vault_id = azurerm_key_vault.key_vault.id
   tenant_id = data.azurerm_client_config.current.tenant_id
  # object_id = data.azuread_service_principal.cospidatafactory.object_id
   object_id =   azurerm_data_factory.spiadf.identity.0.principal_id
  
    secret_permissions      = [
        "Get",
        "List",
        "Set",
        "Delete",
        "Recover",
        "Backup",
        "Restore",
    ]
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

resource "azurerm_key_vault_access_policy" "datafactoryspnencryp" {
  key_vault_id = azurerm_key_vault.key_vault.id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = azuread_service_principal.ad_app_datafactory.object_id

  key_permissions = [
        "WrapKey",
    ]

    secret_permissions      = [
        "Get",
        "Set",
        "List",
        "Backup",
            ]
}


resource "azurerm_key_vault_access_policy" "azuredatabricks" {
  key_vault_id = azurerm_key_vault.key_vault.id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azuread_service_principal.azuredatabricks.object_id
  key_permissions         = [
                "Get",
                "List",
                "Update",
                "Create",
                "Import",
                "Delete",
                "Recover",
                "Backup",
                "Restore",
                "Decrypt",
                "Encrypt",
                "UnwrapKey",
                "WrapKey",
                "Verify",
                "Sign",
            ]
            secret_permissions      = [
                "Get",
                "List",
            ]

  }


resource "azurerm_key_vault_access_policy" "dfusersgroup" {
  key_vault_id = azurerm_key_vault.key_vault.id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = azuread_group.dfusers_group.object_id
  key_permissions         = []
  certificate_permissions = [] 
            secret_permissions      = [
                "Get",
                "List",
                "Set",
                "Recover",
                "Backup",
                "Restore",
            ]

  }

