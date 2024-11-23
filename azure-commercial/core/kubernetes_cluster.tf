/*
resource "azuread_group" "aks_core_ad_group" {}
resource "azurerm_kubernetes_cluster" "aks_core" {}
resource "null_resource" "dns_zone_link" {}
resource "azurerm_role_assignment" "aks_core_network" {}
resource "azurerm_role_assignment" "aks_core_acrpull" {}
resource "azurerm_role_assignment" "node_rgp_mio" {}
resource "azurerm_role_assignment" "aks_rgp_mio" {}
resource "azurerm_role_assignment" "core_kvl_mio" {}
resource "azurerm_role_assignment" "node_rgp_vmc" {}
resource "azurerm_role_assignment" "aks_rgp_vmc" {}
resource "azurerm_monitor_diagnostic_setting" "aks_core_diag" {}
resource "azurerm_kubernetes_cluster_node_pool" "windows_agent_pool" {}
*/
## Moved to Core-AKS folder ##