resource "azurerm_route_table" "arcgis_rtb" {
  name                          = "rtb-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name           = module.geospatial_rg.resource_group_name
  location                      = module.geospatial_rg.resource_group_location
  disable_bgp_route_propagation = false
  depends_on                    = [module.geospatial_aks_subnet.subnet_id]

  tags                          = var.tags

route {
    name                   = "InternetToFirewall"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = data.azurerm_firewall.firewall.ip_configuration[0].private_ip_address
  }
}

               ### Route Table Associations ######

##AKS_Firewall_Route
resource "azurerm_subnet_route_table_association" "aks_subnet" {
  subnet_id      = module.geospatial_aks_subnet.subnet_id
  route_table_id = azurerm_route_table.arcgis_rtb.id
}

##VM_Firewall_Route
resource "azurerm_subnet_route_table_association" "vm_subnet" {
  subnet_id      = module.geospatial_vm_subnet.subnet_id
  route_table_id = azurerm_route_table.arcgis_rtb.id
}

##Management_Firewall_Route
resource "azurerm_subnet_route_table_association" "mgmt_subnet" {
  subnet_id      = module.geospatial_mgmt_subnet.subnet_id
  route_table_id = azurerm_route_table.arcgis_rtb.id
}
