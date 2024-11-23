resource "azurerm_availability_set" "availability_set" {
  for_each = var.application_rg
  name                         = "avs-${each.value.location_acronym}-${var.application_acronym}-${each.value.region}-${var.environment_acronym}"
  resource_group_name          =  module.applicationrg[each.key].resource_group_name
  location                     =  module.applicationrg[each.key].resource_group_location
  managed                      = true
  platform_update_domain_count = 5
  platform_fault_domain_count  = 2
  tags                        = var.tags
}
