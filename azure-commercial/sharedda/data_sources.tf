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

data "azurerm_private_dns_zone" "dns_zone_file" {
  name                = var.private_dns_zone_name_file
  resource_group_name = var.private_dns_zone_resource_group_name
  provider            = azurerm.dns
}