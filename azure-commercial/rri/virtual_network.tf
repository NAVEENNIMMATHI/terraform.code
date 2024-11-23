module "applicationvnet" {
  source                  = "../../modules/virtual_network"
  virtual_network_name    = "vnt-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_location = module.applicationrg.resource_group_location
  resource_group_name     = module.applicationrg.resource_group_name
  address_space           = var.address_space
  dns_server              = var.dns_servers
  tags                    = var.tags
}

resource "azurerm_subnet" "rridbsubnet" {
  name                 = "sub-${var.location_acronym}-${var.application_acronym}-db-${var.environment_acronym}"
  virtual_network_name = module.applicationvnet.virtual_network_name
  resource_group_name  = module.applicationrg.resource_group_name
  address_prefixes     = var.subnet_name_db_address_space
  enforce_private_link_endpoint_network_policies = true

  service_endpoints = [
    "Microsoft.Sql",
    "Microsoft.Storage",
    "Microsoft.Keyvault"
  ]
}

resource "azurerm_subnet" "rripbisubnet" {
  name                 = "sub-${var.location_acronym}-${var.application_acronym}-pbi-${var.environment_acronym}"
  virtual_network_name = module.applicationvnet.virtual_network_name
  resource_group_name  = module.applicationrg.resource_group_name
  address_prefixes     = var.subnet_name_pbi_address_space
  enforce_private_link_endpoint_network_policies = true

  service_endpoints = [
    "Microsoft.Keyvault"
  ]
}

resource "azurerm_subnet" "rrimgtsubnet" {
  name                 = "sub-${var.location_acronym}-${var.application_acronym}-mgt-${var.environment_acronym}"
  virtual_network_name = module.applicationvnet.virtual_network_name
  resource_group_name  = module.applicationrg.resource_group_name
  address_prefixes     = var.subnet_name_mgt_address_space

  service_endpoints = []
}

resource "azurerm_subnet" "rriwebsubnet" {
  name                 = "sub-${var.location_acronym}-${var.application_acronym}-web-${var.environment_acronym}"
  virtual_network_name = module.applicationvnet.virtual_network_name
  resource_group_name  = module.applicationrg.resource_group_name
  address_prefixes     = var.subnet_name_web_address_space

  service_endpoints = []
}

resource "azurerm_subnet" "rriapgwsubnet" {
  name                 = "sub-${var.location_acronym}-${var.application_acronym}-apgw-${var.environment_acronym}"
  virtual_network_name = module.applicationvnet.virtual_network_name
  resource_group_name  = module.applicationrg.resource_group_name
  address_prefixes     = var.subnet_name_apgw_address_space

  service_endpoints = []
}