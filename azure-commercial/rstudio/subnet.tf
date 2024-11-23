module "subnet" {
  source               = "../../modules/subnet"
  subnet_name          = var.environment == "production" ? "${var.cloudops_global_prefix}-${var.environment_acronym}-${var.location}-spi${var.application_acronym}-subnet" : "sub-${var.location_acronym}-spi-${var.application_acronym}-${var.environment_acronym}"
  virtual_network_name = var.spi_vnet_name
  resource_group_name  = var.spi_vnet_resource_group_name
  address_prefix       = var.rstudio_address_space
  service_endpoints    = ["Microsoft.Storage", "Microsoft.Sql"]
}

module "mongodb_subnet" {
  source               = "../../modules/subnet"
  //subnet_name          = "sub-${var.location_acronym}-mongo-spi-${var.environment_acronym}"
  subnet_name          = var.environment == "production" ? "${var.cloudops_global_prefix}-${var.environment_acronym}-${var.location}-spi-${var.application_acronym}-mongo-subnet" : "sub-${var.location_acronym}-spi-${var.application_acronym}-mongo-${var.environment_acronym}"
  virtual_network_name = var.spi_vnet_name
  resource_group_name  = var.spi_vnet_resource_group_name
  address_prefix       = var.mongodb_subnet_address_space
  service_endpoints    = []
}

module "gurobi_subnet" {
  source               = "../../modules/subnet"
  subnet_name          = var.environment == "production" ? "${var.cloudops_global_prefix}-${var.environment_acronym}-${var.location}-spi-${var.application_acronym}-gurobi-subnet" : "sub-${var.location_acronym}-spi-${var.application_acronym}-gurobi-${var.environment_acronym}"
  virtual_network_name = var.spi_vnet_name
  resource_group_name  = var.spi_vnet_resource_group_name
  address_prefix       = var.gurobi_address_space
  service_endpoints    = ["Microsoft.Storage"]
}

module "windows_subnet" {
  source               = "../../modules/subnet"
  subnet_name          = var.environment == "production" ? "${var.cloudops_global_prefix}-${var.environment_acronym}-${var.location}-spi-${var.application_acronym}-windows-subnet" : "sub-${var.location_acronym}-spi-${var.application_acronym}-windows-${var.environment_acronym}"
  virtual_network_name = var.spi_vnet_name
  resource_group_name  = var.spi_vnet_resource_group_name
  address_prefix       = var.windows_address_space
  service_endpoints    = ["Microsoft.Storage"]
}