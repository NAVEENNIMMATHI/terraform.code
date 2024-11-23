module "ignite_aks_subnet" {
    source                                         = "../../modules12/subnet"
    subnet_name                                    = "sub-${var.location}-${var.project_name}-${var.application_acronym}-${var.engagement_name}${var.separator}${var.environment}"
    virtual_network_name                           = data.azurerm_virtual_network.spoke_vnet.name
    resource_group_name                            = data.azurerm_virtual_network.spoke_vnet.resource_group_name
    address_prefix                                 = var.ignite_aks_subnet_address_prefix
    enforce_private_link_endpoint_network_policies = true
    service_endpoints                              = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.KeyVault", "Microsoft.ContainerRegistry"]
}

module "ignite_agw_subnet" {
    source                                         = "../../modules12/subnet"
    subnet_name                                    = "sub-${var.location}-${var.project_name}-agw-${var.engagement_name}${var.separator}${var.environment}"
    virtual_network_name                           = data.azurerm_virtual_network.spoke_vnet.name
    resource_group_name                            = data.azurerm_virtual_network.spoke_vnet.resource_group_name
    address_prefix                                 = var.ignite_agw_subnet_address_prefix
    enforce_private_link_endpoint_network_policies = true
    service_endpoints                              = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.KeyVault"]
}

module "ignite_ingress_subnet" {
    source                                         = "../../modules12/subnet"
    subnet_name                                    = "sub-${var.location}-${var.project_name}-ingress-${var.engagement_name}${var.separator}${var.environment}"
    virtual_network_name                           = data.azurerm_virtual_network.spoke_vnet.name
    resource_group_name                            = data.azurerm_virtual_network.spoke_vnet.resource_group_name
    address_prefix                                 = var.ignite_ingress_subnet_address_prefix
    enforce_private_link_endpoint_network_policies = true
    service_endpoints                              = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.KeyVault"]
}