module "corensg" {
  source              = "../../modules12/network_security_group"
  name                = var.core_nsg_name
  location            = module.application-rg.resource_group_location
  resource_group_name = module.application-rg.resource_group_name
  tags                = var.tags
}
module "insightsnsg" {
  source              = "../../modules12/network_security_group"
  name                = var.insights_nsg_name
  location            = module.application-rg.resource_group_location
  resource_group_name = module.application-rg.resource_group_name
  tags                = var.tags
}