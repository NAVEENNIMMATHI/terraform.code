# License manager subnet
module "subnet_license_manager" {
  source                                         = "../../modules/subnet"
  subnet_name                                    = "sub-${var.location_acronym}-${var.application_acronym}-${var.license_manager_acronym}-${var.environment_acronym}"
  virtual_network_name                           = data.azurerm_virtual_network.spokevnet.name
  resource_group_name                            = data.azurerm_virtual_network.spokevnet.resource_group_name
  address_prefix                                 = var.address_prefix
  enforce_private_link_endpoint_network_policies = var.enforce_private_link_endpoint_network_policies
  service_endpoints                              = var.service_endpoints
}

# Application Gateway subnet
module "subnet_app_gateway" {
  source                                         = "../../modules/subnet"
  subnet_name                                    = "sub-${var.location_acronym}-${var.application_acronym}-agw-${var.environment_acronym}"
  virtual_network_name                           = data.azurerm_virtual_network.spokevnet.name
  resource_group_name                            = data.azurerm_virtual_network.spokevnet.resource_group_name
  address_prefix                                 = var.address_prefix_agw
  enforce_private_link_endpoint_network_policies = var.enforce_private_link_endpoint_network_policies_agw
  service_endpoints                              = var.service_endpoints_agw
}

# AKS Subnet
module "subnet_aks" {
  source                                         = "../../modules/subnet"
  subnet_name                                    = "sub-${var.location_acronym}-${var.application_acronym}-${var.client}-aks-${var.environment_acronym}"
  virtual_network_name                           = data.azurerm_virtual_network.spokevnet.name
  resource_group_name                            = data.azurerm_virtual_network.spokevnet.resource_group_name
  address_prefix                                 = var.address_prefix_aks
  enforce_private_link_endpoint_network_policies = var.enforce_private_link_endpoint_network_policies_aks
  service_endpoints                              = var.service_endpoints_aks
}

# Private links subnet
module "subnet_private_link" {
  source                                         = "../../modules/subnet"
  subnet_name                                    = "sub-${var.location_acronym}-${var.application_acronym}-${var.client}-pep-${var.environment_acronym}"
  virtual_network_name                           = data.azurerm_virtual_network.spokevnet.name
  resource_group_name                            = data.azurerm_virtual_network.spokevnet.resource_group_name
  address_prefix                                 = var.address_prefix_pep
  enforce_private_link_endpoint_network_policies = var.enforce_private_link_endpoint_network_policies_pep
  service_endpoints                              = var.service_endpoints_pep
}