module "bastionservice" {
   source                        = "../../modules12/bastion_service"
   pip_name                      = var.bastion_pip_name
   name                          = var.bastion_name
   location                      = module.application-rg.resource_group_location
   resource_group_name           = module.application-rg.resource_group_name
   subnet_id                     = module.bastionsubnet.subnet_id
   public_ip_address_id          = module.bastionservice.id
   tags                          = var.tags
}