module "approutetable" {
  source                        = "../../modules/route_table"
  route_table_name              = "rtb-${var.location_acronym}-${var.application_name}-app-${var.environment_acronym}"
  resource_group_name           = module.apprg.resource_group_name
  resource_group_location       = module.apprg.resource_group_location
  disable_bgp_route_propagation = var.disable_bgp_route_propagation
  route_name                    = var.route_name
  route_address_prefix          = var.route_address_prefix
  route_next_hop_type           = var.route_next_hop_type
  route_next_hope_in_ip_address = var.route_next_hope_in_ip_address
  subnet_id                     = module.appsubnet.subnet_id
  tags                          = var.tags
}

module "aciroutetable" {
  source                        = "../../modules/route_table"
  route_table_name              = "rtb-${var.location_acronym}-${var.application_name}-aci-${var.environment_acronym}"
  resource_group_name           = module.apprg.resource_group_name
  resource_group_location       = module.apprg.resource_group_location
  disable_bgp_route_propagation = var.disable_bgp_route_propagation
  route_name                    = var.route_name
  route_address_prefix          = var.route_address_prefix
  route_next_hop_type           = var.route_next_hop_type
  route_next_hope_in_ip_address = var.route_next_hope_in_ip_address
  subnet_id                     = azurerm_subnet.acisubnet.id
  tags                          = var.tags
}

