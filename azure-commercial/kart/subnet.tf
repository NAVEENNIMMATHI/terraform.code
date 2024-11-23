module "krtagw1subnet" {
  source                    = "../../modules/subnet"
  subnet_name               = var.environment == "production" ? "co-p-eastus-krtagw1-subnet" : "sub-${var.location_acronym}-${var.application_acronym}-agw-${var.environment_acronym}"
  virtual_network_name      = module.applicationvnet.virtual_network_name
  resource_group_name       = module.applicationrg.resource_group_name
  address_prefix            = var.krtagw1_subnet_adress_space
  # network_security_group_id = module.krtagw1nsg.network_security_group_id
  service_endpoints         = ["Microsoft.Storage"]
}

module "krtapp1subnet" {
  source                    = "../../modules/subnet"
  subnet_name               = var.environment == "production" ? "co-p-eastus-krtapp1-subnet" : "sub-${var.location_acronym}-${var.application_acronym}-app-${var.environment_acronym}"
  virtual_network_name      = module.applicationvnet.virtual_network_name
  resource_group_name       = module.applicationrg.resource_group_name
  address_prefix            = var.krtapp1_subnet_adress_space
  # network_security_group_id = module.krtapp1nsg.network_security_group_id
  # route_table_id            = data.azurerm_route_table.spi_route_table.id
  service_endpoints         = ["Microsoft.Sql", "Microsoft.Storage"]
}

module "krtase1subnet" {
  source                    = "../../modules/subnet"
  subnet_name               = var.environment == "production" ? "co-p-eastus-krtase1-subnet" : "sub-${var.location_acronym}-${var.application_acronym}-ase-${var.environment_acronym}"
  virtual_network_name      = module.applicationvnet.virtual_network_name
  resource_group_name       = module.applicationrg.resource_group_name
  address_prefix            = var.krtase1_subnet_adress_space
  # network_security_group_id = module.krtase1nsg.network_security_group_id
  # route_table_id            = azurerm_route_table.aseroutetable.id
  service_endpoints         = ["Microsoft.Sql", "Microsoft.Storage"]
}

