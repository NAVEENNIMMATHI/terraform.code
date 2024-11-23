resource "azurerm_netapp_account" "core" {
  count    = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? 1 : 0
  
  name                  = "netapp-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name   = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? azurerm_resource_group.netapp[0].name : ""
  location              = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? azurerm_resource_group.netapp[0].location : ""

  active_directory {
    username            = var.environment_acronym == "pd" ? var.netapp_user_name : var.domain_user_name
    password            = var.environment_acronym == "pd" ? var.netapp_user_password : var.domain_user_password
    smb_server_name     = "napc${var.location_acronym}${var.environment_acronym}"
    dns_servers         = var.hub_vnet_dns_servers
    domain              = var.domain_name
    organizational_unit = var.ou_path
  }

  tags                = var.tags
}

resource "azurerm_netapp_pool" "core" {
  count    = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? 1 : 0

  name                = "cp-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  account_name        = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? azurerm_netapp_account.core[0].name : ""
  resource_group_name = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? azurerm_resource_group.netapp[0].name : ""
  location            = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? azurerm_resource_group.netapp[0].location : ""
  service_level       = "Premium"
  size_in_tb          = 4

  tags                = var.tags
}

resource "azurerm_netapp_volume" "core" {
  count    = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? 1 : 0

  name                = "hpl-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? azurerm_resource_group.netapp[0].name : ""
  location            = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? azurerm_resource_group.netapp[0].location : ""
  account_name        = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? azurerm_netapp_account.core[0].name : ""
  pool_name           = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? azurerm_netapp_pool.core[0].name : ""
  volume_path         = "hpl-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  service_level       = "Premium"
  subnet_id           = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? azurerm_subnet.netapp[0].id : ""
  protocols           = ["CIFS"]
  storage_quota_in_gb = 500

  lifecycle {
    prevent_destroy   = true
  }
  
  tags                = var.tags
}