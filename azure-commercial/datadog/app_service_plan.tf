module "app_service_plan" {
  source                     = "../../modules/app_service_plan"
  app_service_plan_name      = "asp-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  app_service_plan_tier      = var.app_service_plan_tier
  app_service_plan_size      = var.app_service_plan_size
  resource_group_name        = azurerm_resource_group.datadogrg.name
  resource_group_location    = azurerm_resource_group.datadogrg.location
  app_service_environment_id = var.app_service_environment_id
  
  tags                       = var.tags
}