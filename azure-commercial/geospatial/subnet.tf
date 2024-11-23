module "geospatial_aks_subnet" {
  source                                          = "../../modules/subnet"
  subnet_name                                     = "sub-${var.location_acronym}-${var.application_acronym}-aks-${var.environment_acronym}"
  resource_group_name                             = module.geospatial_rg.resource_group_name
  address_prefix                                  = var.geospatial_aks_subnet_address_prefix
  virtual_network_name                            = module.geospatial_vnet_main.virtual_network_name
  enforce_private_link_endpoint_network_policies  = true
  service_endpoints                               = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.KeyVault", "Microsoft.ContainerRegistry"]
   
}

module "geospatial_agw_subnet" {
  source                                         = "../../modules/subnet"
  subnet_name                                    = "sub-${var.location_acronym}-${var.application_acronym}-agw-${var.environment_acronym}"
  resource_group_name                            = module.geospatial_rg.resource_group_name
  address_prefix                                 = var.geospatial_agw_subnet_address_prefix
  virtual_network_name                           = module.geospatial_vnet_main.virtual_network_name
  enforce_private_link_endpoint_network_policies = true
  service_endpoints                              = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.KeyVault"]
   
}

module "geospatial_pep_subnet" {
  source                                         = "../../modules/subnet"
  subnet_name                                    = "sub-${var.location_acronym}-${var.application_acronym}-pep-${var.environment_acronym}"
  resource_group_name                            = module.geospatial_rg.resource_group_name
  address_prefix                                 = var.geospatial_pep_subnet_address_prefix
  virtual_network_name                           = module.geospatial_vnet_main.virtual_network_name
  enforce_private_link_endpoint_network_policies = true
  service_endpoints                              = ["Microsoft.Storage", "Microsoft.Sql", "Microsoft.EventHub", "Microsoft.KeyVault", "Microsoft.ServiceBus"]
   
}

##Postgre Flexible Subnet
module "geospatial_postgre_flexible_subnet" {
  source                                         = "../../modules/subnet"
  subnet_name                                    = "sub-${var.location_acronym}-${var.application_acronym}-flex-${var.environment_acronym}"
  resource_group_name                            = module.geospatial_rg.resource_group_name
  address_prefix                                 = var.geospatial_pstflex_subnet_address_prefix
  virtual_network_name                           = module.geospatial_vnet_main.virtual_network_name
  enforce_private_link_endpoint_network_policies = true
  service_endpoints                              = ["Microsoft.Storage"]
  delegations = [{
    delegation_name            = "gis_flex_delegation"
    service_delegation_name    = "Microsoft.DBforPostgreSQL/flexibleServers"
    service_delegation_actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
  }]
}

module "geospatial_vm_subnet" {
  source                                         = "../../modules/subnet"
  subnet_name                                    = "sub-${var.location_acronym}-${var.application_acronym}-vm-${var.environment_acronym}"
  resource_group_name                            = module.geospatial_rg.resource_group_name
  address_prefix                                 = var.geospatial_vm_subnet_address_prefix
  virtual_network_name                           = module.geospatial_vnet_main.virtual_network_name
  enforce_private_link_endpoint_network_policies = true
  service_endpoints                              = ["Microsoft.Storage"]
   
}
##Management Subnet
module "geospatial_mgmt_subnet" {
  source                                         = "../../modules/subnet"
  subnet_name                                    = "sub-${var.location_acronym}-${var.application_acronym}-mgmt-${var.environment_acronym}"
  resource_group_name                            = module.geospatial_rg.resource_group_name
  address_prefix                                 = var.geospatial_mgmt_subnet_address_prefix
  virtual_network_name                           = module.geospatial_vnet_main.virtual_network_name
  enforce_private_link_endpoint_network_policies = true
  service_endpoints                              = ["Microsoft.Sql", "Microsoft.Storage"]
   
}


