resource "azurerm_virtual_network" "virtual_network" {
  for_each = var.application_vnet
  name                       = "vnt-${each.value.location_acronym}-${var.application_acronym}-${each.value.region}-${var.environment_acronym}"
  address_space              = each.value.address_space
  resource_group_name        = module.applicationrg[each.key].resource_group_name
  location                   = module.applicationrg[each.key].resource_group_location
  dns_servers                = var.dns_server

  tags                       = var.tags

  lifecycle {
    ignore_changes = [
      ddos_protection_plan
    ]
  }
}

resource "azurerm_subnet" "spipaasappgw_subnet" {
  for_each = var.agw_subnet
  name                       = "sub-${each.value.location_acronym}-${var.application_acronym}-${each.value.region}-agw-${var.environment_acronym}"
  address_prefixes           = each.value.address_space
  virtual_network_name       = azurerm_virtual_network.virtual_network[each.key].name
  resource_group_name        = module.applicationrg[each.key].resource_group_name
  service_endpoints          = ["Microsoft.Storage"]
}

resource "azurerm_subnet" "spipaaswst_subnet" {
  for_each = var.wst_subnet
  name                       = "sub-${each.value.location_acronym}-${var.application_acronym}-${each.value.region}-wst-${var.environment_acronym}"
  address_prefixes           = each.value.address_space
  virtual_network_name       = azurerm_virtual_network.virtual_network[each.key].name
  resource_group_name        = module.applicationrg[each.key].resource_group_name
  service_endpoints          = ["Microsoft.Storage","Microsoft.Sql"]
}


resource "azurerm_subnet" "spipaaspep_subnet" {
   for_each = var.pep_subnet
  name                       = "sub-${each.value.location_acronym}-${var.application_acronym}-${each.value.region}-pep-${var.environment_acronym}"
  address_prefixes           = each.value.address_space
  virtual_network_name       = azurerm_virtual_network.virtual_network[each.key].name
  resource_group_name        = module.applicationrg[each.key].resource_group_name
  service_endpoints          = ["Microsoft.Storage","Microsoft.Sql"]
  enforce_private_link_endpoint_network_policies = true
}
resource "azurerm_subnet" "spipaasdb_subnet" {
   for_each = var.db_subnet
  name                       = "sub-${each.value.location_acronym}-${var.application_acronym}-${each.value.region}-db-${var.environment_acronym}"
  address_prefixes           = each.value.address_space
  virtual_network_name       = azurerm_virtual_network.virtual_network[each.key].name
  resource_group_name        = module.applicationrg[each.key].resource_group_name
  service_endpoints          = ["Microsoft.Storage","Microsoft.Sql"]
  enforce_private_link_endpoint_network_policies = true
}
resource "azurerm_subnet" "spipaasappsrv_subnet" {
 for_each = var.appsrv_subnet
  name                       = "sub-${each.value.location_acronym}-${var.application_acronym}-${each.value.region}-appsrv-${var.environment_acronym}"
  address_prefixes           = each.value.address_space
  virtual_network_name       = azurerm_virtual_network.virtual_network[each.key].name
  resource_group_name        = module.applicationrg[each.key].resource_group_name
  service_endpoints          = ["Microsoft.Storage","Microsoft.Sql"]
  enforce_private_link_endpoint_network_policies = true
}
resource "azurerm_subnet" "spipaasssis_subnet" {
  for_each = var.ssis_subnet
  name                       = "sub-${each.value.location_acronym}-${var.application_acronym}-${each.value.region}-ssis-${var.environment_acronym}"
  address_prefixes           = each.value.address_space
  virtual_network_name       = azurerm_virtual_network.virtual_network[each.key].name
  resource_group_name        = module.applicationrg[each.key].resource_group_name
  service_endpoints          = ["Microsoft.Storage","Microsoft.Sql"]
}
resource "azurerm_subnet" "spipaaspbi_subnet" {
  for_each = var.pbi_subnet
  name                       = "sub-${each.value.location_acronym}-${var.application_acronym}-${each.value.region}-pbi-${var.environment_acronym}"
  address_prefixes           = each.value.address_space
  virtual_network_name       = azurerm_virtual_network.virtual_network[each.key].name
  resource_group_name        = module.applicationrg[each.key].resource_group_name
  service_endpoints          = ["Microsoft.Storage","Microsoft.Sql"]
}
resource "azurerm_subnet" "spipaasvnetint_subnet" {
  for_each = var.vnetint_subnet
  name                       = "sub-${each.value.location_acronym}-${var.application_acronym}-${each.value.region}-vnetint-${var.environment_acronym}"
  address_prefixes           = each.value.address_space
  virtual_network_name       = azurerm_virtual_network.virtual_network[each.key].name
  resource_group_name        = module.applicationrg[each.key].resource_group_name
  
  delegation {
    name = "spipaas-repgenrestapp-delegation"

    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
}
