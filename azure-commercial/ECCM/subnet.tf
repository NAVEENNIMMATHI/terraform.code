####Application gateway subnet####
module "eccm_agw_subnet" {
    source                                         = "../../modules/subnet"
    subnet_name                                    = "sub-${var.location_acronym}-${var.application_acronym}-agw-${var.environment_acronym}"
    virtual_network_name                           = var.spoke_vnet_name
    resource_group_name                            = var.spoke_vnet_rg_name
    address_prefix                                 = var.eccm_agw_subnet_address_prefix
    service_endpoints                              = []
    enforce_private_link_endpoint_network_policies = false
}

####Private Subnet for Logic App####
module "eccm_lap_pvt_subnet" {
    source                                         = "../../modules/subnet"
    subnet_name                                    = "sub-${var.location_acronym}-${var.application_acronym}-lap-pvt-${var.environment_acronym}"
    virtual_network_name                           = var.spoke_vnet_name
    resource_group_name                            = var.spoke_vnet_rg_name
    address_prefix                                 = var.eccm_lap_pvt_subnet_address_prefix
    service_endpoints                              = []
    enforce_private_link_endpoint_network_policies = false
}

####Public Subnet for Logic App####
module "eccm_lap_pub_subnet" {
    source                                         = "../../modules/subnet"
    subnet_name                                    = "sub-${var.location_acronym}-${var.application_acronym}-lap-pub-${var.environment_acronym}"
    virtual_network_name                           = var.spoke_vnet_name
    resource_group_name                            = var.spoke_vnet_rg_name
    address_prefix                                 = var.eccm_lap_pub_subnet_address_prefix
    service_endpoints                              = []
    delegations = [{
      delegation_name         = "delegation-${var.location_acronym}-${var.application_acronym}-lap-${var.environment_acronym}"
      service_delegation_name = "Microsoft.Web/serverFarms"
      service_delegation_actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
  }]
    enforce_private_link_endpoint_network_policies = false
}

####Subnet for all Private Endpoints####
module "eccm_pep_subnet" {
    source                                         = "../../modules/subnet"
    subnet_name                                    = "sub-${var.location_acronym}-${var.application_acronym}-pep-${var.environment_acronym}"
    virtual_network_name                           = var.spoke_vnet_name
    resource_group_name                            = var.spoke_vnet_rg_name
    address_prefix                                 = var.eccm_pep_subnet_address_prefix
    service_endpoints                              = []
    enforce_private_link_endpoint_network_policies = false
}

####Subnet for cognitive services####
module "eccm_css_subnet" {
    source                                         = "../../modules/subnet"
    subnet_name                                    = "sub-${var.location_acronym}-${var.application_acronym}-css-${var.environment_acronym}"
    virtual_network_name                           = var.spoke_vnet_name
    resource_group_name                            = var.spoke_vnet_rg_name
    address_prefix                                 = var.eccm_css_subnet_address_prefix
    service_endpoints                              = []
    enforce_private_link_endpoint_network_policies = false
}

####SSubnet for AKS####
module "eccm_aks_subnet" {
    source                                         = "../../modules/subnet"
    subnet_name                                    = "sub-${var.location_acronym}-${var.application_acronym}-aks-${var.environment_acronym}"
    virtual_network_name                           = var.spoke_vnet_name
    resource_group_name                            = var.spoke_vnet_rg_name
    address_prefix                                 = var.eccm_aks_subnet_address_prefix
    service_endpoints                              = []
    enforce_private_link_endpoint_network_policies = false
}

####Subnet for APP####
module "eccm_app_subnet" {
    source                                         = "../../modules/subnet"
    subnet_name                                    = "sub-${var.location_acronym}-${var.application_acronym}-app-${var.environment_acronym}"
    virtual_network_name                           = var.spoke_vnet_name
    resource_group_name                            = var.spoke_vnet_rg_name
    address_prefix                                 = var.eccm_app_subnet_address_prefix
    service_endpoints                              = []
    delegations = [{
      delegation_name         = "delegation-${var.location_acronym}-${var.application_acronym}-app-${var.environment_acronym}"
      service_delegation_name = "Microsoft.Web/serverFarms"
      service_delegation_actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
  }]
    enforce_private_link_endpoint_network_policies = false
}
