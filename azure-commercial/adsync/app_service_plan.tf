module "adsyncasp" {
  source                       = "../../modules/app_service_plan"
  app_service_environment_id   = "/subscriptions/${var.coresubscriptionid}/resourceGroups/${var.corevnetresourcegroup}/providers/Microsoft.Web/hostingEnvironments/${var.app_service_environment_name}"
  app_service_plan_name        = "asp-${lower(var.location_acronym)}-${lower(var.application_acronym)}-${lower(var.environment_acronym)}"
  app_service_plan_size        = "I1"
  app_service_plan_tier        = "Isolated"
  resource_group_location      = module.adsyncrg.resource_group_location
  resource_group_name          = module.adsyncrg.resource_group_name
  tags                         = var.tags
}