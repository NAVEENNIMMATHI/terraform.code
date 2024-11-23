resource "azurerm_app_service_plan" "appserviceplan" {
  name                       = "asp-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name        = module.applicationrg.resource_group_name
  location                   = module.applicationrg.resource_group_location
  sku {
    tier                     = var.asp_tier
    size                     = var.asp_size
    capacity                 = var.asp_capacity
  }
  app_service_environment_id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${module.applicationrg.resource_group_name}/providers/Microsoft.Web/hostingEnvironments/${var.ase_name}"
  kind                       = "app"
  timeouts {
    create                   = "3h"
    delete                   = "120m"
  }
  depends_on                 = [azurerm_template_deployment.ase_arm_krt_deployment]

  tags                       = var.tags
}

