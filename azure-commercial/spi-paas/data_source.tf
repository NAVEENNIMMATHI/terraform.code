data "azurerm_client_config" "current" {
}

data "azurerm_subscription" "current" {
}

data "azuread_service_principal" "encryptappsp" {
  display_name        = var.encryptapp_service_principal_name
}

data "azuread_service_principal" "backupmanagementservicesp" {
  display_name        = "Backup Management Service"
}

data "azurerm_subnet" "spiappsubnet" {
  name                 = var.spiappsubnetname
  virtual_network_name = var.spiappvnetname
  resource_group_name  = var.spivnetresourcegroup
}

data "azurerm_virtual_network" "spivnet" {
  name                = var.spiappvnetname
  resource_group_name = var.spivnetresourcegroup
}

data "template_file" "ps1" {
  template            = file("win_initialise_data_disk.ps1")
}

data "azurerm_resource_group" "corerg" {
  provider = azurerm.core
  name     = var.corevnetresourcegroup
}

data "azurerm_resource_group" "newcorerg" {
  provider = azurerm.newcore
  name     = var.newcorevnetresourcegroup
}

data "azurerm_virtual_network" "corevnet" {
  provider            = azurerm.core
  name                = var.corevnetname
  resource_group_name = data.azurerm_resource_group.corerg.name
}

data "azurerm_virtual_network" "newcorevnet" {
  provider            = azurerm.newcore
  name                = var.newcorevnetname
  resource_group_name = data.azurerm_resource_group.newcorerg.name
}
