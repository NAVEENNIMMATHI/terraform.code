
resource "azurerm_app_service_plan" "impact_asp" {
  name                = "asp-${var.location_acronym}-${var.application_acronym}${var.environment_acronym}"
  resource_group_name = module.impact_rg.resource_group_name
  location            = module.impact_rg.resource_group_location
  tags                = var.tags

  sku {
    tier     = var.app_service_plan_tier
    size     = var.app_service_plan_size
    capacity = 1
  }

  kind                         = "Linux"
  reserved                     = true
  maximum_elastic_worker_count = 1

  timeouts {
    create = "3h"
    delete = "120m"
  }
}
