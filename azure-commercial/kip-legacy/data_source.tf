data "azurerm_client_config" "current" {
}

data "azurerm_subscription" "current" {
}

provider "azurerm" {
  alias           = "shared"
  subscription_id = var.vmimagesubscriptionid
  features {}
  client_id                    = var.client_id
  client_secret                = var.client_secret
  tenant_id                    = var.tenant_id
}

data "azurerm_route_table" "spi_route_table" {
  provider            = azurerm.shared
  name                = var.spi_route_table_name
  resource_group_name = var.spi_route_table_resource_group_name
}

data "template_file" "ps1" {
  template = file("win_initialise_data_disk.ps1")
}

data "azuread_service_principal" "encryptappsp" {
  display_name = var.encryptapp_service_principal_name
}

data "azuread_service_principal" "backupmanagementservicesp" {
  display_name = "Backup Management Service"
}

data "azuread_group" "GlobalRDSGroup" {
  name         = var.GlobalRDSGroup_name
}

data "azuread_group" "RDPUsers" {
  name = azuread_group.RDPUsers.name
}

data "azurerm_role_definition" "contributor" {
  name = "Contributor"
}

#Managed Identities for App Services
data "azuread_service_principal" "kipdev_sp" {
  count        = var.target_deployment_environment == "nonprod" ? 1 : 0

  display_name = var.app_service_name_kipdev
}

data "azuread_service_principal" "kiprestdev_sp" {
  count        = var.target_deployment_environment == "nonprod" ? 1 : 0

  display_name = var.app_service_name_kiprestdev
}

data "azuread_service_principal" "mep-kipdev_sp" {
  count        = var.target_deployment_environment == "nonprod" ? 1 : 0

  display_name = var.app_service_name_mep-kipdev
}

data "azuread_service_principal" "meprest-kipdev_sp" {
  count        = var.target_deployment_environment == "nonprod" ? 1 : 0

  display_name = var.app_service_name_meprest-kipdev
}

data "azuread_service_principal" "kipqa_sp" {
  count        = var.target_deployment_environment == "nonprod" ? 1 : 0

  display_name = var.app_service_name_kipqa
}

data "azuread_service_principal" "kiprestqa_sp" {
  count        = var.target_deployment_environment == "nonprod" ? 1 : 0

  display_name = var.app_service_name_kiprestqa
}

data "azuread_service_principal" "mep-kipqa_sp" {
  count        = var.target_deployment_environment == "nonprod" ? 1 : 0

  display_name = var.app_service_name_mep-kipqa
}

data "azuread_service_principal" "meprest-kipqa_sp" {
  count        = var.target_deployment_environment == "nonprod" ? 1 : 0

  display_name = var.app_service_name_meprest-kipqa
}

data "azuread_service_principal" "dasnp_sp" {
  count        = var.target_deployment_environment == "nonprod" ? 1 : 0

  display_name = var.app_service_name_dasnp
}

data "azuread_service_principal" "dasrestnp_sp" {
  count        = var.target_deployment_environment == "nonprod" ? 1 : 0

  display_name = var.app_service_name_dasrestnp
}

data "azuread_service_principal" "functionapp_dev_sp" {
  count        = var.target_deployment_environment == "nonprod" ? 1 : 0

  display_name = var.functionapp_name_dev
}

data "azuread_service_principal" "functionapp_qa_sp" {
  count        = var.target_deployment_environment == "nonprod" ? 1 : 0

  display_name = var.functionapp_name_qa
}

#Managed Identity for Windows Services VM
data "azuread_service_principal" "windows_services_vm_sp" {
  display_name = var.windows_services_vm_name
}


