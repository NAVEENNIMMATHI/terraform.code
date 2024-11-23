data "azurerm_client_config" "current" {}

data "azurerm_subscription" "current" {}

data "azurerm_virtual_network" "spoke_vnet" {
  name                = var.spoke_vnet_name
  resource_group_name = var.spoke_vnet_rg_name
}

data "azuread_service_principal" "devopsspn" {
  display_name = var.devopsspn_service_principal_name
}

data "azurerm_log_analytics_workspace" "spoke_law" {
  name                = var.environment_acronym == "uat" ? "law-use-sharedras-uat" : "law-${var.location_acronym}-spokeapp-${var.environment_acronym}"
  resource_group_name = "rgp-${var.location_acronym}-ase-${var.environment_acronym}"
}

data "azurerm_private_dns_zone" "dns_zone_logic_app" {
  name                = var.private_dns_zone_name_logic_app
  resource_group_name = var.private_dns_zone_resource_group_name
  provider            = azurerm.dns
}

data "azurerm_private_dns_zone" "dns_zone_storage_blob" {
  name                = var.private_dns_zone_name_blob
  resource_group_name = var.private_dns_zone_resource_group_name
  provider            = azurerm.dns
}

data "azurerm_private_dns_zone" "dns_zone_storage_table" {
  name                = var.private_dns_zone_name_table
  resource_group_name = var.private_dns_zone_resource_group_name
  provider            = azurerm.dns
}

data "azurerm_private_dns_zone" "dns_zone_storage_queue" {
  name                = var.private_dns_zone_name_queue
  resource_group_name = var.private_dns_zone_resource_group_name
  provider            = azurerm.dns
} 

data "azurerm_private_dns_zone" "dns_zone_logic_app_storage" {
  name                = var.private_dns_zone_name_logic_app_storage
  resource_group_name = var.private_dns_zone_resource_group_name
  provider            = azurerm.dns
}

data "azurerm_private_dns_zone" "dns_zone_sql" {
  name                = var.private_dns_zone_name_sql
  resource_group_name = var.private_dns_zone_resource_group_name
  provider            = azurerm.dns
}

# ECCM ACR DNS Zone

data "azurerm_private_dns_zone" "dns_zone_acr" {
  provider            = azurerm.dns
  name                = var.private_dns_zone_name_acr
  resource_group_name = var.private_dns_zone_resource_group_name
}

data "azurerm_private_dns_zone" "dns_zone_keyvault" {
  name                = var.private_dns_zone_name_vaultcore
  resource_group_name = var.private_dns_zone_resource_group_name
  provider            = azurerm.dns
}

#AKS rback
data "azurerm_user_assigned_identity" "agentpool" {
  name                = "${azurerm_kubernetes_cluster.eccm_akscluster.name}-agentpool"
  resource_group_name = azurerm_kubernetes_cluster.eccm_akscluster.node_resource_group
  depends_on = [
    azurerm_kubernetes_cluster.eccm_akscluster
  ]
}


