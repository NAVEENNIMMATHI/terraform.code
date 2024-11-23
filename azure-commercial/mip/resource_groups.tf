module "mathworks_rg_shared" {
  source                  = "../../modules/resource_group"
  resource_group_name     = upper("RGP-${var.location_acronym}-${var.application_acronym}-SHARED-${var.environment_acronym}")
  resource_group_location = var.location
  tags                    = var.tags
}

module "mathworks_rg_client" {
  source                  = "../../modules/resource_group"
  resource_group_name     = upper("RGP-${var.location_acronym}-${var.application_acronym}-${var.client}-${var.environment_acronym}")
  resource_group_location = var.location
  tags                    = var.tags
}