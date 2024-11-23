resource "azurerm_app_service_plan" "appserviceplan" {
  name                = var.environment == "production" ? "copeastuskrtappsrvpln" : "asp-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location

  sku {
    tier     = var.asp_tier
    size     = var.asp_size
    capacity = var.environment == "production" ? 2 : 1
  }

  app_service_environment_id = var.environment == "production" ? "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${module.applicationrg.resource_group_name}/providers/Microsoft.Web/hostingEnvironments/copeastuskrtase01" : "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${module.applicationrg.resource_group_name}/providers/Microsoft.Web/hostingEnvironments/ase-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  tags                       = var.tags
  kind                       = "app"

  timeouts {
    create = "3h"
    delete = "120m"
  }

  depends_on = [azurerm_template_deployment.ase_arm_krt_deployment]
}

