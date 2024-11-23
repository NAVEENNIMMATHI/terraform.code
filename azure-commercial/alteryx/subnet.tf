module "subnet" {
  source                  = "../../modules/subnet"
  subnet_name             = var.deployment_environment == "p" ? "co-p-eastus-spi-alteryx-subnet" : "sub-${var.location_acronym}-${var.application_acronym}-alteryx-${var.environment_acronym}"
  virtual_network_name    = data.terraform_remote_state.spi.outputs.spi_vnet_name
  resource_group_name     = data.terraform_remote_state.spi.outputs.spi_rg_name
  address_prefix          = var.alteryx_address_space
 # network_security_group_id = module.alteryxnsg.network_security_group_id
  service_endpoints       = ["Microsoft.Sql"]
} 