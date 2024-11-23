
module "tabappgw_subnet" {
  source               = "../../modules/subnet"
  subnet_name          = var.environment == "production" ? "co-p-eastus-spitabappgw-subnet" : "sub-${var.location_acronym}-${var.application_acronym_spi}-${var.application_acronym}appgw-${var.environment_acronym}"
  virtual_network_name = data.terraform_remote_state.spi.outputs.spi_vnet_name
  resource_group_name  = data.terraform_remote_state.spi.outputs.spi_rg_name
  address_prefix       = var.tabappgw_address_space  
  service_endpoints    = []
}

module "tabext_subnet" {
  source               = "../../modules/subnet"
  subnet_name          = var.environment == "production" ? "co-p-eastus-spitabext-subnet" : "sub-${var.location_acronym}-${var.application_acronym_spi}-${var.application_acronym}ext-${var.environment_acronym}"
  virtual_network_name = data.terraform_remote_state.spi.outputs.spi_vnet_name
  resource_group_name  = data.terraform_remote_state.spi.outputs.spi_rg_name
  address_prefix       = var.tabext_address_space  
  service_endpoints    = ["Microsoft.Storage"]
}