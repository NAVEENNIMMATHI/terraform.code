module "mdp_subnet_adb_private" {
  source               = "../../modules/subnet"
  subnet_name          = "sub-${var.location_acronym}-${var.application_acronym}-adb-priv-${var.environment_acronym}"
  resource_group_name  = module.mdp_rg_main.resource_group_name
  address_prefix       = var.databricks.subnets.private.address_prefix
  virtual_network_name = module.mdp_vnet_main.virtual_network_name
  service_endpoints    = []
  delegations = [{
    delegation_name         = "delegation-${var.location_acronym}-${var.application_acronym}-adb-priv-${var.environment_acronym}"
    service_delegation_name = "Microsoft.Databricks/workspaces"
    service_delegation_actions = [
      "Microsoft.Network/virtualNetworks/subnets/join/action",
      "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
      "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action",
    ]
  }]
}

module "mdp_subnet_adb_pub" {
  source                                         = "../../modules/subnet"
  subnet_name                                    = "sub-${var.location_acronym}-${var.application_acronym}-adb-pub-${var.environment_acronym}"
  resource_group_name                            = module.mdp_rg_main.resource_group_name
  address_prefix                                 = var.databricks.subnets.public.address_prefix
  virtual_network_name                           = module.mdp_vnet_main.virtual_network_name
  service_endpoints                              = []
  enforce_private_link_endpoint_network_policies = true
  delegations = [{
    delegation_name         = "delegation-${var.location_acronym}-${var.application_acronym}-adb-pub-${var.environment_acronym}"
    service_delegation_name = "Microsoft.Databricks/workspaces"
    service_delegation_actions = [
      "Microsoft.Network/virtualNetworks/subnets/join/action",
      "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
      "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action",
    ]
  }]
}

module "mdp_subnet_pep" {
  source              = "../../modules/subnet"
  subnet_name         = "sub-${var.location_acronym}-${var.application_acronym}-pep-${var.environment_acronym}"
  resource_group_name = module.mdp_rg_main.resource_group_name
  #address_prefix       = "10.51.66.0/24"
  address_prefix                                 = var.privatelink_subnet_address_prefix
  virtual_network_name                           = module.mdp_vnet_main.virtual_network_name
  service_endpoints                              = ["Microsoft.Storage", "Microsoft.Sql", "Microsoft.EventHub", "Microsoft.KeyVault", "Microsoft.ServiceBus"]
  enforce_private_link_endpoint_network_policies = true
}

/* Create FuncApp integration Subnet */
module "mdp_subnet_funapp" {
  source               = "../../modules/subnet"
  subnet_name          = "sub-${var.location_acronym}-${var.application_acronym}-func-${var.environment_acronym}"
  resource_group_name  = module.mdp_rg_main.resource_group_name
  address_prefix       = var.func_subnet_address_prefix
  virtual_network_name = module.mdp_vnet_main.virtual_network_name
  service_endpoints    = []
  delegations = [{
    delegation_name         = "delegation-${var.location_acronym}-${var.application_acronym}-func-${var.environment_acronym}"
    service_delegation_name = "Microsoft.Web/serverFarms"
    service_delegation_actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
  }]
}


module "iicssubnet" {
  source               = "../../modules/subnet"
  subnet_name          = "sub-${var.location_acronym}-${var.application_acronym}-iics-${var.environment_acronym}"
  resource_group_name  = module.mdp_rg_main.resource_group_name
  virtual_network_name = module.mdp_vnet_main.virtual_network_name
  address_prefix       = var.iics_subnet_address_prefix
  service_endpoints    = ["Microsoft.Storage"]

}

module "mdp_subnet_avscan" {
  source               = "../../modules/subnet"
  subnet_name          = "sub-${var.location_acronym}-${var.application_acronym}-avscan-${var.environment_acronym}"
  resource_group_name  = module.mdp_rg_main.resource_group_name
  virtual_network_name = module.mdp_vnet_main.virtual_network_name
  address_prefix       = var.avscan_subnet_address_prefix
  service_endpoints    = ["Microsoft.Storage"]
}

module "mdp_subnet_agw" {
  source               = "../../modules/subnet"
  subnet_name          = "sub-${var.location_acronym}-${var.application_acronym}-agw-${var.environment_acronym}"
  resource_group_name  = module.mdp_rg_main.resource_group_name
  virtual_network_name = module.mdp_vnet_main.virtual_network_name
  address_prefix       = var.application_gateway.subnet_address
  service_endpoints    = []
}

/* 
module "mdp_subnet_adf" {
  source               = "../../modules/subnet"
  subnet_name          = "sub-${var.location_acronym}-${var.application_acronym}-adf-${var.environment_acronym}"
  resource_group_name  = module.mdp_rg_main.resource_group_name
  address_prefix        = var.adf_subnet_address_prefix
  virtual_network_name = module.mdp_vnet_main.virtual_network_name
  service_endpoints    =  ["Microsoft.Storage", "Microsoft.Sql", "Microsoft.EventHub", "Microsoft.KeyVault", "Microsoft.ServiceBus"]
  #enforce_private_link_endpoint_network_policies = true
}
*/

