
resource "azurerm_route_table" "azfroutetable" {
  for_each                      = var.cmp_clients

  name                          = "rtb-${var.location_acronym}-${var.application_acronym}-azfw-${lower(each.value.vm_acronym)}-${var.environment_acronym}"
  location                      = module.cmp_rg_client[each.key].resource_group_location
  resource_group_name           = module.cmp_rg_client[each.key].resource_group_name
  disable_bgp_route_propagation = false

  route {
    name                   = "AlltrafficthroughPAFW"
    address_prefix         = "0.0.0.0/0"
    next_hop_in_ip_address = data.azurerm_firewall.firewall.ip_configuration[0].private_ip_address
    next_hop_type          = "VirtualAppliance"
  }

  tags = var.tags
}

resource "azurerm_subnet_route_table_association" "rtsubnet" {
  for_each       = var.cmp_clients

  subnet_id      = module.cmp_subnet_client_vm[each.key].subnet_id
  route_table_id = azurerm_route_table.azfroutetable[each.key].id
}