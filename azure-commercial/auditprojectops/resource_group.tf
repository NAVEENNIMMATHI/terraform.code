module "projectops_rg" {
  source                  = "../../modules/resource_group"
  resource_group_name     = upper("RGP-${var.location_acronym}-${var.application_acronym}-1-${var.environment_acronym}")
  resource_group_location = var.location

  tags = var.tags
}