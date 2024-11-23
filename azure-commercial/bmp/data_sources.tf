data "azurerm_client_config" "current" {
}

data "azurerm_subscription" "current" {
}

data "template_file" "ps1" {
  template = file("win_initialise_data_disk.ps1")
}

data "template_file" "xml" {
  template = file("windows-config.xml.tpl")
}

data "azuread_service_principal" "backupmanagementservicesp" {
  display_name = var.backupmanagement_service_principal_name
}

data "azuread_service_principal" "encryptapp" {
  display_name = var.encryptapp_service_principal_name
}

data "azuread_group" "cloudops_keyvault_admin" {
  name = var.cloudops_keyvault_admin_group_name
}

/*
data "azurerm_route_table" "spi_route_table" {
  name                = var.environment == "production" ? "co-p-eastus-spitoPaloAlto-udr" : "rtb-${var.location_acronym}-spi-PaloAlto-${var.environment_acronym}"
  resource_group_name = var.environment == "production" ? "CO-P-eastus-cospivnet-rg" : "RGP-${var.location_acronym}-spi-vnet-${var.environment_acronym}"
}
*/

data "azurerm_log_analytics_workspace" "cospi" {
  name                = var.spi_log_analytics_workspace_name
  resource_group_name = var.spi_log_analytics_workspace_rg_name
}

data "azurerm_route_table" "paloalto_route_table" {
  count               = var.environment == "production" ? "1" : "0"
  name                = var.paloalto_route_table_name
  resource_group_name = var.paloalto_route_table_rg_name
}

data "azurerm_private_dns_zone" "vault_private_link" {
  provider            = azurerm.pvt_dns_subscription
  name                = var.private_dns_zone_vault
  resource_group_name = var.private_dns_zone_resource_group
}

data "azurerm_private_dns_zone" "storage_private_link_blob" {
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = var.private_dns_zone_resource_group
  provider            = azurerm.dnscore
}

data "azurerm_private_dns_zone" "storage_private_link_file" {
  name                = "privatelink.file.core.windows.net"
  resource_group_name = var.private_dns_zone_resource_group
  provider            = azurerm.dnscore
}