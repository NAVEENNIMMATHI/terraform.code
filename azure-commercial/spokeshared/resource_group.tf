module "sharedrg" {
  source                  = "../../modules12/resource_group"
  resource_group_name     = var.shared_resource_group_name
  resource_group_location = var.shared_rg_location
  tags                    = var.tags
}

