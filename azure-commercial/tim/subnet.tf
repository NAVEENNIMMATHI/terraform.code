#Subnet
module "applicationsubnet" {
  source               = "../../modules/subnet"
  subnet_name          = "sub-${var.location_acronym}-${var.application_acronym}-app-${var.environment_acronym}"
  virtual_network_name = module.applicationvnet.virtual_network_name
  resource_group_name  = module.timrg.resource_group_name
  address_prefix       = var.timapp_subnet_address_prefix
  service_endpoints    = ["Microsoft.Storage", "Microsoft.Sql", "Microsoft.EventHub", "Microsoft.KeyVault"]
}

