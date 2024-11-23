data "azurerm_subscription" "subscription_id" {
}

data "azurerm_storage_account" "vmdiagnosticslogs" {
  name                = module.vmdiagnosticslogssa.storage_account_name
  resource_group_name = module.loganalyticsrg.resource_group_name
}

data "azuread_service_principal" "timappsp" {
  display_name = var.service_principal_name
}

data "template_file" "ps1" {
  template = file("win_initialise_data_disk.ps1")
}

data "template_file" "xml" {
  template = file("windows-config.xml.tpl")
}