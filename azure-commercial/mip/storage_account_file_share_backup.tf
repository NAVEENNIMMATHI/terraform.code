resource "azurerm_backup_container_storage_account" "data" {
  resource_group_name = module.mathworks_rg_shared.resource_group_name
  recovery_vault_name = module.recoveryservicevault.services_vault_name
  storage_account_id  = module.mathworksclientsa.id
}

resource "azurerm_backup_policy_file_share" "backup_policy_file_share" {
  name                = "mip_backup_policy_file_share"
  resource_group_name = module.mathworks_rg_shared.resource_group_name
  recovery_vault_name = module.recoveryservicevault.services_vault_name

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
  source_storage_account_id = module.mathworksclientsa.id
  source_file_share_name    = azurerm_storage_share.clientshare.name
  backup_policy_id          = azurerm_backup_policy_file_share.backup_policy_file_share.id

  depends_on                = [azurerm_backup_container_storage_account.data,azurerm_backup_policy_file_share.backup_policy_file_share,module.mathworksclientsa]
}
