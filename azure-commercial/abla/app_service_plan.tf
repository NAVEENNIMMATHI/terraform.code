module "app_service_plan" {
  source                        = "../../modules12/app_service_plan"
  app_service_plan_name         = "asp-${lower(var.location_acronym)}-${lower(var.application_acronym)}-${lower(var.environment_acronym)}"
  resource_group_name           = module.applicationrg.resource_group_name
  resource_group_location       = module.applicationrg.resource_group_location
  app_service_plan_tier         = "Isolated"
  app_service_plan_size         = "I2"
  app_service_environment_id    = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.terraform_remote_state.shared.outputs.shared_rg_name}/providers/Microsoft.Web/hostingEnvironments/${var.app_service_environment_name}"
  tags                          = var.tags
}