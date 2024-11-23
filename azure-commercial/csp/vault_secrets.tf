resource "azurerm_key_vault_secret" "ClarizanApi" {
  name         = "ClarizanApi"
  value        = var.csp_clarizen_api_key
  key_vault_id = azurerm_key_vault.csp_key_vault.id   

  tags = var.tags 
}

resource "azurerm_key_vault_secret" "SyncBlobContainerSAS" {
  name         = "SyncBlobContainerSAS"
  value        = var.csp_sync_blob_key
  key_vault_id = azurerm_key_vault.csp_key_vault.id 

  tags = var.tags   
}

resource "azurerm_key_vault_secret" "SuccessServicePrincipal" {
  name         = "SuccessServicePrincipal"
  value        = var.csp_success_spn_key
  key_vault_id = azurerm_key_vault.csp_key_vault.id  

  tags = var.tags
}

resource "azurerm_key_vault_secret" "SuccessUserServiceAccount" {
  name         = "SuccessUserAccountPass"
  value        = var.csp_service_account_password
  key_vault_id = azurerm_key_vault.csp_key_vault.id  

  tags = var.tags
}