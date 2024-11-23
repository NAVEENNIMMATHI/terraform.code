# Get spoke virtual network
data "azurerm_virtual_network" "spokevnet" {
  name                = var.spoke_vnet_name
  resource_group_name = var.spoke_vnet_rgname
}

data "template_file" "ps1" {
  template = file("win_initialise_data_disk.ps1")
}

data "azuread_service_principal" "encryptApp" {
  display_name = var.encryptapp_sp_name
}

data "azurerm_client_config" "current" {}
data "azurerm_subscription" "current" {}

data "azurerm_log_analytics_workspace" "spoke_law" {
  name                = var.spoke_law_name
  resource_group_name = var.spoke_law_rg_name
}

data "azuread_service_principal" "spnforsynpaseaccess" {
  display_name = var.spn_name
}

data "azuread_group" "synpaseaccess" {
  name = "AAD DC Administrators"
}


data "azurerm_private_dns_zone" "dns_zone_storage_file" {
  name                = var.private_dns_zone_name_file
  resource_group_name = var.private_dns_zone_resource_group_name
  provider            = azurerm.dns
}

data "azurerm_private_dns_zone" "dns_zone_keyvault" {
  name                = var.private_dns_zone_name_vaultcore
  resource_group_name = var.private_dns_zone_resource_group_name
  provider            = azurerm.dns
}


data "azurerm_private_dns_zone" "dns_zone_registry" {
  name                = var.private_dns_zone_name_azurecr
  resource_group_name = var.private_dns_zone_resource_group_name
  provider            = azurerm.dns
}

data "azurerm_user_assigned_identity" "agentpool" {
  name                = "${azurerm_kubernetes_cluster.aks_mip.name}-agentpool"
  resource_group_name = azurerm_kubernetes_cluster.aks_mip.node_resource_group
  depends_on = [
    azurerm_kubernetes_cluster.aks_mip
  ]
}

data "azurerm_user_assigned_identity" "agic_identity" {
  name                = "ingressapplicationgateway-${azurerm_kubernetes_cluster.aks_mip.name}"
  resource_group_name = azurerm_kubernetes_cluster.aks_mip.node_resource_group
  depends_on = [
    azurerm_kubernetes_cluster.aks_mip
  ]
}


data "azurerm_resource_group" "aks_node" {
  name = azurerm_kubernetes_cluster.aks_mip.node_resource_group
  depends_on = [
    azurerm_kubernetes_cluster.aks_mip
  ]
}

data "azurerm_private_dns_zone" "dns_zone_postgresql" {
  name                = var.private_dns_zone_name_postgres
  resource_group_name = var.private_dns_zone_resource_group_name
  provider            = azurerm.dns
}

data "azurerm_private_dns_zone" "dns_zone_azmk8s" {
  name                = var.private_dns_zone_name_azmk8s
  resource_group_name = var.private_dns_zone_resource_group_name
  provider            = azurerm.dns
}

# data "azurerm_recovery_services_vault" "vault" {
#   name                = var.recoveryServicesVaultName
#   resource_group_name = var.recoveryServicesVaultResourceGroupName
# }