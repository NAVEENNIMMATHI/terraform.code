data "azurerm_client_config" "current" {
}

data "azurerm_subscription" "current" {
}

data "azuread_service_principal" "backupmanagementservicesp" {
  display_name = "Backup Management Service"
}

data "azuread_group" "keyvaultadmin" {
  name = var.keyvaultadminsgroupname
}

data "azuread_group" "analysisadmin" {
  name = var.analysisadminsgroupname
}

data "azurerm_resource_group" "sharedrg" {
  name = var.shared_resource_group_name
}

data "azurerm_resource_group" "backupsharedrg" {
  name = var.backup_shared_resource_group_name
}

data "azurerm_storage_account" "webappbackup" {
  name                = var.webappbackup_storage_account_name
  resource_group_name = data.azurerm_resource_group.backupsharedrg.name
}

data "azurerm_storage_container" "storagecontainer" {
  name                 = var.webappbackup_storage_container_name
  storage_account_name = data.azurerm_storage_account.webappbackup.name
}

data "azurerm_app_service_plan" "appserviceplan" {
  name                = var.app_service_plan_name
  resource_group_name = data.azurerm_resource_group.sharedrg.name
}

data "azurerm_storage_account_sas" "webappbackupsas" {
  connection_string = data.azurerm_storage_account.webappbackup.primary_connection_string
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

data "azurerm_virtual_network" "applicationvnet" {
  name                = var.virtual_network_name
  resource_group_name = data.azurerm_resource_group.sharedrg.name
}

data "azurerm_subnet" "appsubnet" {
  name                 = var.app_subnet_name
  virtual_network_name = data.azurerm_virtual_network.applicationvnet.name
  resource_group_name  = data.azurerm_resource_group.sharedrg.name
}

data "azurerm_subnet" "asesubnet" {
  name                 = var.ase_subnet_name
  virtual_network_name = data.azurerm_virtual_network.applicationvnet.name
  resource_group_name  = data.azurerm_resource_group.sharedrg.name
}

data "azurerm_subnet" "agwsubnet" {
  name                 = var.agw_subnet_name
  virtual_network_name = data.azurerm_virtual_network.applicationvnet.name
  resource_group_name  = data.azurerm_resource_group.sharedrg.name
}

