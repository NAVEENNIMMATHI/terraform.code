module "geospatial_vnet_main" {
  source                  = "../../modules/virtual_network"
  virtual_network_name    = "vnt-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_location = module.geospatial_rg.resource_group_location
  resource_group_name     = module.geospatial_rg.resource_group_name
  address_space           = var.vnet_address_space
  dns_server              = var.environment_acronym == "dv" ? [data.azurerm_firewall.firewall.ip_configuration[0].private_ip_address] : var.dns_servers
  #dns_server              =  var.dns_servers
  tags                    = var.tags
}