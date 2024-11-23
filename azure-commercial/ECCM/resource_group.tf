module "eccm_rg" {
  source                  = "../../modules/resource_group"
  resource_group_name     = "RGP-${upper(var.location_acronym)}-${upper(var.application_acronym)}-${upper(var.environment_acronym)}"
  resource_group_location = var.resource_location
  tags                    = var.tags
}

# module "eccm_rg_aks_node" {
#   source                  = "../../modules/resource_group"
#   resource_group_name     = "RGP-${upper(var.location_acronym)}-${upper(var.application_acronym)}-AKS-NODE-${upper(var.environment_acronym)}"
#   resource_group_location = var.resource_location
#   tags                    = var.tags
# }
