module "midserver-subnet" {
  source                    = "../../modules/subnet"
  subnet_name               = "sub-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  virtual_network_name      = var.corevnetname
  resource_group_name       = var.corevnetrg
  address_prefix            = var.midserver_subnet_adress_space
  service_endpoints         = ["Microsoft.Storage"]
}