resource "azurerm_log_analytics_workspace" "loganalytics_workspace" {
  for_each = var.loganalytics_workspace
  name                = "law-${each.value.location_acronym}-${var.application_acronym}-${each.value.region}-${var.environment_acronym}"
  location            = module.applicationrg[each.key].resource_group_location
  resource_group_name = module.applicationrg[each.key].resource_group_name
  #sku                 = "Pay-as-you-go"
  retention_in_days   = 90
  tags = var.tags
}