module "mdp_subnet_apim" {
  source               = "../../modules/subnet"
  subnet_name          = "sub-${var.location_acronym}-${var.application_acronym}-apim-${var.environment_acronym}"
  resource_group_name  = module.mdp_rg_main.resource_group_name
  virtual_network_name = module.mdp_vnet_main.virtual_network_name
  address_prefix       = var.apim_subnet_address_prefix
  service_endpoints    = ["Microsoft.Sql","Microsoft.Storage","Microsoft.Web","Microsoft.EventHub","Microsoft.ServiceBus"]
}

# AKS Subnet
module "mdp_aks_subnet" {
  source               = "../../modules/subnet"
  subnet_name          = "sub-${var.location_acronym}-${var.application_acronym}-aks-${var.environment_acronym}"
  resource_group_name  = module.mdp_rg_main.resource_group_name
  virtual_network_name = module.mdp_vnet_main.virtual_network_name
  address_prefix       = var.subnet_address_space_aks
  service_endpoints    = ["Microsoft.Storage", "Microsoft.KeyVault", "Microsoft.Sql", "Microsoft.ContainerRegistry"]
  enforce_private_link_endpoint_network_policies = true
}

/*# ClamAV Function App Subnet
module "mdp_clamav_fap_subnet" {
  source = "../../modules/subnet"
  subnet_name = "sub-${var.locaiton_acronym}-${var.application_acronym}-avfap-${var.environment_acronym}"
  resource_group_name = module.mdp_rg_main.resource_group_name
  virtual_network_name = module.mdp_vnet_main.virtual_network_name
  address_prefix = var.subnet_address_space_avfap

  delegation {
    name  = "ClamAV_FunctionApp_delegation"

    service_delegation {
      name = "Microsoft.Web/serviceFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnet/action"]
      service_endpoints = [Microsoft.Storage]
    }
  }
}*/

# ClamAV WebApp Subnet
/*module "mdp_clamav_wap_subnet" {
  source = "../../modules/subnet"
  subnet_name = "sub-${var.location_acronym}-${var.appplication_acronym}-avwap-${var.environment_acronym}"
  resource_group_name = module.mdp_rg_main.resource_resource_group_name
  virtual_network_name = module.mdp_vnet_main.virtual_network_name
  address_prefix = var.subnet_address_space_avwap
  delegation {
    name  = "ClamAV_WebApp_delegation"

    service_delegation {
      name = "Microsoft.Web/serviceFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnet/action"]
      service_endpoints = [Microsoft.Storage]
    }
  }
}*/

# ClamAV Subnets
module "mdp_clamav_wap_subnet" {
  source                                         = "../../modules/subnet"
  subnet_name                                    = "sub-${var.location_acronym}-${var.application_acronym}-avwap-${var.environment_acronym}"
  address_prefix                                 = var.clamav_wap_subnet_address_prefix
  service_endpoints                              = var.subnet_service_endpoints_clamav_wap
  delegations                                    = var.subnet_delegation_clamav_wap
  resource_group_name                            = module.mdp_rg_main.resource_group_name
  virtual_network_name                           = module.mdp_vnet_main.virtual_network_name
  enforce_private_link_endpoint_network_policies = true
}

module "mdp_clamav_fap_subnet" {
  source                                         = "../../modules/subnet"
  subnet_name                                    = "sub-${var.location_acronym}-${var.application_acronym}-avfap-${var.environment_acronym}"
  address_prefix                                 = var.clamav_fap_subnet_address_prefix
  service_endpoints                              = var.subnet_service_endpoints_clamav_fap
  delegations                                    = var.subnet_delegation_clamav_fap
  resource_group_name                            = module.mdp_rg_main.resource_group_name
  virtual_network_name                           = module.mdp_vnet_main.virtual_network_name
  enforce_private_link_endpoint_network_policies = true
}

# Subnet for App Integration
module "appintgsubnet" {
  source               = "../../modules/subnet"
  subnet_name          = "sub-${var.location_acronym}-${var.application_acronym}-appintg-${var.environment_acronym}"
  resource_group_name  = module.mdp_rg_main.resource_group_name
  virtual_network_name = module.mdp_vnet_main.virtual_network_name
  address_prefix       = var.app_intg_subnet_address_prefix
  service_endpoints    = ["Microsoft.Storage","Microsoft.Sql","Microsoft.KeyVault"]
  delegations = [{
    #delegation_name         = "delegation-${var.location_acronym}-${var.application_acronym}-func-${var.environment_acronym}"
     delegation_name         = "Microsoft.Web.serverFarms"
    service_delegation_name = "Microsoft.Web/serverFarms"
    service_delegation_actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
  }]
}