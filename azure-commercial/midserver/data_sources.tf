data "azurerm_key_vault" "encryptapp_key_vault" {
  name                = var.encryptapp_keyvault_name
  resource_group_name = var.encryptapp_keyvault_rg
}

data "azuread_service_principal" "encryptappsp" {
  display_name = var.encryptapp_sp_name
}

data "template_file" "ps1" {
  template = "${file("win_initialise_data_disk.ps1")}"
}

data "template_file" "xml" {
  template = "${file("windows-config.xml.tpl")}"
}