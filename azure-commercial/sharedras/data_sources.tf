data "template_file" "ps1" {
  template = "${file("win_initialise_data_disk.ps1")}"
}

data "template_file" "xml" {
  template = "${file("windows-config.xml.tpl")}"
}

data "azuread_service_principal" "encryptApp" {
  display_name = var.encryptapp_sp_name
}

data "azuread_group" "cloudops_keyvault_admin" {
  name = var.cloudops_keyvault_admin_group_name
}