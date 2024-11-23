
module "cmp_agw_subnet" {
  source                                         = "../../modules/subnet"
  subnet_name                                    = "sub-${var.location_acronym}-${var.application_acronym}-agw-${var.environment_acronym}"
  virtual_network_name                           = data.azurerm_virtual_network.spoke_vnet.name
  resource_group_name                            = data.azurerm_virtual_network.spoke_vnet.resource_group_name
  address_prefix                                 = var.cmp_agw_subnet_address_prefix
  enforce_private_link_endpoint_network_policies = true
  service_endpoints                              = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.KeyVault"]
}


module "cmp_subnet_pep" {
  for_each = var.cmp_clients

  source                                         = "../../modules/subnet"
  subnet_name                                    = "sub-${var.location_acronym}-${var.application_acronym}-${each.key}-pep-${var.environment_acronym}"
  resource_group_name                            = data.azurerm_virtual_network.spoke_vnet.resource_group_name
  address_prefix                                 = each.value.pep_subnet_cidr
  virtual_network_name                           = var.spoke_vnet_name
  service_endpoints                              = ["Microsoft.Storage", "Microsoft.Sql", "Microsoft.EventHub", "Microsoft.KeyVault", "Microsoft.ServiceBus"]
  enforce_private_link_endpoint_network_policies = true
}


module "cmp_subnet_client_vm" {
  for_each = var.cmp_clients

  source               = "../../modules/subnet"
  subnet_name          = "sub-${var.location_acronym}-${var.application_acronym}-${each.key}-vm-${var.environment_acronym}"
  resource_group_name  = data.azurerm_virtual_network.spoke_vnet.resource_group_name
  virtual_network_name = var.spoke_vnet_name
  address_prefix       = each.value.subnet_cidr
  service_endpoints    = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.Web", "Microsoft.EventHub", "Microsoft.ServiceBus"]
}

module "cmp_sharedpep_subnet" {
  source                                         = "../../modules/subnet"
  subnet_name                                    = "sub-${var.location_acronym}-${var.application_acronym}-shared-pep-${var.environment_acronym}"
  virtual_network_name                           = data.azurerm_virtual_network.spoke_vnet.name
  resource_group_name                            = data.azurerm_virtual_network.spoke_vnet.resource_group_name
  address_prefix                                 = var.cmp_shared_pep_subnet_address_prefix
  enforce_private_link_endpoint_network_policies = true
  service_endpoints                              = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.KeyVault"]
}