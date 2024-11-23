resource "azurerm_app_service_plan" "appserviceplan" {
  name                = "asp-${var.location_acronym}-${var.application_name}-${var.environment_acronym}"
  resource_group_name = module.apprg.resource_group_name
  location            = module.apprg.resource_group_location
  tags                = var.tags

  sku {
    tier            = var.asp_tier
    size            = var.asp_size
    capacity        = 1
  }

  app_service_environment_id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${var.sharedrg_resource_group_name}/providers/Microsoft.Web/hostingEnvironments/${var.ase_name}"
  kind                       = "App"

  timeouts {
    create = "3h"
    delete = "120m"
  }
}

