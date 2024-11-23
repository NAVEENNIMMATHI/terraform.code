resource "azuread_group" "da_keyvault_admins" {
  name = "CO-DA-KeyVault-Admins${upper(var.ad_group_environment_suffix)}"
}
resource "azuread_group" "da_vm_admins" {
  name = "CO-DA-VM-Admins${upper(var.ad_group_environment_suffix)}"
}
resource "azuread_group" "da_vm_build_admins" {
  name = "CO-DA-VM-Build-Admins${upper(var.ad_group_environment_suffix)}"
}
resource "azuread_group" "da_vm_wkstn_users" {
  name = "CO-DA-WKSTN-Users-${upper(var.ad_group_environment_suffix)}"
}
resource "azuread_group" "da_vm_build_users" {
  name = "CO-DA-Build-Users-${upper(var.ad_group_environment_suffix)}"
}
resource "azuread_group" "da_smb_reader" {
  name = "CO-DA-SMB-Readers-${upper(var.ad_group_environment_suffix)}"
}
resource "azuread_group" "da_smb_contributor" {
  name = "CO-DA-SMB-Contributors-${upper(var.ad_group_environment_suffix)}"
  members = [
    azuread_group.da_vm_wkstn_users.object_id,
    azuread_group.da_vm_build_users.object_id
  ]
}