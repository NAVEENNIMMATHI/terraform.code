locals{
  legacy_prefix_vnt          = "co-${lower(var.environment_acronym)}-${var.location}-${var.application_acronym}"
}
resource "azurerm_virtual_network" "spipaassvnetcentral" {
  name                       = "vnt-${var.location_acronym}-${var.application_acronym}-${var.application_region}-${var.environment_acronym}"
  address_space              = var.spipaasvnet_address_space_ctr
  resource_group_name        = module.applicationrg_central.resource_group_name
  location                   = module.applicationrg_central.resource_group_location
  dns_servers                = var.dns_server

  tags                       = var.tags

  lifecycle {
    ignore_changes = [
      ddos_protection_plan
    ]
  }
}

resource "azurerm_subnet" "spipaasappgw_subnet_central" {
  name                       = "sub-${var.location_acronym}-${var.application_acronym}-${var.application_region}agw-${var.environment_acronym}"
  address_prefixes           = [var.subnet_address_space_ctrappgw]
  virtual_network_name       = azurerm_virtual_network.spipaassvnetcentral.name
  resource_group_name        = module.applicationrg_central.resource_group_name
  service_endpoints          = ["Microsoft.Storage"]
}


resource "azurerm_subnet" "spiwst1_subnet_central" {
  name                      = "sub-${var.location_acronym}-${var.application_acronym}-${var.application_region}wst-${var.environment_acronym}"
  address_prefixes          = [var.subnet_address_space_ctrwst1]
  virtual_network_name      = azurerm_virtual_network.spipaassvnetcentral.name
  resource_group_name       = module.applicationrg_central.resource_group_name
  service_endpoints         = ["Microsoft.Storage", "Microsoft.Sql"]
}



resource "azurerm_subnet" "private_endpoint_ctr" {
  name                      = lower("sub-${var.location_acronym}-${var.application_acronym}-${var.application_region}pe-${var.environment_acronym}")
  address_prefixes          = [var.subnet_address_space_ctrpe1]
  virtual_network_name      = azurerm_virtual_network.spipaassvnetcentral.name
  resource_group_name       = module.applicationrg_central.resource_group_name
  service_endpoints         = ["Microsoft.Storage"]
  enforce_private_link_endpoint_network_policies = true
}
resource "azurerm_subnet" "spipaasdb_subnet_central" {
  name                       = "sub-${var.location_acronym}-${var.application_acronym}-${var.application_region}db-${var.environment_acronym}"
  address_prefixes           = [var.subnet_address_space_ctrdb1]
  virtual_network_name       = azurerm_virtual_network.spipaassvnetcentral.name
  resource_group_name        = module.applicationrg_central.resource_group_name
  service_endpoints          = ["Microsoft.Storage","Microsoft.Sql"]
  enforce_private_link_endpoint_network_policies = true
}
resource "azurerm_subnet" "spipaasappsrv_subnet_central" {
  name                       = "sub-${var.location_acronym}-${var.application_acronym}-${var.application_region}appsrv-${var.environment_acronym}"
  address_prefixes           = [var.subnet_address_space_ctrapp1]
  virtual_network_name       = azurerm_virtual_network.spipaassvnetcentral.name
  resource_group_name        = module.applicationrg_central.resource_group_name
  service_endpoints          = ["Microsoft.Storage","Microsoft.Sql"]
  enforce_private_link_endpoint_network_policies = true
}

resource "azurerm_subnet" "spipaasadf_subnet_central" {
  name                       = "sub-${var.location_acronym}-${var.application_acronym}-${var.application_region}adf-${var.environment_acronym}"
  address_prefixes           = [var.subnet_address_space_ctradf1]
  virtual_network_name       = azurerm_virtual_network.spipaassvnetcentral.name
  resource_group_name        = module.applicationrg_central.resource_group_name
  service_endpoints          = ["Microsoft.Storage","Microsoft.Sql"]
  enforce_private_link_endpoint_network_policies = true
}
resource "azurerm_subnet" "spipaasvnetint_subnet_central" {
  name                 = "sub-${var.location_acronym}-${var.application_acronym}-${var.application_region}vnetint-${var.environment_acronym}"
  address_prefixes           = [var.subnet_address_space_webapp1]
  resource_group_name  = module.applicationrg_central.resource_group_name
  virtual_network_name = azurerm_virtual_network.spipaassvnetcentral.name
  
  delegation {
    name = "spipaas-vnetint-delegation"

    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
}
