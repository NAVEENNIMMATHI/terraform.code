data "azurerm_client_config" "current" {
}

data "azurerm_subscription" "current" {
}

data "azurerm_resource_group" "core_kvl" {
  name = var.core_kvl_rgp
}

data "azurerm_resource_group" "core_kvl_paired" {
  count = var.environment_acronym == "dv" || var.environment_acronym == "pd" ? 1 : 0
  name = var.core_kvl_rgp_paired
}

data "azurerm_key_vault" "core" {
  name                = var.core_kvl_name
  resource_group_name = var.core_kvl_rgp
}

data "azurerm_resource_group" "hubvnet" {
  name = var.hubvnet_resource_group
}

data "azurerm_virtual_network" "hub" {
  name                = var.hubvnet_virtual_network
  resource_group_name = data.azurerm_resource_group.hubvnet.name
}

data "azurerm_virtual_network" "hub_paired" {
  count = var.environment_acronym == "dv" || var.environment_acronym == "pd" ? 1 : 0
  name                = var.hubvnet_virtual_network_paired
  resource_group_name = data.azurerm_resource_group.hubvnet_paired[0].name
}

data "azurerm_route_table" "firewallroutetable" {
  name                = var.firewall_routetable_name
  resource_group_name = data.azurerm_resource_group.hubvnet.name
}

data "azurerm_route_table" "firewallroutetable_paired" {
  count = var.environment_acronym == "dv" || var.environment_acronym == "pd" ? 1 : 0
  name                = var.firewall_routetable_name_paired
  resource_group_name = data.azurerm_resource_group.hubvnet_paired[0].name
}

data "azurerm_public_ip" "fw_pip_1" {
  name                = var.firewall_pip1_name
  resource_group_name = data.azurerm_resource_group.hubvnet.name
}

data "azurerm_public_ip" "fw_pip_2" {
  name                = var.firewall_pip2_name
  resource_group_name = data.azurerm_resource_group.hubvnet.name
}

data "azurerm_public_ip" "fw_pip_3" {
  name                = var.firewall_pip3_name
  resource_group_name = data.azurerm_resource_group.hubvnet.name
}

data "azurerm_public_ip" "fw_pip_4" {
  name                = var.firewall_pip4_name
  resource_group_name = data.azurerm_resource_group.hubvnet.name
}

data "azurerm_public_ip" "fw_pip_5" {
  name                = var.firewall_pip5_name
  resource_group_name = data.azurerm_resource_group.hubvnet.name
}

data "azurerm_resource_group" "loganalytics" {
  name = var.loganalytics_resource_group
}

data "azurerm_resource_group" "hubvnet_paired" {
  count = var.environment_acronym == "dv" || var.environment_acronym == "pd" ? 1 : 0
  name = var.hubvnet_resource_group_paired
}

data "azurerm_log_analytics_workspace" "corelogs" {
  name = var.log_analytics_workspace_corelogs
  resource_group_name = data.azurerm_resource_group.loganalytics.name
}

data "azurerm_log_analytics_workspace" "hub" {
  name = var.log_analytics_workspace_hub
  resource_group_name = data.azurerm_resource_group.loganalytics.name
}

data "azurerm_eventhub_namespace" "hub" {
  name                = var.eventhub_namespace_hub
  resource_group_name = data.azurerm_resource_group.loganalytics.name
}

data "azurerm_eventhub" "hub_events" {
  name                = var.eventhub_hub_events
  resource_group_name = data.azurerm_resource_group.loganalytics.name
  namespace_name      = data.azurerm_eventhub_namespace.hub.name
}

data "azurerm_eventhub_namespace_authorization_rule" "hub_events_namespace_auth_rule" {
  name                = var.hub_events_namespace_auth_rule
  resource_group_name = data.azurerm_resource_group.loganalytics.name
  namespace_name      = data.azurerm_eventhub_namespace.hub.name
}

data "azurerm_resource_group" "aks_node" {
  count = 1
  name  = azurerm_kubernetes_cluster.aks_core[0].node_resource_group
  depends_on = [
    azurerm_kubernetes_cluster.aks_core[0]
  ]
}

data "azurerm_resource_group" "aks_node_paired" {
  count = var.environment_acronym == "dv" || var.environment_acronym == "pd" ? 1 : 0
  name  = azurerm_kubernetes_cluster.aks_core_paired[0].node_resource_group
  depends_on = [
    azurerm_kubernetes_cluster.aks_core_paired[0]
  ]
}

data "azurerm_user_assigned_identity" "agentpool" {
  count = 1
  name                = "${azurerm_kubernetes_cluster.aks_core[0].name}-agentpool"
  resource_group_name = azurerm_kubernetes_cluster.aks_core[0].node_resource_group
  depends_on = [
    azurerm_kubernetes_cluster.aks_core[0]
  ]
}

data "azurerm_user_assigned_identity" "agentpool_paired" {
  count = var.environment_acronym == "dv" || var.environment_acronym == "pd" ? 1 : 0
  name                = "${azurerm_kubernetes_cluster.aks_core_paired[0].name}-agentpool"
  resource_group_name = azurerm_kubernetes_cluster.aks_core_paired[0].node_resource_group
  depends_on = [
    azurerm_kubernetes_cluster.aks_core_paired[0]
  ]
}