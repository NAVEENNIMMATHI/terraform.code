module "databricksrg" {
  source                  = "../../modules/resource_group"
  resource_group_name     = var.environment == "p" ? "co-p-eastus-spidatabricks-rg" : upper("RGP-${var.location_acronym}-${var.project_acronym}-${var.environment_acronym}")
  resource_group_location = var.location
  tags                    = var.tags
}