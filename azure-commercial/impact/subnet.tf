module "impact_agw_subnet" {
  source               = "../../modules/subnet"
  subnet_name          = "sub-${var.location_acronym}-${var.application_acronym}-agw-${var.environment_acronym}"
  virtual_network_name = data.azurerm_virtual_network.shared_vnet.name
  resource_group_name  = data.azurerm_virtual_network.shared_vnet.resource_group_name
  address_prefix       = var.agw1_subnet_adress_space
  service_endpoints    = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.KeyVault"]
}
module "impact_pep_subnet" {
  source                                         = "../../modules/subnet"
  subnet_name                                    = "sub-${var.location_acronym}-${var.application_acronym}-pep-${var.environment_acronym}"
  virtual_network_name                           = data.azurerm_virtual_network.shared_vnet.name
  resource_group_name                            = data.azurerm_virtual_network.shared_vnet.resource_group_name
  address_prefix                                 = var.private_endpoint_subnet_address_space
  enforce_private_link_endpoint_network_policies = true
  service_endpoints                              = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.KeyVault"]
}
module "impact_apim_subnet" {
  source               = "../../modules/subnet"
  subnet_name          = "sub-${var.location_acronym}-${var.application_acronym}-apim-${var.environment_acronym}"
  resource_group_name  = data.azurerm_virtual_network.shared_vnet.resource_group_name
  virtual_network_name = data.azurerm_virtual_network.shared_vnet.name
  address_prefix       = var.apim_subnet_address_space
  service_endpoints    = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.Web", "Microsoft.EventHub", "Microsoft.ServiceBus"]
}

module "impact_function_subnet" {
  source               = "../../modules/subnet"
  subnet_name          = "sub-${var.location_acronym}-${var.application_acronym}-function-${var.environment_acronym}"
  resource_group_name  = data.azurerm_virtual_network.shared_vnet.resource_group_name
  virtual_network_name = data.azurerm_virtual_network.shared_vnet.name
  address_prefix       = var.function_subnet_address_space
  service_endpoints    = ["Microsoft.ContainerRegistry","Microsoft.Storage"]
  delegations = [{
    delegation_name            = "delegation-${var.location_acronym}-${var.application_acronym}-func-${var.environment_acronym}"
    service_delegation_name    = "Microsoft.Web/serverFarms"
    service_delegation_actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
  }]
}

#module "impact_ui_subnet" {
#  source               = "../../modules/subnet"
#  subnet_name          = "sub-${var.location_acronym}-${var.application_acronym}-cp-pep-${var.environment_acronym}"
#  resource_group_name  = data.azurerm_virtual_network.shared_vnet.resource_group_name
#  virtual_network_name = data.azurerm_virtual_network.shared_vnet.name
#  address_prefix       = var.function_subnet_address_space
#  service_endpoints    = []
#  delegations = [{
#    delegation_name            = "pep-app-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
#    service_delegation_name    = "Microsoft.Web/serverFarms"
#    service_delegation_actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
#  }]
#}