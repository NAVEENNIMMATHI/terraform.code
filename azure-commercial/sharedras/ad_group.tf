resource "azuread_group" "keyvault_admins" {
  name = "CO-RAS-KeyVault-Admins${upper(var.ad_group_environment_suffix)}"
}
resource "azuread_group" "vm_admins" {
  name = "CO-RAS-VM-Admins${upper(var.ad_group_environment_suffix)}"
}