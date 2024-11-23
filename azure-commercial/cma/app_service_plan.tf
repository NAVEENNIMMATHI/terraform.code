resource "azurerm_app_service_plan" "appserviceplan" {
  name                = "asp-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name = module.cmarg.resource_group_name
  location            = module.cmarg.resource_group_location
  tags                = var.tags

  sku {
    tier     = var.app_service_plan_tier
    size     = var.app_service_plan_size
    capacity = 1
  }
      
  app_service_environment_id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${var.shared_resource_group_name}/providers/Microsoft.Web/hostingEnvironments/${var.ase_name}"
  kind                       = "Linux"
  reserved                   = true

  timeouts {
    create = "3h"
    delete = "120m"
  }  
}