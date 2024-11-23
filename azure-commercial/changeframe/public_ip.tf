#---------------Public IP For Application Gateway 2-----------------------#
module "gateway_2_public_ip" {
  source                    = "../../modules/public_ip"
  public_ip_name            = "pip-appgateway-${var.application_acronym}-${var.environment_acronym}${var.suffix}"
  resource_group_name       = module.applicationrg.resource_group_name
  resource_group_location   = module.applicationrg.resource_group_location
  sku                       = "Basic"
  allocation_method         = "Dynamic"
  idle_timeout_in_minutes   = "10"
  
  tags                      = var.tags
}
