module "aset_clientvm" {
  for_each                    = var.cmp_clients
  source                      = "../../modules/availability_set"
  availability_set_name       = "avs-${var.location_acronym}-clientvm-${each.value.vm_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name         = module.cmp_rg_client[each.key].resource_group_name
  resource_group_location     = module.cmp_rg_client[each.key].resource_group_location
  platform_fault_domain_count = "2"

  tags = var.tags
}
