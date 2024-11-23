module "applicationvnet" {
  source                  = "../../modules/virtual_network"
  virtual_network_name    = var.environment == "production" ? "co-p-eastus-co${var.application_acronym}-vnet" : "vnt-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_location = module.applicationrg.resource_group_location
  resource_group_name     = module.applicationrg.resource_group_name
  address_space           = var.address_space
  dns_server              = var.dns_server
  tags                    = var.tags
}

resource "azurerm_subnet" "bmpagw1subnet" {
  name                 = var.environment == "production" ? "co-p-eastus-bmpagw1-subnet" : "sub-${var.location_acronym}-${var.application_acronym}-agw-${var.environment_acronym}"
  virtual_network_name = module.applicationvnet.virtual_network_name
  resource_group_name  = module.applicationrg.resource_group_name
  address_prefixes     = var.subnet_name_agw_address_space

  service_endpoints = ["Microsoft.Storage"]
}

resource "azurerm_subnet" "bmpapp1subnet" {
  name                                           = var.environment == "production" ? "co-p-eastus-bmpapp1-subnet" : "sub-${var.location_acronym}-${var.application_acronym}-app-${var.environment_acronym}"
  virtual_network_name                           = module.applicationvnet.virtual_network_name
  resource_group_name                            = module.applicationrg.resource_group_name
  address_prefixes                               = var.subnet_name_app_address_space
  enforce_private_link_endpoint_network_policies = true
  service_endpoints                              = ["Microsoft.Sql", "Microsoft.Storage"]
}

resource "azurerm_subnet" "kpimcapiqsubnet" {
  name                 = var.environment == "production" ? "co-p-eastus-kpimcapiq-subnet" : "sub-${var.location_acronym}-${var.application_acronym}-kpim-${var.environment_acronym}"
  virtual_network_name = module.applicationvnet.virtual_network_name
  resource_group_name  = module.applicationrg.resource_group_name
  address_prefixes     = var.subnet_name_api_address_space

  service_endpoints = ["Microsoft.Storage","Microsoft.Sql"]
}

resource "azurerm_subnet" "bmprest1subnet" {
  name                                           = var.environment == "production" ? "co-p-eastus-bmprest1-subnet" : "sub-${var.location_acronym}-${var.application_acronym}-rest-${var.environment_acronym}"
  virtual_network_name                           = module.applicationvnet.virtual_network_name
  resource_group_name                            = module.applicationrg.resource_group_name
  address_prefixes                               = var.subnet_name_rest_address_space
  enforce_private_link_endpoint_network_policies = true
  service_endpoints                              = ["Microsoft.Sql", "Microsoft.Storage"]
}

resource "azurerm_subnet" "bmpinformaticasubnet" {
  name                 = var.environment == "production" ? "co-p-eastus-bmpinformatica-subnet" : "sub-${var.location_acronym}-${var.application_acronym}-info-${var.environment_acronym}"
  virtual_network_name = module.applicationvnet.virtual_network_name
  resource_group_name  = module.applicationrg.resource_group_name
  address_prefixes     = var.subnet_name_info_address_space

  service_endpoints = ["Microsoft.Storage"]
}


resource "azurerm_subnet" "bmpdb1subnet" {
  name                                            = var.environment == "production" ? "co-p-eastus-bmpdb1-subnet" : "sub-${var.location_acronym}-${var.application_acronym}-db-${var.environment_acronym}"
  virtual_network_name                            = module.applicationvnet.virtual_network_name
  resource_group_name                             = module.applicationrg.resource_group_name
  address_prefixes                                = var.subnet_name_db_address_space
  service_endpoints                               = ["Microsoft.Storage"]

  delegation {
    name = "AutoDelegated_bcd87b4130c14b4b924e31cb108d99ea"

    service_delegation {
      name = "Microsoft.Sql/managedInstances"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
        "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
        "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"
      ]
    }
  }
}

resource "azurerm_subnet" "bmpasesubnet" {
  name                 = "sub-${var.location_acronym}-${var.application_acronym}-ase-${var.environment_acronym}"
  virtual_network_name = module.applicationvnet.virtual_network_name
  resource_group_name  = module.applicationrg.resource_group_name
  address_prefixes     = var.subnet_name_ase_address_space

  service_endpoints = ["Microsoft.Storage", "Microsoft.KeyVault","Microsoft.Sql"]
}

resource "azurerm_subnet" "bmppesubnet" {
  name                 = "sub-${var.location_acronym}-${var.application_acronym}-pe-${var.environment_acronym}"
  virtual_network_name = module.applicationvnet.virtual_network_name
  resource_group_name  = module.applicationrg.resource_group_name
  address_prefixes     = var.subnet_name_pe_address_space

  service_endpoints = ["Microsoft.Storage", "Microsoft.KeyVault"]
}