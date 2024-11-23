module "application-rg" {
  source                  = "../../modules12/resource_group/"
  resource_group_name     = var.app_rg_name
  resource_group_location = var.app_location
  tags                    = var.tags
}