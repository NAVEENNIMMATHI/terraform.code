resource "azurerm_backup_container_storage_account" "protection-container" {
  resource_group_name = data.azurerm_recovery_services_vault.vault.resource_group_name
  recovery_vault_name = data.azurerm_recovery_services_vault.vault.name
  storage_account_id  = module.spifishfileshare.id
}

resource "azurerm_backup_policy_file_share" "backup_policy_file_share" {
  name                = "spi_backup_policy_file_share"
  resource_group_name = data.azurerm_recovery_services_vault.vault.resource_group_name
  recovery_vault_name = data.azurerm_recovery_services_vault.vault.name

  backup {
    frequency = "Daily"
    time      = "02:30"
  }

  retention_daily {
    count = 30
  }
}

resource "azurerm_backup_protected_file_share" "backup_protected_file_share" {
  resource_group_name       = azurerm_backup_policy_file_share.backup_policy_file_share.resource_group_name
  recovery_vault_name       = azurerm_backup_policy_file_share.backup_policy_file_share.recovery_vault_name
  source_storage_account_id = module.spifishfileshare.id
  source_file_share_name    = module.SPIShare.name
  backup_policy_id          = azurerm_backup_policy_file_share.backup_policy_file_share.id

  depends_on                = [azurerm_backup_container_storage_account.protection-container,azurerm_backup_policy_file_share.backup_policy_file_share,module.SPIShare]
}

resource "azurerm_backup_protected_file_share" "backup_protected_fdd_file_share" {
  resource_group_name       = azurerm_backup_policy_file_share.backup_policy_file_share.resource_group_name
  recovery_vault_name       = azurerm_backup_policy_file_share.backup_policy_file_share.recovery_vault_name
  source_storage_account_id = module.spifishfileshare.id
  source_file_share_name    = module.FDDShare.name
  backup_policy_id          = azurerm_backup_policy_file_share.backup_policy_file_share.id

  depends_on                = [azurerm_backup_container_storage_account.protection-container,azurerm_backup_policy_file_share.backup_policy_file_share,module.FDDShare,azurerm_backup_protected_file_share.backup_protected_file_share]
}