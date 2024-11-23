############################
# West US DR WORKLOAD Virtual Networks #
############################
resource "azurerm_virtual_network" "dr_workload" {
  name                = "vnt-${var.location_dr_acronym}-dr-workload-${var.environment_acronym}"
  address_space       = var.dr_workload_vnet_address_space
  resource_group_name = azurerm_resource_group.uswcoredr.name
  location            = azurerm_resource_group.uswcoredr.location
  dns_servers         = var.environment_acronym == "dv" ? flatten([var.azure_firewall_private_ip,var.hub_vnet_dns_servers]) : var.hub_vnet_dns_servers
  tags = var.tags
  lifecycle {
    ignore_changes = [
      ddos_protection_plan
    ]
  }
}
# dr workload Subnets
resource "azurerm_subnet" "workload-subnet" {
  name                 = "sub-${var.location_dr_acronym}-workload-subnet-${var.environment_acronym}"
  address_prefixes     = var.subnet_address_space_workload
  virtual_network_name = azurerm_virtual_network.dr_workload.name
  resource_group_name  = azurerm_resource_group.uswcoredr.name
  service_endpoints    = ["Microsoft.Sql", "Microsoft.Storage"]
}
############################
# West US DR Virtual Networks #
############################
resource "azurerm_virtual_network" "dr" {
  name                = "vnt-${var.location_dr_acronym}-dr-${var.environment_acronym_rg}"
  address_space       = var.dr_vnet_address_space
  resource_group_name = azurerm_resource_group.uswcoredr.name
  location            = azurerm_resource_group.uswcoredr.location
  dns_servers         = var.environment_acronym == "dv" ? flatten([var.azure_firewall_private_ip,var.hub_vnet_dns_servers]) : var.hub_vnet_dns_servers
  tags = var.tags
  lifecycle {
    ignore_changes = [
      ddos_protection_plan
    ]
  }
}
#core dr subnet
resource "azurerm_subnet" "dr-core1-subnet" {
  name                 = "sub-${var.location_dr_acronym}-dr-core1-${var.environment_acronym_rg}"
  address_prefixes     = var.subnet_address_space_dr_core1
  virtual_network_name = azurerm_virtual_network.dr.name
  resource_group_name  = azurerm_resource_group.uswcoredr.name
  service_endpoints    = ["Microsoft.Sql", "Microsoft.Storage"]
}
