resource "azurerm_role_assignment" "file_share_smb_reader" {
  scope                = azurerm_storage_account.smbfileshare.id
  role_definition_name = "Storage File Data SMB Share Reader"
  principal_id         = azuread_group.da_smb_reader.id
}

resource "azurerm_role_assignment" "file_share_smb_contributor" {
  scope                = azurerm_storage_account.smbfileshare.id
  role_definition_name = "Storage File Data SMB Share Contributor"
  principal_id         = azuread_group.da_smb_contributor.id
}

resource "azurerm_role_assignment" "wkstn_host_pool_contributor" {
  count                = var.vm_count_wst
  scope                = module.wvd_wkstn.host_pool_id
  role_definition_name = "Desktop Virtualization Host Pool Contributor"
  principal_id         = element(module.windows_workstation.vm_identity_id, count.index)
}
resource "azurerm_role_assignment" "wkstn_subscription_reader" {
  count                = var.vm_count_wst
  scope                = "/subscriptions/${var.subscription_id}"
  role_definition_name = "Reader"
  principal_id         = element(module.windows_workstation.vm_identity_id, count.index)
}
resource "azurerm_role_assignment" "wkstn_netapp_reader" {
  count                = var.vm_count_wst
  scope                = "/subscriptions/${var.netapp_subscription_id}/resourceGroups/${var.netapp_resource_group}"
  role_definition_name = "Reader"
  principal_id         = element(module.windows_workstation.vm_identity_id, count.index)
}