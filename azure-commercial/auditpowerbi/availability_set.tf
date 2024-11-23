module "aset_auditwst" {
  source                       = "../../modules12/availability_set"
  availability_set_name        = "avs-use-audit-wst-${lower(var.environment_acronym)}"
  resource_group_location      = module.auditpbirg.resource_group_location
  resource_group_name          = module.auditpbirg.resource_group_name
  platform_fault_domain_count  = "2"
  tags                         = var.tags
}