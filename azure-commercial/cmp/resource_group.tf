
module "cmp_rg_shared" {
  source                  = "../../modules/resource_group"
  resource_group_name     = upper("RGP-${var.location_acronym}-${var.application_acronym}-SHARED-${var.environment_acronym}")
  resource_group_location = var.location

  tags = var.tags
}

module "cmp_rg_client" {
  for_each                = var.cmp_clients
  source                  = "../../modules/resource_group"
  resource_group_name     = upper("RGP-${var.location_acronym}-${var.application_acronym}-${each.key}-${var.environment_acronym}")
  resource_group_location = var.location

  tags = var.tags
}
