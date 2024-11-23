data "azurerm_client_config" "current" {
}

data "azurerm_subscription" "current" {
}

data "azurerm_route_table" "spi_route_table" {
  count               = var.environment == "production" ? "1" : "0"
  name                = var.spi_route_table_name
  resource_group_name = var.spi_route_table_resource_group_name
}

/*
data "azurerm_log_analytics_workspace" "cospi" {
  name                = var.cospi_log_analytics_workspace_name
  resource_group_name = var.cospi_log_analytics_workspace_resource_group_name
}
*/

data "template_file" "ps1" {
  template = file("win_initialise_data_disk.ps1")
}

data "template_file" "xml" {
  template = file("windows-config.xml.tpl")
}

data "azuread_service_principal" "encryptappsp" {
  display_name = var.encryptapp_service_principal_name
}

data "azuread_service_principal" "backupmanagementservicesp" {
  display_name = var.backupmanagement_service_principal_name
}

data "azuread_group" "cloudops_keyvault_admin" {
  name = var.cloudops_keyvault_admin
}

data "azuread_group" "client_keyvault_admin" {
  name = var.client_keyvault_admin
}

data "azuread_group" "keyvaultadmin" {
  name = var.keyvaultadminsgroupname
}

data "azurerm_storage_account_sas" "webappbackupsas" {
  connection_string = module.webappbackupsa.primary_connection_string
  https_only        = true

  resource_types {
    service   = true
    container = true
    object    = true
  }

  services {
    blob  = true
    queue = false
    table = false
    file  = false
  }

  start  = "2019-03-21"
  expiry = "2021-03-21"

  permissions {
    read    = false
    write   = true
    delete  = false
    list    = false
    add     = false
    create  = false
    update  = false
    process = false
  }
}
