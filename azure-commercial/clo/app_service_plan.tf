resource "azurerm_app_service_plan" "appserviceplan" {
  name                = var.environment == "production" ? "cloasp" : "asp-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  location            = module.apprg.resource_group_location
  resource_group_name = module.apprg.resource_group_name

  sku {
    tier              = var.app_service_plan_tier
    size              = var.app_service_plan_size
    capacity          = var.app_service_plan_capacity
  }

  tags                = var.tags
}

