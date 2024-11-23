module "applicationrg" {
  source                  = "../../modules/resource_group"
  resource_group_name     = var.environment == "production" ? "CO-P-eastus-tableau-rg" : upper("rgp-${var.location_acronym}-${var.application_acronym_spi}-tableau-${var.environment_acronym}")
  resource_group_location = var.application_rg_location
  tags                    = var.tags
}