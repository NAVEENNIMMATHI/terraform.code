module "applicationvnet" {
  source                  = "../../modules/virtual_network"
  virtual_network_name    = "vnt-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_location = module.timrg.resource_group_location
  resource_group_name     = module.timrg.resource_group_name
  address_space           = var.vnet_address_space
  dns_server              = var.environment_acronym == "dv" ? [var.route_next_hop_in_ip_address] : var.dns_servers
  tags                    = var.tags
}

