# AKS Subnet
resource "azurerm_subnet" "aks" {
  count = 1

  name                                              = "sub-${var.location_acronym}-${var.application_acronym}-aks-${var.environment_acronym}"
  address_prefixes                                  = var.subnet_address_space_aks
  virtual_network_name                              = data.azurerm_virtual_network.hub.name
  resource_group_name                               = data.azurerm_resource_group.hubvnet.name
  service_endpoints                                 = ["Microsoft.Storage", "Microsoft.KeyVault", "Microsoft.Sql", "Microsoft.ContainerRegistry"]
  enforce_private_link_endpoint_network_policies    = true
}

resource "azurerm_subnet" "aks_agw" {
  name                 = "sub-${var.location_acronym}-${var.application_acronym}-aks-agw-${var.environment_acronym}"
  address_prefixes     = var.subnet_address_space_aks_agw
  virtual_network_name = data.azurerm_virtual_network.hub.name
  resource_group_name  = data.azurerm_resource_group.hubvnet.name
  service_endpoints    = ["Microsoft.Storage", "Microsoft.KeyVault", "Microsoft.Sql"]
}

resource "azurerm_subnet" "aks_paired" {
  count = var.environment_acronym == "dv" || var.environment_acronym == "pd" ? 1 : 0
  
  name                                              = "sub-${var.location_acronym_paired}-${var.application_acronym}-aks-paired-${var.environment_acronym}"
  address_prefixes                                  = var.subnet_address_space_aks_paired
  virtual_network_name                              = data.azurerm_virtual_network.hub_paired[0].name
  resource_group_name                               = data.azurerm_resource_group.hubvnet_paired[0].name
  service_endpoints                                 = ["Microsoft.Storage", "Microsoft.KeyVault", "Microsoft.Sql", "Microsoft.ContainerRegistry"]
  enforce_private_link_endpoint_network_policies    = true
}