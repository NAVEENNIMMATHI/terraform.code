data "azurerm_client_config" "current" {
}

data "template_file" "xml" {
  template            = file("windows-config.xml.tpl")
}

data "azurerm_firewall" "firewall" {
  name                = var.firewall_network_name
  resource_group_name = var.firewall_network_rg_name
  provider            = azurerm.firewall
}

data "azuread_service_principal" "encryptappsp" {
  display_name        = var.encryptapp_service_principal_name
}

data "azuread_service_principal" "backupmanagementservicesp" {
  display_name        = "Backup Management Service"
}