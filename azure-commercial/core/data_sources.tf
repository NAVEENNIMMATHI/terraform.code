data "azurerm_client_config" "current" {
}

data "azurerm_subscription" "current" {
}

data "azurerm_subscription" "spokeapp" {
  subscription_id = var.spokeapp_subscription_id
}

data "template_file" "ps1" {
  template = "${file("win_initialise_data_disk.ps1")}"
}

data "template_file" "xml" {
  template = "${file("windows-config.xml.tpl")}"
}

data "azurerm_resource_group" "disk_encrypt" {
  name = var.diskencryptvault_rg_name
}

data "azuread_group" "wvd_remote_group" {
  name = "AAD DC Administrators"
}

data "azurerm_automation_account" "ama-use-automation-runbook" {
  name = var.automation_account_name
  resource_group_name = var.automation_account_resource_group_name
}

data "azurerm_resource_group" "core_kvl" {
  name = var.core_kvl_rgp
}

data "azurerm_key_vault" "core" {
  name                = var.core_kvl_name
  resource_group_name = var.core_kvl_rgp
}


data "azurerm_resource_group" "aks_node" {
  name  = "RGP-USE-CORE-AKS-NODE-${upper(var.environment_acronym)}"
}
data "azurerm_user_assigned_identity" "agentpool" {
  name                = "aks-use-core-${var.environment_acronym}-agentpool"
  resource_group_name = data.azurerm_resource_group.aks_node.name
}

data "azurerm_subnet" "aaddsdomain" {
  name = var.sub_aaddsdomain_name
  virtual_network_name = azurerm_virtual_network.hub.name
  resource_group_name = azurerm_resource_group.hubvnet.name
}

data "azurerm_subnet" "aaddsvm" {
  name = var.sub_aaddsvm_name
  virtual_network_name = azurerm_virtual_network.hub.name
  resource_group_name = azurerm_resource_group.hubvnet.name
}

data "azurerm_private_dns_zone" "vault_private_link" {
  provider            = azurerm.prvt_dns_subscription
  name                = var.private_dns_zone_vault
  resource_group_name = var.private_dns_zone_resource_group
}

data "azurerm_private_dns_zone" "automation_private_link" {
  provider            = azurerm.prvt_dns_subscription
  name                = var.private_dns_zone_automation
  resource_group_name = var.private_dns_zone_resource_group
}

data "local_file" "stop-vm" {
  filename = "StopVM.ps1"
}

data "local_file" "remove-instance" {
  filename = "RemoveInstance.ps1"
}