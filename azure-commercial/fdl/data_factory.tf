module "dfactory" {
  source                     = "../../modules12/data_factory/"
  name                       = var.df_name
  resource_group_name        = module.application-rg.resource_group_name
  location                   = module.application-rg.resource_group_location
  tags                       = var.tags
}