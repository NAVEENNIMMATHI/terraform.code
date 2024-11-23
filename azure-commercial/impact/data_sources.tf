
data "azurerm_subscription" "current" {}

data "azurerm_client_config" "current" {}

data "azurerm_virtual_network" "shared_vnet" {
  name                = var.shared_vnet_name
  resource_group_name = var.shared_vnet_rg_name
}

# data "azurerm_firewall" "firewall" {
#   name                = var.firewall_network_name
#   resource_group_name = var.firewall_network_rg_name
#   provider            = azurerm.firewall
# }

#data "template_file" "ps1" {
#  template = "${file("win_initialise_data_disk.ps1")}"
#}

data "azurerm_log_analytics_workspace" "spoke_law" {
  name                = var.environment_acronym == "uat" ? "law-use-sharedras-uat" : "law-${var.location_acronym}-spokeapp-${var.environment_acronym}"
  resource_group_name = "rgp-${var.location_acronym}-ase-${var.environment_acronym}"
}


data "azurerm_private_dns_zone" "dns_zone_registry" {
  name                = var.private_dns_zone_name_azurecr
  resource_group_name = var.private_dns_zone_resource_group_name
  provider            = azurerm.dns
}

data "azurerm_private_dns_zone" "dns_zone_database" {
  name                = var.private_dns_zone_name_database
  resource_group_name = var.private_dns_zone_resource_group_name
  provider            = azurerm.dns
}

data "azurerm_private_dns_zone" "dns_zone_synapse" {
  name                = var.private_dns_zone_name_synapse
  resource_group_name = var.private_dns_zone_resource_group_name
  provider            = azurerm.dns
}
# Uncommented block
data "azurerm_private_dns_zone" "dns_zone_dev_synapse" {
  name                = var.private_dns_zone_name_dev_synapse
  resource_group_name = var.private_dns_zone_resource_group_name
  provider            = azurerm.dns
}

data "azurerm_private_dns_zone" "dns_zone_keyvault" {

  name                = var.private_dns_zone_name_vaultcore
  resource_group_name = var.private_dns_zone_resource_group_name
  provider            = azurerm.dns
}

data "azurerm_private_dns_zone" "dns_zone_storage_blob" {
  name                = var.private_dns_zone_name_blob
  resource_group_name = var.private_dns_zone_resource_group_name
  provider            = azurerm.dns
}


data "azurerm_private_dns_zone" "dns_zone_dfs" {
  name                = var.private_dns_zone_name_dfs
  resource_group_name = var.private_dns_zone_resource_group_name
  provider            = azurerm.dns
}

data "azurerm_private_dns_zone" "dns_zone_azurewebsites" {
  name                = var.private_dns_zone_name_azurewebsites
  resource_group_name = var.private_dns_zone_resource_group_name
  provider            = azurerm.dns
}

data "azuread_service_principal" "defaultpipeline" {
  display_name = var.pipeline_service_principal_name
}
