module "applicationrg" {
  source                  = "../../modules/resource_group"  
  resource_group_name     = var.environment == "production" ? "co-p-eastus-copbi-rg" : "RGP-${upper(var.location_acronym)}-${upper(var.application_acronym_spi)}-${upper(var.application_acronym)}-${upper(var.environment_acronym)}"
  resource_group_location = var.location

  tags                    = var.tags  
}