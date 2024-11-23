
data "azurerm_virtual_network" "spokevnet" {
  name = var.spoke_vnet_name
  resource_group_name = data.azurerm_resource_group.spokevnetrgname.name
}

data "azurerm_resource_group" "spokevnetrgname" {
  name = var.spokevnetrgname
}



data "template_file" "ps1" {
  template = "${file("win_initialise_data_disk.ps1")}"
}

data "azuread_service_principal" "encryptApp" {
  display_name = var.encryptapp_sp_name
}

data "azurerm_client_config" "current" {}
data "azurerm_subscription" "current" {}

data "azurerm_log_analytics_workspace" "spoke_law" {
  name                = var.environment_acronym == "uat" ? "law-use-sharedras-uat" : "law-${var.location_acronym}-spokeapp-${var.environment_acronym}"
  resource_group_name = "rgp-${var.location_acronym}-ase-${var.environment_acronym}"
}

data "azurerm_private_dns_zone" "dns_zone_databricks" {
  name                = var.private_dns_zone_name_databricks
  resource_group_name = var.private_dns_zone_resource_group_name
  provider            = azurerm.dns
}

data "azurerm_private_dns_zone" "dns_zone_datafactory" {
  name                = var.private_dns_zone_name_datafactory
  resource_group_name = var.private_dns_zone_resource_group_name
  provider            = azurerm.dns
}

data "azurerm_private_dns_zone" "dns_zone_storage_blob" {
  name                = var.private_dns_zone_name_blob
  resource_group_name = var.private_dns_zone_resource_group_name
  provider            = azurerm.dns
}

data "azurerm_private_dns_zone" "dns_zone_storage_queue" {
  name                = var.private_dns_zone_name_queue
  resource_group_name = var.private_dns_zone_resource_group_name
  provider            = azurerm.dns
}

data "azurerm_private_dns_zone" "dns_zone_synapse" {
  name                = var.private_dns_zone_name_synapse
  resource_group_name = var.private_dns_zone_resource_group_name
  provider            = azurerm.dns
}

data "azurerm_private_dns_zone" "dns_zone_dev_synapse" {
  name                  = var.private_dns_zone_name_dev_synapse
  resource_group_name   = var.private_dns_zone_resource_group_name
  provider            = azurerm.dns
}

data "azurerm_private_dns_zone" "dns_zone_azurewebsites" {
  name                = var.private_dns_zone_name_azurewebsites
  resource_group_name = var.private_dns_zone_resource_group_name
  provider            = azurerm.dns
}

data "azurerm_private_dns_zone" "dns_zone_database" {
  name                = var.private_dns_zone_name_database
  resource_group_name = var.private_dns_zone_resource_group_name
  provider            = azurerm.dns
}

data "azurerm_private_dns_zone" "dns_zone_azmk8s" {
  name                = var.private_dns_zone_name_azmk8s
  resource_group_name = var.private_dns_zone_resource_group_name
  provider            = azurerm.dns
}



data "azuread_service_principal" "spnforsynpaseaccess" {
  display_name = var.spn_name
}

data "azuread_group" "synpaseaccess" {
  name = "AAD DC Administrators"
}

data "azurerm_private_dns_zone" "dns_zone_keyvault" {

name                = var.private_dns_zone_name_vaultcore
resource_group_name = var.private_dns_zone_resource_group_name
provider            = azurerm.dns
}

data "azurerm_private_dns_zone" "dns_zone_dfs" {
  name                = var.private_dns_zone_name_dfs
  resource_group_name = var.private_dns_zone_resource_group_name
  provider            = azurerm.dns
}

data "azurerm_private_dns_zone" "dns_zone_registry" {
  name                = var.private_dns_zone_name_azurecr
  resource_group_name = var.private_dns_zone_resource_group_name
  provider            = azurerm.dns
}

data "azurerm_user_assigned_identity" "agentpool" {
  name                = "${azurerm_kubernetes_cluster.aks_mdp.name}-agentpool"
  resource_group_name = azurerm_kubernetes_cluster.aks_mdp.node_resource_group
  depends_on = [
    azurerm_kubernetes_cluster.aks_mdp
  ]
}

data "azurerm_resource_group" "aks_node" {
  name  = azurerm_kubernetes_cluster.aks_mdp.node_resource_group
  depends_on = [
    azurerm_kubernetes_cluster.aks_mdp
  ]
}


data "azurerm_resource_group" "hub" {
  provider = azurerm.hub
  name     = var.hub_vnet_resource_group_name
}

data "azurerm_virtual_network" "hub" {
  provider            = azurerm.hub
  name                = var.hub_vnet_name
  resource_group_name = data.azurerm_resource_group.hub.name
}

data "azurerm_resource_group" "transit" {
  provider = azurerm.transit
  name     = var.transit_vnet_resource_group_name
}

data "azurerm_virtual_network" "transit" {
  provider            = azurerm.transit
  name                = var.transit_vnet_name
  resource_group_name = data.azurerm_resource_group.transit.name
}
