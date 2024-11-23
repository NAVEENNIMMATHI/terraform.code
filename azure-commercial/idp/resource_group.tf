module "idp_resource_group" {
  source = "../../modules12/resource_group"

  resource_group_name     = upper("RGP-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}")
  resource_group_location = var.location
  tags                    = var.tags
}