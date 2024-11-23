data "azurerm_client_config" "current" {}


data "azuread_group" "cloudops_keyvault_admin" {
  name = var.cloudops_keyvault_admin_group_name
}

data "azuread_group" "client_keyvault_admin" {
  name = var.client_keyvault_admin_group_name
}

data "template_file" "ps1" {
  template            = file("win_initialise_data_disk.ps1")
}

data "template_file" "xml" {
  template            = file("windows-config.xml.tpl")
}

data "azuread_user" "svc_cloweb" {
  user_principal_name = var.svc_cloweb_user_principal_name
}

data "azuread_user" "tech_owner" {
  user_principal_name = (var.environment == "uat" || var.environment == "production") ? "${var.tech_owner}@kpmgusadvcloudops.onmicrosoft.com" : "${var.tech_owner}@kpmgusadvspectrum.onmicrosoft.com"
}