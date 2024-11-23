module "ignite_rg" {
  source                  = "../../modules/resource_group"
  resource_group_name     = "RGP-${upper(var.location)}-${upper(var.tags.Node)}-${upper(var.application_acronym)}-${upper(var.engagement_name)}${var.separator}${upper(var.environment)}"
  resource_group_location = var.rg_location
  tags = var.tags
}