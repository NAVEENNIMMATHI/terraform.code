locals{
  legacy_prefix_vnt          = "co-${lower(var.environment_acronym)}-${var.location}-${var.application_acronym}"
}
resource "azurerm_virtual_network" "spivnet" {
  name                       = var.environment == "production"  ? "CO-${upper(var.environment_acronym)}-${var.location}-${var.application_acronym}-vnet" : "vnt-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  address_space              = [var.spivnet_address_space]
  resource_group_name        = azurerm_resource_group.cospivnetrg.name
  location                   = azurerm_resource_group.cospivnetrg.location
  dns_servers                = var.dns_servers_ip_hub_AADS

  tags                       = var.tags

  lifecycle {
    ignore_changes = [
      ddos_protection_plan
    ]
  }
}

resource "azurerm_subnet" "spiappgw_subnet" {
  name                       = var.environment == "production"   ? "${local.legacy_prefix_vnt}appgw-subnet" : "sub-${var.location_acronym}-${var.application_acronym}-appgw-${var.environment_acronym}"
  address_prefixes           = [var.subnet_address_space_appgw]
  virtual_network_name       = azurerm_virtual_network.spivnet.name
  resource_group_name        = azurerm_resource_group.cospivnetrg.name
  service_endpoints          = ["Microsoft.Storage"]
}

resource "azurerm_subnet" "spiase1_subnet" {
  name                       = var.environment ==  "production"  ? "${local.legacy_prefix_vnt}ase1-subnet" : "sub-${var.location_acronym}-${var.application_acronym}-ase-${var.environment_acronym}"
  address_prefixes           = [var.subnet_address_space_ase1]
  virtual_network_name       = azurerm_virtual_network.spivnet.name
  resource_group_name        = azurerm_resource_group.cospivnetrg.name
  service_endpoints          = ["Microsoft.Storage"]
}

resource "azurerm_subnet" "spiinfra1_subnet" {
  name                      = var.environment == "production"  ? "${local.legacy_prefix_vnt}infra1-subnet" : "sub-${var.location_acronym}-${var.application_acronym}-infra-${var.environment_acronym}"
  address_prefixes          = [var.subnet_address_space_infra1]
  virtual_network_name      = azurerm_virtual_network.spivnet.name
  resource_group_name       = azurerm_resource_group.cospivnetrg.name
  service_endpoints         = ["Microsoft.Storage"]
}

resource "azurerm_subnet" "spiweb1_subnet" {
  name                      = var.environment == "production"  ? "${local.legacy_prefix_vnt}web1-subnet" : "sub-${var.location_acronym}-${var.application_acronym}-web-${var.environment_acronym}"
  address_prefixes          = [var.subnet_address_space_web1]
  virtual_network_name      = azurerm_virtual_network.spivnet.name
  resource_group_name       = azurerm_resource_group.cospivnetrg.name
  service_endpoints         = ["Microsoft.Storage"]
}

resource "azurerm_subnet" "spiapp1_subnet" {
  name                      = var.environment == "production"  ? "${local.legacy_prefix_vnt}app1-subnet" : "sub-${var.location_acronym}-${var.application_acronym}-app-${var.environment_acronym}"
  address_prefixes          = [var.subnet_address_space_app1]
  virtual_network_name      = azurerm_virtual_network.spivnet.name
  resource_group_name       = azurerm_resource_group.cospivnetrg.name
  service_endpoints         = ["Microsoft.Storage", "Microsoft.Sql"]
}

resource "azurerm_subnet" "spidb1_subnet" {
  name                      = var.environment == "production"  ? "${local.legacy_prefix_vnt}db1-subnet" : "sub-${var.location_acronym}-${var.application_acronym}-db-${var.environment_acronym}"
  address_prefixes          = [var.subnet_address_space_db1]
  virtual_network_name      = azurerm_virtual_network.spivnet.name
  resource_group_name       = azurerm_resource_group.cospivnetrg.name
  service_endpoints         = ["Microsoft.Storage"]
}

resource "azurerm_subnet" "bstn_subnet" {
  name                      = var.environment == "production"  ? "${local.legacy_prefix_vnt}-bastion1-subnet" : "sub-${var.location_acronym}-${var.application_acronym}-bastion-${var.environment_acronym}"
  address_prefixes          = [var.subnet_address_space_bstn]
  virtual_network_name      = azurerm_virtual_network.spivnet.name
  resource_group_name       = azurerm_resource_group.cospivnetrg.name
  service_endpoints         = ["Microsoft.Storage"]
}

resource "azurerm_subnet" "GatewaySubnet" {
  name                      = "GatewaySubnet"
  address_prefixes          = [var.subnet_address_space_GatewaySubnet]
  virtual_network_name      = azurerm_virtual_network.spivnet.name
  resource_group_name       = azurerm_resource_group.cospivnetrg.name
  service_endpoints         = ["Microsoft.Storage"]
}

resource "azurerm_subnet" "private_endpoint" {
  name                      = lower("sub-${var.location_acronym}-${var.application_acronym}-pe-${var.environment_acronym}")
  address_prefixes          = [var.subnet_address_space_pe]
  virtual_network_name      = azurerm_virtual_network.spivnet.name
  resource_group_name       = azurerm_resource_group.cospivnetrg.name
  service_endpoints         = []
  enforce_private_link_endpoint_network_policies = true
}