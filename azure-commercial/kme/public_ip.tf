module "agw_public_ip" {
  source                    = "../../modules/public_ip"
  public_ip_name            = "pip-agw-${lower(var.application_acronym)}-${lower(var.environment_acronym)}"
  resource_group_name       = module.applicationrg.resource_group_name
  resource_group_location   = module.applicationrg.resource_group_location
  sku                       = "Basic"
  allocation_method         = "Dynamic"
  tags                      = var.tags
}