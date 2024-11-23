module "privatelinksubnet" {
  source                  = "../../modules/subnet"
  subnet_name             = "sub-${var.location_acronym}-privatelink${lower(var.subnets_environment_suffix)}-${var.environment_acronym}"
  virtual_network_name    = module.sharedvnet.virtual_network_name
  resource_group_name     = module.sharedrg.resource_group_name
  address_prefix          = var.privatelink_subnet_address_prefix
  service_endpoints       = ["Microsoft.Storage", "Microsoft.Sql", "Microsoft.EventHub", "Microsoft.KeyVault", "Microsoft.ServiceBus"]
  enforce_private_link_endpoint_network_policies = true

}

module "asesubnet" {
  source                  = "../../modules/subnet"
  subnet_name             = "sub-${var.location_acronym}-ase-${var.environment_acronym}"
  virtual_network_name    = module.sharedvnet.virtual_network_name
  resource_group_name     = module.sharedrg.resource_group_name
  address_prefix          = var.ase_subnet_address_prefix
  service_endpoints       = ["Microsoft.Storage", "Microsoft.Sql", "Microsoft.EventHub", "Microsoft.KeyVault"]
}

module "appgatewaysubnet" {
  source                  = "../../modules/subnet"
  subnet_name             = "sub-${var.location_acronym}-appgateway-${var.environment_acronym}"
  virtual_network_name    = module.sharedvnet.virtual_network_name
  resource_group_name     = module.sharedrg.resource_group_name
  address_prefix          = var.appgateway_subnet_address_prefix
  service_endpoints       = ["Microsoft.Storage", "Microsoft.Sql", "Microsoft.EventHub", "Microsoft.KeyVault"]
}


module "appsubnet" {
  source                  = "../../modules/subnet"
  subnet_name             = "sub-${var.location_acronym}-app${lower(var.subnets_environment_suffix)}-${var.environment_acronym}"
  virtual_network_name    = module.sharedvnet.virtual_network_name
  resource_group_name     = module.sharedrg.resource_group_name
  address_prefix          = var.app_subnet_address_prefix
  service_endpoints       = ["Microsoft.Storage", "Microsoft.Sql", "Microsoft.EventHub", "Microsoft.KeyVault", "Microsoft.ServiceBus"]
  enforce_private_link_endpoint_network_policies = true
}

module "mgmtsubnet" {
  source                  = "../../modules/subnet"
  subnet_name             = "sub-${var.location_acronym}-mgmt-${var.environment_acronym}"
  virtual_network_name    = module.sharedvnet.virtual_network_name
  resource_group_name     = module.sharedrg.resource_group_name
  address_prefix          = var.mgmt_subnet_address_prefix
  service_endpoints       = ["Microsoft.Storage", "Microsoft.Sql", "Microsoft.EventHub", "Microsoft.KeyVault", "Microsoft.ServiceBus"]
}

module "buildsubnet" {
  source                  = "../../modules/subnet"
  subnet_name             = "sub-${var.location_acronym}-build-${var.environment_acronym}"
  virtual_network_name    = module.sharedvnet.virtual_network_name
  resource_group_name     = module.sharedrg.resource_group_name
  address_prefix          = var.build_subnet_address_prefix
  service_endpoints       = ["Microsoft.Storage", "Microsoft.Sql", "Microsoft.EventHub", "Microsoft.KeyVault", "Microsoft.ServiceBus"]
}

resource "azurerm_subnet" "appgatewaysubnet_allow_443_all" {

  name                    = "sub-${var.location_acronym}-appgateway-${lower(var.subnets_environment_suffix)}-${var.environment_acronym}"
  virtual_network_name    = module.sharedvnet.virtual_network_name
  resource_group_name     = module.sharedrg.resource_group_name
  address_prefix          = var.appgateway_subnet_address_prefix_cfr
  service_endpoints       = ["Microsoft.Storage", "Microsoft.Sql", "Microsoft.EventHub", "Microsoft.KeyVault"]
}
