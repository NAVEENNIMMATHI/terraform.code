module "applicationrg" {
  source                  = "../../modules/resource_group"
  resource_group_name     = "co-${var.deployment_environment}-spi-${var.application_name}-rg"
  resource_group_location = var.application_rg_location
  tags                    = var.tags
}