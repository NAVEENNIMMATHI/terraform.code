module "app_service_plan" {
  source                     = "../../modules12/app_service_plan"
  app_service_plan_name      = "asp-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  app_service_plan_tier      = var.app_service_plan_tier
  app_service_plan_size      = var.app_service_plan_size
  resource_group_name        = module.vmap_resource_group.resource_group_name
  resource_group_location    = module.vmap_resource_group.resource_group_location
  app_service_environment_id = data.azurerm_app_service_environment.app_ase.id
  tags                       = var.tags
}