module "applicationvnet" {
  source                  = "../../modules/virtual_network"
  virtual_network_name    = var.environment == "production" ? "co-p-eastus-krt-vnet" : "vnt-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_location = module.applicationrg.resource_group_location
  resource_group_name     = module.applicationrg.resource_group_name
  address_space           = var.address_space
  dns_server              = var.dns_server
  tags                    = var.tags
}
