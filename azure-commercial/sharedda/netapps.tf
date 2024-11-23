provider "azurerm" {
  alias           = "netapp"
  subscription_id = var.netapp_subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  features {}
}

resource "azurerm_netapp_volume" "workstation" {
  name                = "vol-${var.location_acronym}-${var.application_acronym}-wkstn-${var.environment_acronym}"
  resource_group_name = var.netapp_resource_group
  location            = var.netapp_resource_group_location
  account_name        = var.netapp_account_name
  pool_name           = var.netapp_pool_name
  volume_path         = "hpl-${var.location_acronym}-${var.application_acronym}-wkstn-${var.environment_acronym}"
  service_level       = "Premium"
  subnet_id           = var.netapp_subnet_id
  protocols           = ["CIFS"]
  storage_quota_in_gb = 100

  lifecycle {
    prevent_destroy   = true
  }

  tags                = var.tags

  provider = azurerm.netapp
}

resource "azurerm_netapp_volume" "build" {
  name                = "vol-${var.location_acronym}-${var.application_acronym}-build-${var.environment_acronym}"
  resource_group_name = var.netapp_resource_group
  location            = var.netapp_resource_group_location
  account_name        = var.netapp_account_name
  pool_name           = var.netapp_pool_name
  volume_path         = "hpl-${var.location_acronym}-${var.application_acronym}-build-${var.environment_acronym}"
  service_level       = "Premium"
  subnet_id           = var.netapp_subnet_id
  protocols           = ["CIFS"]
  storage_quota_in_gb = 100

  lifecycle {
    prevent_destroy   = true
  }

  tags                = var.tags

  provider = azurerm.netapp
}