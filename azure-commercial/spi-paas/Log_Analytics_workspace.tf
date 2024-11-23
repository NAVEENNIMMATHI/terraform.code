resource "azurerm_log_analytics_workspace" "central_loganalytics" {
  name                = "law-${var.location_acronym}-${var.application_acronym}-central-applogs-${var.environment_acronym}"
  location            = module.applicationrg_central.resource_group_location
  resource_group_name = module.applicationrg_central.resource_group_name
  #sku                 = "Pay-as-you-go"
  retention_in_days   = 90
  tags = var.tags
}