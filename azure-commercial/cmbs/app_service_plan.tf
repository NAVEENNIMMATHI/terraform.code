resource "azurerm_app_service_plan" "appserviceplan" {
  name                         = "asp-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name          = module.cmbsrg.resource_group_name
  location                     = module.cmbsrg.resource_group_location
  kind                         = "FunctionApp"
  maximum_elastic_worker_count = 0
  tags                         = var.tags
  app_service_environment_id   = "/subscriptions/${var.subscription_id}/resourceGroups/${var.sharedrg_resource_group_name}/providers/Microsoft.Web/hostingEnvironments/${var.ase_name}"

  sku {
    capacity = 1
    size     = var.app_service_plan_size
    tier     = "Isolated"
  }

  timeouts {
    create = "3h"
    delete = "120m"
  }
}