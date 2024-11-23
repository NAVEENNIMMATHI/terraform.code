module "igniteappinsights" {
  source              = "../../modules12/application_insights"
  name                = "ais-${var.location}-${var.project_acronym}-${var.engagement_name}${var.separator}${var.environment}"
  location              = module.ignite_rg.resource_group_location
  resource_group_name   = module.ignite_rg.resource_group_name

  tags = var.tags
}
