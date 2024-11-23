module "applicationrg" {
  for_each = var.application_rg
  source                  = "../../modules/resource_group"
  resource_group_name     = "RGP-${upper(each.value.location_acronym)}-${upper(var.application_acronym)}-${upper(each.value.region)}APP-${upper(var.environment_acronym)}"
  resource_group_location = each.value.location
  
  tags                    = var.tags
}