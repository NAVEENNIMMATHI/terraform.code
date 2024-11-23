data "azurerm_client_config" "current" {}

data "template_file" "ps1" {
  template = "${file("win_initialise_data_disk.ps1")}"
}

data "template_file" "xml" {
  template = "${file("windows-config.xml.tpl")}"
}

data "azurerm_log_analytics_workspace" "cospi" {
  name                = "${var.cospi_log_analytics_workspace_name}"
  resource_group_name = "${var.cospi_log_analytics_workspace_resource_group_name}"
}

data "azurerm_azuread_service_principal" "backupmanagementservicesp" {
  display_name = "Backup Management Service"
}


data "azurerm_azuread_service_principal" "encryptappsp" {
  display_name = "${var.encryptapp_service_principal_name}"
}

data "azurerm_image" "eu-cis-hardened-win2016-20190111-image" {
  name                = "${var.eu-cis-hardened-win2016-20190111-image_name}"
  resource_group_name = "${var.eu-cis-hardened-win2016-20190111-image_resource_group_name}"
}
